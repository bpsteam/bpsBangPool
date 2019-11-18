package com.project.bangpool.roommateboard.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.project.bangpool.common.SearchCondition;
import com.project.bangpool.common.page.PageInfo;
import com.project.bangpool.common.page.Pagination;
import com.project.bangpool.member.model.vo.Member;
import com.project.bangpool.roommateboard.model.exception.RMBoardException;
import com.project.bangpool.roommateboard.model.service.RMBoardService;
import com.project.bangpool.roommateboard.model.vo.RMBoard;

@Controller
public class RMBoardController {
	
	@Autowired
	private RMBoardService rbService;

	@RequestMapping("blist.rm")
	public ModelAndView boardList(@RequestParam(value="page", required=false) Integer page, 
								  @RequestParam(value="loc", required=false) String loc,
								  ModelAndView mv) {
		System.out.println("loc:"+loc);
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		// 총 게시글 개수
		int listCount = rbService.getListCount(loc);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		System.out.println("selectList loc: "+loc);
		ArrayList<RMBoard> list = rbService.selectList(pi, loc);
		
		if(list != null) {
			System.out.println("rbService list : "+list);
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("rmboardList");
		}else {
			throw new RMBoardException("게시글 전체 조회 실패");
		}
		return mv;
	}
	
	
	@RequestMapping("binsert.rm")
	public String insertBoard(@ModelAttribute RMBoard b,
							  @RequestParam("uploadFile") MultipartFile uploadFile,
							  HttpServletRequest request) {
		
		System.out.println("uploadFile:"+uploadFile);
		System.out.println(uploadFile.getOriginalFilename()); // 업로드 한 파일 현 이름으로 출력
		
		if(uploadFile != null && !uploadFile.isEmpty()) {
			String renameFileName = saveFile(uploadFile, request);
			
			if(renameFileName != null) {
				b.setOriginalFileName(uploadFile.getOriginalFilename());
				b.setRenameFileName(renameFileName);
			}
		}
		
		System.out.println("b"+b);
		
		int result = rbService.insertBoard(b);
		
		if(result > 0) {
//			return "rmBoard";
			System.out.println("파일 업로드 및 insert 성공");
			return "redirect:blist.rm";
		}else {
			throw new RMBoardException("게시글 등록 실패");
		}
	}
	
	
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		// 파일이 저장될 경로
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\rmboarduploads";
		
