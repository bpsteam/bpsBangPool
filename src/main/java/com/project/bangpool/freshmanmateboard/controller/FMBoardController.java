package com.project.bangpool.freshmanmateboard.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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
import com.project.bangpool.comment.model.vo.Reply;
import com.project.bangpool.common.Pagination;
import com.project.bangpool.freshmanmateboard.model.exception.FMBoardException;
import com.project.bangpool.freshmanmateboard.model.service.FMBoardService;
import com.project.bangpool.freshmanmateboard.model.vo.FMBoard;
import com.project.bangpool.freshmanmateboard.model.vo.PageInfo;
import com.project.bangpool.freshmanmateboard.model.vo.PiBoard;
import com.project.bangpool.member.model.vo.Member;
import com.project.bangpool.roommateboard.model.exception.BoardException;


@Controller
public class FMBoardController {
	

	@Autowired // boardservice에 알아서 객체만들어서 쏴준다. 
	private FMBoardService fbService;

	@RequestMapping("blist.fm")
	public ModelAndView boardList(@RequestParam(value="page", required=false) Integer page, 
								ModelAndView mv, @RequestParam("fLocation") String location) {
		
		System.out.println("blist location 출력 : " +location);
		if(location.equals("전체")) {
			location = null;
		}
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = fbService.getListCount(location);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<FMBoard> list = fbService.selectFMList(location, pi);
		
		if(list != null ) {
			System.out.println("리스트불러오기 성공하고 페이지 출력 "+pi);
			//  list, pi --> boardListView
			mv.addObject("list", list);
			mv.addObject("pi", pi).addObject("location",location);
			mv.setViewName("fmBoardList");
		}else {
			throw new FMBoardException("게시글 전체 조회 실패");
		}
		return mv;
		
	}
	

	@RequestMapping("tablist.fm")
	public void tabBoardList(@RequestParam(value="page", required=false) Integer page,
						HttpServletResponse response,String fLocation) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");
		
		System.out.println("blist location 출력 : " +fLocation);
		
		String location = fLocation.trim();
		
		if(location.equals("전체")) {
			location = null;
		}

		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = fbService.getListCount(location);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		System.out.println("탭리스트에서 페이지 pi정보 "+pi);
		ArrayList<PiBoard> list = fbService.selectList(location, pi);
		System.out.println(list);
		
		JSONArray jArr = new JSONArray();
		for(PiBoard b : list) {
			
			b.setBoardLimit(pi.getBoardLimit());
			b.setEndPage(pi.getEndPage());
			b.setListCount(pi.getListCount());
			b.setCurrentPage(pi.getCurrentPage());
			b.setMaxPage(pi.getMaxPage());
			b.setStartPage(pi.getStartPage());
			b.setPageLimit(pi.getPageLimit());
		}
		
		for(PiBoard b : list) {
			JSONObject board = new JSONObject();
			
			board.put("fbId", b.getFbId());
			board.put("fLocation", b.getfLocation());
			board.put("fbTitle", b.getFbTitle());
			board.put("fbCount", b.getFbCount());
			board.put("fbWriter", b.getFbWriter());
			
			board.put("boardLimit", b.getBoardLimit());
			board.put("endPage", b.getEndPage());
			board.put("listCount", b.getListCount());
			board.put("currentPage", b.getCurrentPage());
			board.put("maxPage", b.getMaxPage());
			board.put("startPage", b.getStartPage());
			board.put("pageLimit", b.getPageLimit());
	        
	        jArr.add(board);
	        
	  //      System.out.println("jsonarray: "+board);
		}
		
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		map.put("list", list);
//		map.put("pi", pi);
		
//		mv.addAllObjects(map);
//		mv.setViewName("jsonView");
//		
//		response.setContentType("application/json; charset=utf-8");
		
//		return mv;
		
//		return map;
		
		JSONObject sendJson = new JSONObject();
		sendJson.put("list",jArr);
//		sendJson.put("pi", pi);
//		
//		JSONObject real = new JSONObject();
//		real.put("real", sendJson);
//		
		PrintWriter out = response.getWriter();
		out.print(sendJson);
		out.flush();
		out.close();
		
		
		
