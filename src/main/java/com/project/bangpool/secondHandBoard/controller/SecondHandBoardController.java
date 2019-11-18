package com.project.bangpool.secondHandBoard.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.bangpool.common.page.Pagination;
import com.project.bangpool.roommateboard.model.vo.RMBoard;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.project.bangpool.common.Reply;
import com.project.bangpool.secondHandBoard.model.exception.SecondHandBoardException;
import com.project.bangpool.secondHandBoard.model.service.SecondHandBoardService;
import com.project.bangpool.common.page.PageInfo;
import com.project.bangpool.secondHandBoard.model.vo.SecondHandBoard;

@Controller
public class SecondHandBoardController {
	
	@Autowired
	private SecondHandBoardService shbService;
	
	@RequestMapping("shblistView.se")
	public ModelAndView secondHandBoardList(@RequestParam(value="page", required=false) Integer page,
							ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = shbService.getListCount();
		PageInfo pi = Pagination.getPageInfo9(currentPage, listCount);
		
		ArrayList<SecondHandBoard> list = shbService.SelectList(pi);
		
		if(list != null) {
			System.out.println(" pi: "+pi);
			// list, pi --> boardListView
			mv.addObject("list",list);
			mv.addObject("pi",pi);
			mv.setViewName("secondHandListView");
		} else {
			throw new SecondHandBoardException("중고나라 게시글 전체 조회에 실패하였습니다.");
		}
		
		return mv;
		
	}
	
	@RequestMapping("shbinsertView.se")
	public String secondHandInsertView() {
		return "secondHandInsertForm";
	}
	
