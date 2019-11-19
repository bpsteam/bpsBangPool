package com.project.bangpool.freeboard.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.json.simple.JSONArray;
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
import com.project.bangpool.freeboard.model.exception.FreeBoardException;
import com.project.bangpool.freeboard.model.service.FreeBoardService;
import com.project.bangpool.freeboard.model.vo.FreeBoard;
import com.project.bangpool.housemateboard.model.exception.HMBoardException;
import com.project.bangpool.member.model.vo.Member;
import com.project.bangpool.roommateboard.model.vo.RMBoard;

@Controller
public class FreeBoardController {
	
	@Autowired	//service에 자동으로 객체 만들어주기
	private FreeBoardService frbService;

	/*** 전체 게시글 불러오기 ***/
	@RequestMapping("frblist.fr")
	public ModelAndView boardList(@RequestParam(value="page", required=false) Integer page,
								ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = frbService.getListCount(); // 총 게시물 갯수
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		System.out.println("pi" + pi);
		
		ArrayList<FreeBoard> list = frbService.selectList(pi);
		if(list != null) {
			mv.addObject("list", list).addObject("pi", pi);
			mv.setViewName("freeboardList");
		} else {
			throw new FreeBoardException("게시글 전체 조회 실패하였습니다.");
		}
		return mv;
	}
	
	
	
	
	/*** 게시판 글쓰기 클릭시 넘어갈 화면 ***/
	@RequestMapping("freeinsertView.fr")
	public String insertBoardView() {
		return "freeinsertBoard";
	}
	
	/*** 글쓰기 입력후 등록하기 버튼 누를시. ***/
	@RequestMapping("frbinsert.fr")
	public String boardInsert(FreeBoard hb , 
			 				@RequestParam("uploadFile") MultipartFile uploadFile,
			 				HttpServletRequest request) {
		
		
		System.out.println("갔다오기전 hb : "+ hb);
		System.out.println(uploadFile);
		System.out.println(uploadFile.getOriginalFilename()); 
		
		if(uploadFile != null && !uploadFile.isEmpty()) {	//윗줄과 같은 의미.
			//saveFile(내가 넣을 파일, 넣을위치지정 );
			String renameFileName = saveFile(uploadFile, request);
			
			if(renameFileName != null) {
				hb.setOriginalFileName(uploadFile.getOriginalFilename());  //파일네임지정
				hb.setRenameFileName(renameFileName); // 리네임파일 지정
			}
			System.out.println("파일이름 넣은후 hb : "+ hb);
		}
		
		int result = frbService.insertBoard(hb);

		if (result > 0) {
			return "redirect:frblist.fr";
		} else {
			throw new FreeBoardException("게시글 등록 실패하였습니다.");
		}
		 
	}


	private String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		// 파일이 저장될 경로 설정 ==> webapp 아래에 있는 resources를 데려온다는 의미.
		
		String savePath = root + "\\freeBoardUploadFiles";   
		
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
	
	/*** 게시글 선택시 디테일 화면가기 ***/
	@RequestMapping("frbdetail.fr")
	public ModelAndView boardDetail(@RequestParam("frbId") int hbId, 
									ModelAndView mv) {
		
		FreeBoard frboard = frbService.selectBoard(hbId);
		System.out.println("bdetail frbId : "+ hbId);
		System.out.println("bdetail frboard : "+ frboard);
		
		if(frboard != null) {
			mv.addObject("frboard", frboard)
			  .setViewName("freeboardDetailView");
		} else {
			throw new FreeBoardException("게시글 상세보기 조회 실패하였습니다.");
		}
		return mv;
	}
	