		//model.addAttribute("tabPi", pi);
//		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
//		gson.toJson(list, response.getWriter());
//		gson.toJson(pi, response.getWriter());
	}

	
	@RequestMapping("insertview.fm")
	public String boardInsertView() {
		return "fmInsertBoard";
		
	}
	
	@RequestMapping("binsert.fm")
	public ModelAndView insertBoard(@ModelAttribute FMBoard b, @RequestParam("phone1")String phone1,
							@RequestParam("phone2")String phone2, @RequestParam("phone3")String phone3,
							@RequestParam("uploadFile") MultipartFile uploadFile, HttpServletRequest request,ModelAndView mv) {
		
		b.setContactInfo(phone1+"-"+phone2+"-"+phone3);

		System.out.println(uploadFile);
		System.out.println(uploadFile.getOriginalFilename());
		
		if(uploadFile != null && !uploadFile.isEmpty()) { // 로 쓸 수 있다. 
			String renameFileName = saveFile(uploadFile, request); // saveFile 메소드로 넘어가서 반환값 받아오기
			
			if(renameFileName != null) {
				b.setOriginalFileName(uploadFile.getOriginalFilename());
				b.setRenameFileName(renameFileName);
				// System.out.println("인서트정보 파일이랑 같이 들어오는지? "+ b); // 들어온다 
			}
		}

		int result = fbService.insertBoard(b);
	
		if(result>0) {
			mv.addObject("fLocation",b.getfLocation()).setViewName("redirect:blist.fm");
		}else {
			throw new FMBoardException("게시글등록실패 ");
		}
		
		return mv;
		
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources"); 
		System.out.println("루트 : " + root);
		String savePath = root + "/fmboarduploads"; 
		System.out.println("저장경로 : " + savePath);
	
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs(); // buploadFiles folder가없으면 만들어준다. 
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss"); // millisecond -> yyyyMMddHHmmssSSS
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()))
								+"."
								+originFileName.substring(originFileName.lastIndexOf(".")+1); // .확장자 가지고옴
		
		String renamePath = folder + "/" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath)); // 전달받은 rename파일을 file에 덮어쓴다. 
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return renameFileName;
	}
	
	
	@RequestMapping("bdetail.fm")
	public ModelAndView selectOneBoard(@RequestParam("fbId") int fbId, ModelAndView mv,
										HttpSession session) {

		
		System.out.println("디테일뷰 보드 출력 fbId : "+fbId);
		FMBoard board = fbService.selectBoard(fbId);

		if(board != null) {
			System.out.println("디테일뷰 정보하나 불러오기 성공 "+board);
			//System.out.println("세션은 들어오나? "+session.getAttribute("loginUser"));
			// board, page --> boardDetailView
			mv.addObject("board", board)
			.setViewName("fmBoardDetailView"); // method chaining 
		}else {
			throw new FMBoardException("게시글 상세보기를 실패하였습니다.");
		}
		
		return mv;
		
	}
	
	@RequestMapping("bupView.fm")
	public ModelAndView updateBoard(@RequestParam("fbId") int fbId, ModelAndView mv) {
		
		System.out.println("bupdate.fm/fbId : "+fbId);
		FMBoard b = fbService.selectBoard(fbId);
		
		System.out.println("bupdate.fm/b : " + b);
		
		String contact =  b.getContactInfo();
		String[] phone = new String[3];
		if(contact != null) {
			phone =contact.split("-");
		}
		mv.addObject("board",b).addObject("phone1",phone[0]).addObject("phone2",phone[1]).addObject("phone3",phone[2]).
		setViewName("fmUpdateBoard");
		
		return mv;
		
	}
	
	@RequestMapping("bdelete.fm")
	public String deleteBoard(@RequestParam("fbId") int fbId) {
		int result = fbService.deleteBoard(fbId);
		
		if(result>0) {
			return "redirect: blist.fm";
		}else {
			throw new FMBoardException("삭제실패");
		}
	}
	
	@RequestMapping("bupdate.fm")
	public ModelAndView updateBoard(@ModelAttribute FMBoard b, @RequestParam("phone1")String phone1,
			@RequestParam("phone2")String phone2, @RequestParam("phone3")String phone3, @RequestParam("reloadFile") MultipartFile reloadFile, 
							HttpServletRequest request, ModelAndView mv) {
		
		b.setContactInfo(phone1+"-"+phone2+"-"+phone3);

		System.out.println("bupdate.fm / b : "+b);
		System.out.println("bupdate.fm / reloadFile : "+reloadFile);
		
		if(reloadFile != null && !reloadFile.isEmpty()) {
			deleteFile(b.getRenameFileName(), request); // 파일삭제하는 메소드 만들기
		}
		
		String renameFileName = saveFile(reloadFile, request);
		
		if(renameFileName != null) {
			b.setOriginalFileName(reloadFile.getOriginalFilename());
			b.setRenameFileName(renameFileName);
		}
		
		System.out.println("파일네임 수정 됐어? : "+b);
		
		int result = fbService.updateBoard(b);
		
		if(result>0) {
			// page --> bdetail
			mv.setViewName("redirect:bdetail.fm?fbId=" + b.getFbId());
		}else {
			throw new FMBoardException("게시글 수정에 실패하였습니다.");
		}
		
		
		return mv;
	}
	

	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/fmboarduploads"; 
		
		File f = new File(savePath+"/"+fileName);
		
		if(f.exists()) { 
			f.delete();  
		}
	}
	
	@RequestMapping("addReply.fm")
	@ResponseBody
	public String addReply(Reply r, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String rWriter = loginUser.getNickname();
		
		r.setrWriter(rWriter);
		r.setbCode("FMBCODE");
		
		System.out.println("댓글불러오기 : "+ r);
		int result = fbService.insertReply(r);
		
		if(result>0) {
			return "success";
			
		}else {
			throw new BoardException("댓글등록실패");
		}
		
	}
	
	
	@RequestMapping("rList.fm")
	public void getReplyList(HttpServletResponse response, int fbId) throws JsonIOException, IOException {
		
		response.setContentType("application/json; charset=utf-8");
		
		ArrayList<Reply> list = fbService.selectReplyList(fbId);
		
		for(Reply r : list) {
			r.setrContent(URLEncoder.encode(r.getrContent(), "utf-8"));
		}
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list, response.getWriter());
		
	}
	
	
}