	@RequestMapping("shbinsert.se")
	public String secondHandBoardInsert(@ModelAttribute SecondHandBoard shb,
							  @RequestParam("uploadFile") MultipartFile uploadFile,
							  HttpServletRequest request) {
		
		System.out.println(shb);
		System.out.println(uploadFile);
		System.out.println(uploadFile.getOriginalFilename());
		
		
//		if(!uploadFile.getOriginalFilename().equals("")) {
		if(uploadFile != null && !uploadFile.isEmpty()) {
			String renameFileName = saveFile(uploadFile, request);
			
			if(renameFileName != null) {
				shb.setShbOrgFileName(uploadFile.getOriginalFilename());
				shb.setShbRenameFileName(renameFileName);
			}
		}
		
		int result = shbService.insertBoard(shb);
		
		if(result>0) {
			return "redirect:shblistView.se";
		}else {
			throw new SecondHandBoardException("중고나라 게시글 작성에 실패하였습니다.");
		}
		
		
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		// 파일이 저장될 경로 설정 : 작은 resources 불러오기
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\buploadFiles";
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()))
								+ "."
								+ originFileName.substring(originFileName.lastIndexOf(".")+1);
		String renamePath = folder + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return renameFileName;
	}
	
	@RequestMapping("shbdetail.se")
	public ModelAndView secondHandBoardDetail(@RequestParam("shbId") int shbId,
											  @RequestParam("page") int page,
											  ModelAndView mv) {
		
		SecondHandBoard board = shbService.selectBoard(shbId);
		
		ArrayList<Reply> reply = shbService.selectReply(shbId);
		
		System.out.println("shbId : " + shbId );
		System.out.println("reply : " + reply);
		
		if(board != null) {
			// board, page --> boardDetailView
			mv.addObject("board", board)
			  .addObject("reply",reply)
			  .addObject("page",page)
			  .setViewName("secondHandDetail"); // 메소드 체이닝
		} else {
			throw new SecondHandBoardException("게시글 상세보기를 실패하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("shbdetail2.se")
	public ModelAndView secondHandBoardDetail2(@RequestParam("shbId") int shbId,
											  ModelAndView mv) {
		
		SecondHandBoard board = shbService.selectBoard(shbId);
		
		System.out.println("shbId : " + shbId );
		
		if(board != null) {
			// board, page --> boardDetailView
			mv.addObject("board", board)
			  .setViewName("secondHandDetail"); // 메소드 체이닝
		} else {
			throw new SecondHandBoardException("게시글 상세보기를 실패하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("shbupView.se")
	public ModelAndView boardUpdateView(@RequestParam("shbId") int shbId,
								  @RequestParam("page") int page,
								  ModelAndView mv) {
		
		SecondHandBoard board = shbService.selectBoard(shbId);
		
		mv.addObject("board", board)
		  .addObject("page",page)
		  .setViewName("secondHandUpdateForm");
		
		return mv;
	}
	
	@RequestMapping("shbupdate.se")
	public ModelAndView SecondHandBoardUpdate(@ModelAttribute SecondHandBoard shb,
											    @RequestParam("page") Integer page,
											    @RequestParam("reloadFile") MultipartFile reloadFile,
											    HttpServletRequest request,
											    ModelAndView mv) {
		
		if(reloadFile != null && !reloadFile.isEmpty()) {
			deleteFile(shb.getShbRenameFileName(), request);
		}
		
		String renameFileName = saveFile(reloadFile, request);
		
		if(renameFileName != null) {
			shb.setShbOrgFileName(reloadFile.getOriginalFilename());
			shb.setShbRenameFileName(renameFileName);
		}
		
		int result = shbService.updateBoard(shb);
		
		if(result > 0) {
			// page --> bdetail
			mv.addObject("page", page).setViewName("redirect:shbdetail.se?shbId="+shb.getShbId());
		} else {
			throw new SecondHandBoardException("게시글 수정에 실패하였습니다.");
		}
		
		return mv;
	}
	
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\buploadFiles";
		
		File f = new File(savePath + "\\" + fileName);
		
		if(f.exists()) {
			f.delete();
		}
	}
	
	@RequestMapping("shbdelete.se")
	public String deleteBoard(@RequestParam("shbId") int shbId,
							  SessionStatus status) {
		
		int result = shbService.deleteBoard(shbId);
		
		if(result>0) {
			return "redirect:shblistView.se";
		} else {
			throw new SecondHandBoardException("게시글 삭제에 실패하였습니다.");
		}
		
	}
	
	@RequestMapping("addReply.se")
	public ModelAndView insertReply(@ModelAttribute Reply reply,
									@RequestParam("page2") int page,
									ModelAndView mv) {
		
		
		System.out.println("reply : "+reply);
//		System.out.println("shbId : "+shbId);
		System.out.println("page : "+page);
		
		
		int result = shbService.insertReply(reply);
		
		int shbId = reply.getRefbId();
		
		if(result>0) {
			
			mv.addObject("page", page).addObject("shbId", shbId).setViewName("redirect:shbdetail.se");
			
		}else {
			throw new SecondHandBoardException("중고나라 게시글 작성에 실패하였습니다.");
		}
		
		return mv;
		
	}
	
	@RequestMapping("deleteReply.se")
	public ModelAndView deleteReply(@RequestParam("shbId") int shbId,
									@RequestParam("rId") int rId,
									@RequestParam("page3") int page,
									ModelAndView mv) {
		
		int result = shbService.deleteReply(rId);		
		
		if(result>0) {
			
			mv.addObject("page", page).addObject("shbId",shbId).addObject("rId", rId).setViewName("redirect:shbdetail.se");
			
		}else {
			throw new SecondHandBoardException("중고나라 게시글 작성에 실패하였습니다.");
		}
		
		return mv;
		
	}
	
	
	
	// 여기부터 카테고리
	@RequestMapping("sofa.se")
	public ModelAndView sofaList(@RequestParam(value="page", required=false) Integer page,
							ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = shbService.getListCount();
		PageInfo pi = Pagination.getPageInfo9(currentPage, listCount);
		
		ArrayList<SecondHandBoard> list = shbService.sofaList(pi);
		
		if(list != null) {
			// list, pi --> boardListView
			mv.addObject("list",list);
			mv.addObject("pi",pi);
			mv.setViewName("secondHandListView");
		} else {
			throw new SecondHandBoardException("중고나라 게시글 전체 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("makeup.se")
	public ModelAndView makeupList(@RequestParam(value="page", required=false) Integer page,
							ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = shbService.getListCount();
		PageInfo pi = Pagination.getPageInfo9(currentPage, listCount);
		
		ArrayList<SecondHandBoard> list = shbService.makeupList(pi);
		
		if(list != null) {
			// list, pi --> boardListView
			mv.addObject("list",list);
			mv.addObject("pi",pi);
			mv.setViewName("secondHandListView");
		} else {
			throw new SecondHandBoardException("중고나라 게시글 전체 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("desk.se")
	public ModelAndView deskList(@RequestParam(value="page", required=false) Integer page,
							ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = shbService.getListCount();
		PageInfo pi = Pagination.getPageInfo9(currentPage, listCount);
		
		ArrayList<SecondHandBoard> list = shbService.deskList(pi);
		
		if(list != null) {
			// list, pi --> boardListView
			mv.addObject("list",list);
			mv.addObject("pi",pi);
			mv.setViewName("secondHandListView");
		} else {
			throw new SecondHandBoardException("중고나라 게시글 전체 조회에 실패하였습니다.");
		}
		
		return mv;
	}

	@RequestMapping("table.se")
	public ModelAndView tableList(@RequestParam(value="page", required=false) Integer page,
			ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = shbService.getListCount();
		PageInfo pi = Pagination.getPageInfo9(currentPage, listCount);
		
		ArrayList<SecondHandBoard> list = shbService.tableList(pi);
		
		if(list != null) {
			// list, pi --> boardListView
			mv.addObject("list",list);
			mv.addObject("pi",pi);
			mv.setViewName("secondHandListView");
		} else {
			throw new SecondHandBoardException("중고나라 게시글 전체 조회에 실패하였습니다.");
		}
		
		return mv;
	}

	@RequestMapping("display.se")
	public ModelAndView displayList(@RequestParam(value="page", required=false) Integer page,
			ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = shbService.getListCount();
		PageInfo pi = Pagination.getPageInfo9(currentPage, listCount);
		
		ArrayList<SecondHandBoard> list = shbService.displayList(pi);
		
		if(list != null) {
			// list, pi --> boardListView
			mv.addObject("list",list);
			mv.addObject("pi",pi);
			mv.setViewName("secondHandListView");
		} else {
			throw new SecondHandBoardException("중고나라 게시글 전체 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	
	// 여기부터 김상욱 꺼
	
	@RequestMapping("topList.se")
	public void boardTopList(HttpServletResponse response) throws IOException {
		
		response.setContentType("application/json; charset=utf-8");
		ArrayList<SecondHandBoard> list = shbService.selectTopList();
		
		JSONArray jArr = new JSONArray();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		System.out.println(list);
		
		for(SecondHandBoard b : list) {
			b.setShbTitle(URLEncoder.encode(b.getShbTitle(),"utf-8"));
			b.setShbRenameFileName(URLEncoder.encode(b.getShbRenameFileName(),"utf-8"));
		}
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list, response.getWriter());
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
