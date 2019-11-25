package com.project.bangpool.share.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.project.bangpool.common.Reply;
import com.project.bangpool.common.page.PageInfo;
import com.project.bangpool.common.page.Pagination;
import com.project.bangpool.member.model.vo.Member;
import com.project.bangpool.share.model.service.ShareService;
import com.project.bangpool.share.model.vo.Share;

@Controller
public class ShareController {
	
	@Autowired
	private ShareService srService;
	
	@RequestMapping("srListView.sr")
	public ModelAndView shareList(@RequestParam(value="page", required=false) Integer page,
								  @RequestParam(value="srLocation", required=false) String sLoc,
								  ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = srService.getListCount(sLoc);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Share> list = srService.selectList(pi,sLoc);
		
		if(list != null) {
			mv.addObject("list",list)
			  .addObject("pi",pi)
			  .addObject("sLoc",sLoc)
			  .setViewName("shareList");
		}
		
		
		return mv;
	}
	
	
	@RequestMapping("srInsertForm.sr")
	public String shareInsertForm() {
		
		return "shareInsertForm";
		
	}
	
	@RequestMapping("srInsert.sr")
	public ModelAndView shareInsert(@ModelAttribute Share s,
									@RequestParam(value="page", required=false) Integer page,
								    @RequestParam(value="srLocation", required=false) String sLoc,
								    @RequestParam("uploadFile") MultipartFile uploadFile,
								    ModelAndView mv,
								    HttpServletRequest request,
								    HttpSession session) {

	
 		if(uploadFile != null && !uploadFile.isEmpty()) {

			String renameFileName = saveFile(uploadFile, request);
			
			if(renameFileName != null) {
				s.setOriginalFileName(uploadFile.getOriginalFilename());
				s.setRenameFileName(renameFileName);
			}
		}

		
		int result = srService.shareInsert(s);
		
		if(result>0) {
			mv.setViewName("redirect:srListView.sr");
			return mv;
		}
			return mv;
		
	}
	
	@RequestMapping("srdetail.sr")
	public ModelAndView shareDetail(@RequestParam("srbId") int srbId,
							  ModelAndView mv) {
		ArrayList<Member> m = new ArrayList<Member>();
		
		m = srService.countMember(srbId);
	
		SimpleDateFormat srDate = new SimpleDateFormat("yyyy년 MM월 dd일");
		
		Share s = srService.shareDetail(srbId);
		
		/*s.setSrEventEnterCount(m.size());*/
		
		String srStartDate = srDate.format(s.getSrStartDate());
		String srEndDate = srDate.format(s.getSrEndDate());
		
		srStartDate += " " + s.getSrStartHour()+"시 00분";
		srEndDate += " " + s.getSrEndHour()+"시 59분";
		
		double chance = 100;
		
		if(s.getSrEventEnterCount() != 0) {
			chance = s.getSrEventLimit()*100/s.getSrEventEnterCount();
			if(chance >100) {
				chance = 100;
			}
		}
		
		if(s != null) {
			
			mv.addObject("share", s)
			  .addObject("chance",chance)
			  .addObject("srStartDate",srStartDate)
			  .addObject("srEndDate",srEndDate)
			  .setViewName("shareDetailView");
			
		}
		
		
		return mv;
	}
	
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "\\srBoardUploadFiles";   
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();  //해당하는 폴더가 없다면 폴더를 만들어주는 메소드.
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()))
								+ "." 
								+ originFileName.substring(originFileName.lastIndexOf(".") + 1);
								// '.' 붙여서 확장자 갖고 옴.
		String renamePath = folder + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));  // 전달받은 리네임한걸로 파일을 덮어쓰겠다는 의미.
		}  catch (Exception e) {
			e.printStackTrace();
		}
		
		return renameFileName;
	}
	
	
	@RequestMapping("reply_list.sr")
	public void reply_list(HttpServletResponse response, int refbId) throws JsonIOException, IOException {

		ArrayList<Reply> list = srService.selectReplyList(refbId);
		for(Reply r: list) {
			
			r.setrWriter(URLEncoder.encode(r.getrWriter(),"utf-8"));
			r.setrContent(URLEncoder.encode(r.getrContent(),"utf-8"));
			
		}
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list, response.getWriter());
	}
	
	
	@RequestMapping("reply_insert.sr")
	@ResponseBody
	public String reply_insert(Reply r, Member m, HttpSession session) {
		String rWirter = m.getNickname();
		
		int result = srService.insertReply(r);
		
		if(result>0) {
			return "success";
		}else {
			return "error";
		}

	}
	
	@RequestMapping("reply_event_insert.sr")
	@ResponseBody
	public String reply_event_insert(Reply r, 
						             Member m,
						             @RequestParam("refbId") String refbId) {

		String listNickname ="";
		String MemberNickname =m.getNickname();
		
		ArrayList<Member> list = new ArrayList<Member>();
		list = srService.selectMember(r);
		
		System.out.println("list : " + list);
		System.out.println("member : "+m.getNickname());
		System.out.println("listSIZE: "+list.size());
		
		if(list.size()>0) {
			
			for(int i =0; i<list.size();i++) {
				System.out.println(i);
				listNickname = list.get(i).getNickname();
				System.out.println("list : "+ list.get(i).getNickname());
				System.out.println("member : "+m.getNickname());
				/*list.get(i).getNickname().equals(m.getNickname())*/
				if(listNickname.equals(MemberNickname)) {
					return "error";
				}
			}
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("refbId",refbId );
		map.put("nickname",m.getNickname() );
		map.put("rWriter",m.getNickname() );
		map.put("rContent",r.getrContent() );
		
		int result = srService.insertReplt_event(map);
		int eventMemberUpdate = srService.eventMemberUpdate(refbId);
		
		if(result>0) {
			return "success";
		}
	
		return "";
	
	}
	
  @RequestMapping("share_winner.sr")
  @ResponseBody
  public String share_winner(@RequestParam("srbId") int srbId) {	  
	  
	  Share s = new Share();
	  ArrayList<Member> list = new ArrayList<Member>();
	  list = srService.selectEventMember(srbId);
	  
	  if(list.size() <=0) {
		  return "error";
	  }else {
		  
		  int random = (int)(Math.random()*(list.size()-1));
		  Member m = new Member();
		  
		  m = list.get(random);
		  
		  s.setSrbId(srbId);
		  s.setSrWinner(m.getNickname().toString());
		  
		  if(list !=null) {
			  int result = srService.insertWinner(s);
		  }
		  
		  return "success";
	  }
	  
  }
  
	@RequestMapping("rDeleteA.sr")
	public ModelAndView reply_Delete(@RequestParam("srbId") String srbId,
									 @RequestParam("rId") int rId,
									 @RequestParam("nickname") String nickname,
									 ModelAndView mv
									){
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		int result = srService.deleteReply(rId);
		
		if(result>0) {
			
			result = srService.deleteReplyEvent(rId);
			
			mv.setViewName("redirect:srdetail.sr?srbId="+srbId);
			
		}
		
		
		return mv;
	}
	
	

}
