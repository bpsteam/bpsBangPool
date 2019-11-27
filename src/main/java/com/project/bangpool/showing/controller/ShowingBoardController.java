package com.project.bangpool.showing.controller;

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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.project.bangpool.common.page.Pagination;
import com.project.bangpool.common.Reply;
import com.project.bangpool.member.model.vo.Member;
import com.project.bangpool.roommateboard.model.vo.RMBoard;
import com.project.bangpool.showing.model.exception.ShowingException;
import com.project.bangpool.showing.model.service.ShowingService;
import com.project.bangpool.common.page.PageInfo;
import com.project.bangpool.showing.model.vo.Showing;

@SessionAttributes("loginUser")
@Controller
public class ShowingBoardController {
	
	@Autowired
	private ShowingService sService;
	
	@RequestMapping("bShowing.sb")
	public ModelAndView bShowingBoard(
		@RequestParam(value = "page", required = false)Integer page, 
		ModelAndView mv) {

		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int listCount = sService.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Showing> list = sService.selectList(pi);
		if(list != null){
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("showingBoardList");
		} else {
			throw new ShowingException("게시글 전체 조회에 실패하여습니다.");
		}
		return mv;
	}
	
	@RequestMapping("binsertShowing.sb")
	public String binsertShowing() {
		return "insertShowingBoard";
	}
	
	@RequestMapping("binsertShowingBoard.sb")
	public String binsertShowingBoard(@ModelAttribute Showing sb,
									  @RequestParam("uploadFile[]") ArrayList<MultipartFile> uploadFile,
									  HttpServletRequest request) {

		String[] renameFileName = new String[uploadFile.size()];
		
		// 배열 초기화		
		for(int i = 0; i < renameFileName.length; i++) {
			renameFileName[i] = "";
		}
		
		String fileName="";
		String renameFile="";
		
		for(int i = 0; i < uploadFile.size(); i ++) {
			if(i < uploadFile.size()-1)
				fileName += String.valueOf(uploadFile.get(i).getOriginalFilename())+";";
			else
				fileName += String.valueOf(uploadFile.get(i).getOriginalFilename());
		}
		
		String sbwriter = request.getParameter("sbwriter");
		sb.setSbwriter(sbwriter);
		
		if(uploadFile != null && uploadFile.size() > 0) {
			for(int i = 0; i < uploadFile.size(); i++) {
				if(i < uploadFile.size()-1)
					renameFileName[i] += saveFile(uploadFile.get(i), request)+";";
				else
					renameFileName[i] += saveFile(uploadFile.get(i), request);
			}
			
			for(int i = 0 ; i < renameFileName.length; i++) {
				renameFile+=renameFileName[i];
			}
			if(renameFileName != null) {
				sb.setOriginalFileName(fileName);
				sb.setRenameFileName(renameFile);
			}
		}
		int result = sService.insertShowingBoard(sb);
		if (result > 0) {
			return "redirect:bShowing.sb";
		}else {
			throw new ShowingException("게시글 전체 조회에 실패 하였습니다.");
		}
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
	
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\showinguploadFiles";
		String savePath2 = root + "\\attboarduploads";
		
		
		File folder = new File(savePath);
		File folder2 = new File(savePath2);
		
		if(!folder.exists()) {
			folder.mkdir();
		}
		
		if(!folder2.exists()) {
			folder2.mkdir();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) +
				originFileName.substring(0,originFileName.lastIndexOf(".") + 1) 
				+ originFileName.substring(originFileName.lastIndexOf(".") + 1);
		String renamePath = folder + "\\" + renameFileName;
		String renamePath2 = folder2 + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
			file.transferTo(new File(renamePath2));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return renameFileName;
	}

	@RequestMapping("ddetailShowing.sb")
	public ModelAndView bdetailShowingBoard(@RequestParam("sbId") int sbId,
											@RequestParam("page") int page,
											ModelAndView mv) {
		
		Showing showing = sService.selectShowing(sbId);
		if(showing != null) {
			mv.addObject("showing", showing)
			.addObject("page", page)
			.setViewName("detailShowingBoard");
		}else {
			throw new ShowingException("게시글 전체 조회에 실패하여습니다.");
		}
		return mv;
	}
	// 김상욱 메소드 추가
	@RequestMapping("ddetailShowing2.sb")
	public ModelAndView bdetailShowingBoard(@RequestParam("sbid") int sbid,
										ModelAndView mv) {
		
		Showing showing = sService.selectShowing(sbid);
		if(showing != null) {
			mv.addObject("showing", showing)
			.setViewName("detailShowingBoard");
		}else {
			throw new ShowingException("게시글 전체 조회에 실패하여습니다.");
		}
		return mv;
	}
	