	/*** 게시글 디테일에서 수정하기 화면가기 **/
	@RequestMapping("frbupView.fr")
	public ModelAndView boardUpdateView(@RequestParam("frbId") int hbId,
								  		/*@RequestParam("page") int page,*/ 
										ModelAndView mv) {
		
		FreeBoard frboard = frbService.selectBoard(hbId);
		System.out.println("frbupView에서 db후 frb: "+ frboard);
		
		mv.addObject("frboard", frboard)
		  /*.addObject("page",page)*/
		  .setViewName("freeUpdateForm");
		
		return mv;
	}
	
	
	/*** 정보 입력 후 수정하기 버튼 눌렀을 시 ***/
	@RequestMapping("frbupdate.fr")
	public ModelAndView boardUpdate(@ModelAttribute FreeBoard hb,
							/*@RequestParam("page") Integer page,*/
							@RequestParam("reloadFile") MultipartFile reloadFile,
							HttpServletRequest request,
							ModelAndView mv) {
		
		if(reloadFile != null && !reloadFile.isEmpty()) {
			deleteFile(hb.getRenameFileName(), request);
		}
		
		String renameFileName = saveFile(reloadFile, request);
		
		if(renameFileName != null) {
			hb.setOriginalFileName(reloadFile.getOriginalFilename());
			hb.setRenameFileName(renameFileName);
		}
		System.out.println("frbupdate.fr db전 fhb: "+ hb);
		int result = frbService.updateBoard(hb);
		System.out.println("frbupdate.fr db후 fhb: "+ hb);
		
		if(result > 0) {
			//mv.addObject("page", page).setViewName("redirect:bdetail.bo?bId="+hb.getHbId());
			mv.setViewName("redirect:frbdetail.fr?frbId="+hb.getFrbId());
		} else {
			throw new FreeBoardException("게시글 수정 실패하였습니다.");
		}
		
		return mv;
	}

	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\freeBoardUploadFiles";
		
		File f = new File(savePath + "\\" + fileName);
		
		if(f.exists()) {
			f.delete();	//파일 존재시 삭제
		}
	}
	
	
	/*** 정보 입력 후 삭제하기 버튼 눌렀을 시 ***/
	@RequestMapping("frbdelete.fr")
	public ModelAndView boardDelete(@RequestParam("frbId") int hbId,
			 @RequestParam(value="page", required=false) Integer page, 
									ModelAndView mv) {
		
		int result = frbService.deleteBoard(hbId);
		
		if(result > 0) {
			//mv.addObject("page", page).setViewName("redirect:blist.hm");
			mv.setViewName("redirect:frblist.fr");
		} else {
			throw new FreeBoardException("게시글 삭제 실패하였습니다.");
		}
		
		return mv;
	}
	
	
	//reply 형태 보여주기
	@RequestMapping("frList.fr")
	public void getReplyList(HttpServletResponse response, int hbId) throws JsonIOException, IOException {
		
		response.setContentType("application/json; charset=utf-8");
		ArrayList<Reply> list = frbService.selectReplyList(hbId);
		
		for(Reply r : list) {
			r.setrContent(URLEncoder.encode(r.getrContent(), "utf-8"));
		}
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list, response.getWriter());
	}
	
	//reply data 가져오기
	@RequestMapping("addReply.fr")
	@ResponseBody
	public String addReply(Reply r, HttpSession session) {

		Member loginUser = (Member)session.getAttribute("loginUser");
		String rWriter=loginUser.getName();
		
		r.setrWriter(rWriter);
		
		int result = frbService.insertReply(r);
		
		if(result > 0 ) {
			return "success";
		}else {
			throw new HMBoardException("댓글 등록에 실패하였습니다.");
		}
				
	}
	
	
	//검색 기능
	@RequestMapping("frserach.fr")
	public ModelAndView searchList(ModelAndView mv, 
								@RequestParam(value="page", required=false) Integer page, 
								@RequestParam("searchCondition") String sCondition,
								@RequestParam("searchValue") String sValue) {
		
		HashMap<String, String> searchMap = new HashMap<String, String>();
		searchMap.put("sCondition", sCondition);
		searchMap.put("sValue", sValue);
		System.out.println(searchMap);
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = frbService.getSearchListCount(searchMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		System.out.println("controller에서 다녀온 listCount"+listCount);
		
		ArrayList<FreeBoard> list = frbService.selectSearchList(searchMap, pi);
		System.out.println("controller에서 다녀온 list"+list);
		
		if(list != null) {
			mv.addObject("list",list)
			.addObject("pi", pi)
			.setViewName("freeboardList");
		}else {
			throw new HMBoardException("검색 조회 실패");
		}
		
		return mv;
	}
	
	@RequestMapping("topList.fr")
	public void boardTopList(HttpServletResponse response) throws IOException {
		
		response.setContentType("application/json; charset=utf-8");
		ArrayList<FreeBoard> list = frbService.selectTopList();
		
		JSONArray jArr = new JSONArray();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		System.out.println(list);
		
		for(FreeBoard b : list) {
			b.setFrbTitle(URLEncoder.encode(b.getFrbTitle(),"utf-8"));
		}
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list, response.getWriter());
		
	}
	
	
}