		File folder = new File(savePath);
		// 폴더가 없으면 folder 만들어라.
		if(!folder.exists()) {
			folder.mkdir();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()))
								+"."
								+ originFileName.substring(originFileName.lastIndexOf(".")+1);
		
		String renamePath = folder + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
			// 전달받은 파일 new File(renamePath) 로 rename한거 덮어 쓰겠다.
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return renameFileName;
	}


	@RequestMapping("binsertview.rm")
	public String insertViewBoard() {
		return "rminsertBoard";
	}
	
	@RequestMapping("bupView.rm")
	public ModelAndView boardUpdateView(@RequestParam("rbId") int rbId,
//								@RequestParam("page") int page,
								ModelAndView mv) {
		
		RMBoard rboard = rbService.selectBoard(rbId);
		
		mv.addObject("rboard", rboard)
//		  .addObject("page", page)
		  .setViewName("rmupdateBoard");
		
		return mv;
	}
	
	
	@RequestMapping("bdetail.rm")
	public ModelAndView selectOneBoard(@RequestParam("rbId") int rbId,
									// @RequestParam("page") int page,
									  ModelAndView mv) {
		
		RMBoard board = rbService.selectBoard(rbId);
		
		if(board != null) {
			mv.addObject("rboard", board)
			  .setViewName("rmboardDetailView");
		}else {
			throw new RMBoardException("게시글 상세보기 실패");
		}
		
		return mv;
	}
	
	@RequestMapping("bupdate.rm")
	public ModelAndView boardUpdate(@ModelAttribute RMBoard b,
//									@RequestParam("page") Integer page,
									@RequestParam("reloadFile") MultipartFile reloadFile,
									HttpServletRequest request,
									ModelAndView mv) {
		
		if(reloadFile != null && !reloadFile.isEmpty()) {
			// 기존 필요없는 파일 지우기
			deleteFile(b.getRenameFileName(), request);
		}
		
		String renameFileName = saveFile(reloadFile, request);
		
		if(renameFileName != null) {
			b.setOriginalFileName(reloadFile.getOriginalFilename());
			b.setRenameFileName(renameFileName);
		}
		
		
		int result = rbService.updateBoard(b);
		
		if(result > 0) {
			// page가지고 --> bdetail [수정된 거 보여주기]
//			mv.addObject("page", page).setViewName("redirect:bdetail.rm?rbId="+b.getRbId());
			mv.setViewName("redirect:bdetail.rm?rbId="+b.getRbId());
		}else {
			throw new RMBoardException("게시글 수정에 실패");
		}
		
		return mv;
	}
	
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\rmboarduploads";
		
		File f = new File(savePath + "\\" + fileName);
		
		// 파일 존재하면 삭제
		if(f.exists()) {
			f.delete();
		}
	}
	
	@RequestMapping("rList.rm")
	public void getReplyList(HttpServletResponse response, int rbId) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");
		ArrayList<Reply> list = rbService.selectReplyList(rbId);
		
		System.out.println("Controller"+rbId);
		System.out.println("Controller list"+list);
		
		for(Reply r : list) {
			r.setrContent(URLEncoder.encode(r.getrContent(), "utf-8"));
			// Encoding한거 DetailView.jsp에서 Decoding
		}
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list, response.getWriter());
	}
	
	@RequestMapping("addReply.rm")
	@ResponseBody
	public String addReply(Reply r, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String rWriter = loginUser.getNickname();
		
		r.setrWriter(rWriter);
		
		int result = rbService.insertReply(r);
		
		if(result > 0) {
			return "success";
			// jsp파일로 보내는거 말고 값을 보내는거 : @ResponseBody
		}else {
			throw new RMBoardException("댓글 등록에 실패");
		}
	}
	
	// 게시글 삭제
	@RequestMapping("bdelete.rm")
	public String deleteBoard(@RequestParam("rbId") int rbId) {
		int result = rbService.deleteBoard(rbId);
		
		if(result > 0) {
			return "redirect:blist.rm";
		}else {
			throw new RMBoardException("게시글 삭제 실패");
		}
	}
	
	@RequestMapping("bsearch.rm")
	public ModelAndView searchBoard(
							  @RequestParam("searchCondition") String condition,
							  @RequestParam("searchValue") String value,
							  @RequestParam(value="page", required=false) Integer page,
							  @ModelAttribute SearchCondition sc,
							  ModelAndView mv,
							  HttpServletRequest request) {
		
//		SearchCondition sc = new SearchCondition();
		if(condition.equals("swriter")) sc.setSwriter(value);
		else if(condition.equals("stitle")) sc.setStitle(value);
		else if(condition.equals("scontent")) sc.setScontent(value);
		
//		if(sc.equals("writer")) sc.setWriter(swriter);
//		else if(sc.equals("title")) sc.setTitle(stitle);
//		else if(sc.equals("content")) sc.setContent(scontent);
//		System.out.println("condition 값???"+condition);
		System.out.println("searchValue값 ???"+value);
		
		System.out.println("sc 값 들어오니????"+sc);
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
			
		/*if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}*/
			
		
//		try {
			int listCount = rbService.getSearchResultListCount(sc);
			
			System.out.println("listCount???"+listCount);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			ArrayList<RMBoard> list = rbService.selectSearchResultList(sc,pi);
			
			System.out.println("searchController 값 오나????"+list);
			
			if(list != null) {
				mv.addObject("list", list);
				mv.addObject("pi", pi);
				mv.addObject("searchCondition", condition);
				mv.addObject("searchValue", value);
				mv.setViewName("rmboardList");
				
			}else {
				throw new RMBoardException("검색 결과 리스트 조회 실패");
			}
			
//			request.setAttribute("list", list);
//			request.setAttribute("pi", pi);
//			request.setAttribute("searchCondition", condition);
//			request.setAttribute("searchValue", value);
			// 페이지 넘어가도 검색결과 계속 나오게
			
//		} catch (RMBoardException e) {
//			e.printStackTrace();
//		}
		
		return mv;
	}
	
	
	// 여기부터 김상욱 꺼
	
	@RequestMapping("topList.rm")
	public void boardTopList(HttpServletResponse response) throws IOException {
		
		response.setContentType("application/json; charset=utf-8");
		ArrayList<RMBoard> list = rbService.selectTopList();
		
		JSONArray jArr = new JSONArray();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		System.out.println(list);
		
		for(RMBoard b : list) {
			b.setRbTitle(URLEncoder.encode(b.getRbTitle(),"utf-8"));
		}
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list, response.getWriter());
		
	}
	
}