	@RequestMapping("deleteShowing.sb")
	public String deleteShowing(@RequestParam("sbId") int sbId) {
		int result = sService.deleteShowing(sbId);
		if(result>0) {
			return"redirect:bShowing.sb";
		} else {
			throw new ShowingException("게시판 삭제를 실패 하였습니다.");
		}
	}
	
	@RequestMapping("updateView.sb")
	public ModelAndView showingUpdateView(@RequestParam("sbId") int sbId,
											@RequestParam("page") int page,
											ModelAndView mv) {
		
		Showing showing = sService.selectShowing(sbId);
		mv.addObject("Showing", showing)
		.addObject("page", page)
		.addObject("sbId",sbId)
		.setViewName("updateShowingBoard");
		
		return mv;
		
	}

	@RequestMapping("updateShowing.sb")
	public ModelAndView showingUpdate(@ModelAttribute Showing sb,
										@RequestParam("sbId") int sbId,
										@RequestParam("page") int page,
										@RequestParam("reloadFile[]") ArrayList<MultipartFile> reloadFile,
										HttpServletRequest request,
										ModelAndView mv) {
		
		String renameFileName="";
		String originFileName="";
		
		sb.setSbid(sbId);
		
		for(int i = 0 ; i < reloadFile.size(); i++) {
			if(i < reloadFile.size()-1)
				originFileName += String.valueOf(reloadFile.get(i).getOriginalFilename())+";";
			else
				originFileName += String.valueOf(reloadFile.get(i).getOriginalFilename());
		}
		
		if(reloadFile != null && reloadFile.size() > 0) {
			deleteFile(sb.getRenameFileName(), request);
		}
		
		for(int i = 0; i < reloadFile.size(); i++) {
			if(i<reloadFile.size()-1)
				renameFileName += saveFile(reloadFile.get(i) , request)+";";
			else
				renameFileName += saveFile(reloadFile.get(i) , request);
		}
		
		if(renameFileName != null) {
			sb.setOriginalFileName(originFileName);
			sb.setRenameFileName(renameFileName);
		}
		
		int result = sService.updateShowing(sb);
		if(result > 0) {
			mv.addObject("page" , page).setViewName("redirect:bShowing.sb?sbId=" + sb.getSbid());
		}
		else {
			throw new ShowingException("게시글 수정에 실패하였습니다!");
		}
		
		return mv;
	}
	
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\showinguploadFiles";
		
		File f = new File(savePath + "\\" + fileName);
		
		if(f.exists()) {
			f.delete();
		}
	}
	
	@RequestMapping("addReply.sb")
	@ResponseBody
	public String addReply(Reply r, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String rWriter = loginUser.getName();
		r.setrWriter(rWriter);
		int result = sService.insertReply(r);
		if(result>0) {
			return "success";
		} else {
			throw new ShowingException("댓글 등록에 실패 하였습니다.");
		}
	}
	
	@RequestMapping("rList.sb")
	public void getReplyList(HttpServletResponse response, int sbId) throws JsonIOException, IOException {
		ArrayList<Reply> list = sService.selectReplyList(sbId);
		for(Reply r : list) {
			r.setrWriter(URLEncoder.encode(r.getrWriter(),"utf-8"));
			r.setrContent(URLEncoder.encode(r.getrContent(),"utf-8"));
		}
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list, response.getWriter());
	}
	
	@RequestMapping("topList.sb")
	public void boardTopList(HttpServletResponse response) throws IOException {
		
		response.setContentType("application/json; charset=utf-8");
		ArrayList<Showing> list = sService.selectTopList();
		
		JSONArray jArr = new JSONArray();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		for(Showing b : list) {
			
			if(b.getRenameFileName().contains(";")) {
				
				String[] name = b.getRenameFileName().split(";");
				String name2 = name[0];
				b.setRenameFileName(URLEncoder.encode(name2,"utf-8"));
			}
			
		}
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list, response.getWriter());
		
	}

	@RequestMapping("rdelete.sb")
	public ModelAndView reply_Delete(@RequestParam("sbId") int sbId,
									 @RequestParam("rId") int rId,
									 @RequestParam("page") int page,
									 ModelAndView mv){
		System.out.println("sbId"+sbId);
		System.out.println("rId"+rId);
		System.out.println("mv"+mv);
		
		int result = sService.deleteReply(rId);
		
		if(result>0) {
			mv.setViewName("redirect:ddetailShowing.sb?sbId="+sbId+"&page="+page);
		}
		
		
		return mv;
	}

}
