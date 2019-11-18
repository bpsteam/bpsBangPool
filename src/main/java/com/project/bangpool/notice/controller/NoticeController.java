package com.project.bangpool.notice.controller;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.project.bangpool.common.SearchCondition;
import com.project.bangpool.common.page.PageInfo;
import com.project.bangpool.common.page.Pagination;
import com.project.bangpool.notice.model.exception.NoticeException;
import com.project.bangpool.notice.model.service.NoticeService;
import com.project.bangpool.notice.model.vo.Notice;
import com.project.bangpool.roommateboard.model.vo.RMBoard;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService nService;
	
	@RequestMapping("nList.no")
	public ModelAndView notice(@RequestParam(value="page",required=false) Integer page,
								ModelAndView mv) {
		
		int currentPage = 1;
		
		if( page != null) currentPage = page;
		
		int listCount = nService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Notice> list = nService.selectList(pi);

		if(list != null) {
			mv.addObject("list",list);
			mv.addObject("pi",pi);
			mv.setViewName("nList");
		}
		
		return mv;
	}
	
	@RequestMapping("notice_insert.no")
	public String noticeInsert() {
		return "notice_insert";
	}
	
	@RequestMapping("nInsert.no")
	public String insert_Notice(@ModelAttribute Notice n,
			                    @RequestParam("uploadFile") MultipartFile uploadFile,
			                    HttpServletRequest request) {
		
		if(uploadFile != null && !uploadFile.isEmpty()) {
			String renameFileName = saveFile(uploadFile , request);
			
			if(renameFileName != null) {
				n.setOriginalFileName(uploadFile.getOriginalFilename());
				n.setRenameFileName(renameFileName);
			}
		}
		
		int result = nService.insert_Notice(n);
		
		if(result>0) {
			
			return "redirect:nList.no";
			
		}else {
			throw new NoticeException("게시글 등록을 실패");
		}
	}
	
	public String saveFile(MultipartFile file , HttpServletRequest request) {
		// 파일이 저장될 경로 설정 : 작은 resources 불러오기
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\nuploadFiles";
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()))
								+ "." + originFileName.substring(originFileName.lastIndexOf(".") + 1);
		
		System.out.println("originFileName :" +originFileName );
		System.out.println("renameFileName :" +renameFileName );
		
		String renamePath = folder + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return renameFileName;
	}
	
	@RequestMapping("ndetail.no")
	public ModelAndView detail_Notice(@RequestParam("nId") int nId,
									  @RequestParam(value="page",required=false) int page,
        							  ModelAndView mv) {
		
		Notice notice = nService.detail_Notice(nId);
		
		if(notice != null) {
			mv.addObject("notice",notice)
			   .addObject("page",page)
			   .setViewName("notice_detail");
		}else {
			throw new NoticeException("게시글 상세보기 실패");
		}
		
		return mv;
	}
	
	@RequestMapping("ndetail2.no")
	public ModelAndView detail_Notice2(@RequestParam("nId") int nId,
        							  ModelAndView mv) {
		
		Notice notice = nService.detail_Notice(nId);
		
		if(notice != null) {
			mv.addObject("notice",notice)
			   .setViewName("notice_detail");
		}else {
			throw new NoticeException("게시글 상세보기 실패");
		}
		
		return mv;
	}
	
	
	@RequestMapping("ndelete.no")
	public String delete_Notice(@RequestParam("nId") int nId) {
		
		int result = nService.delete_Notice(nId);
		
		if(result>0) {
			
			return "redirect:nList.no";
			
		}else {
			throw new NoticeException("sdf");
		}
		
	}
	
	
	@RequestMapping("search.no")
	public ModelAndView serach_Notice(@RequestParam(value="page",required=false) Integer page,
									  @RequestParam("searchCondition") String searchCondition,
									  @RequestParam("search") String search,
									  ModelAndView mv) {

	
		SearchCondition sc = new SearchCondition();
		
		if(searchCondition.equals("writer")) sc.setSwriter(search);
		else if(searchCondition.equals("title")) sc.setStitle(search);
		else sc.setScontent(search);
		
		int currentPage = 1;
		
		if( page != null) currentPage = page;
		
		int listCount = nService.getSearchListCount(sc);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		ArrayList<Notice> list = nService.selectSearchNotice(sc,pi);
		if(list != null) {
			mv.addObject("list",list)
			  .addObject("page",page)
			  .addObject("pi",pi)
			  .setViewName("nList");
		}else {
			throw new NoticeException("게시판 검색  실패");
		}
		
		
		return mv;
	}
	
	@RequestMapping("nupView")
	public ModelAndView notice_Update_view(@RequestParam("nId") int nId,
								      @RequestParam(value="page",required=false) int page,
									  ModelAndView mv) {
		
		Notice notice = nService.detail_Notice(nId);

		if(notice != null) {
			mv.addObject("notice",notice)
			   .addObject("page",page)
			   .setViewName("notice_update");

		}else {
			throw new NoticeException("게시글 불러오기 실패");
		}
		return mv;
	}
	
	@RequestMapping("nupdate.no")
	public ModelAndView notice_update(@ModelAttribute Notice n,
									  @RequestParam(value="page",required=false) Integer page,
								      @RequestParam("reloadFile") MultipartFile reloadFile,
								      HttpServletRequest request,
								      ModelAndView mv) {

		if(reloadFile != null && !reloadFile.isEmpty()) {
			deleteFile(n.getRenameFileName(),request);
		}
			
		String renameFileName = saveFile(reloadFile, request);
		
		if(renameFileName != null) {
			n.setOriginalFileName(reloadFile.getOriginalFilename());
			n.setRenameFileName(renameFileName);
		}
			

		Notice notice = nService.detail_Notice(n.getnId());
		
		if(n.getOriginalFileName() == "") {
			
			int result = nService.updateNotice(n,notice);
			
			if(result > 0) {
				mv.addObject("page",page)
				  //.setViewName("redirect:ndetail.no?nId="+n.getnId());
				.setViewName("redirect:nList.no");
			}
			
		}else {
			
			int result = nService.updateFileNotice(n,notice);
			
			if(result > 0) {
				mv.addObject("page",page)
				  //.setViewName("redirect:ndetail.no?nId="+n.getnId());
				.setViewName("redirect:nList.no");
			}
		}
		
		return mv;
			
	}
			
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\nuploadFiles";
			
		File f = new File(savePath + "\\" + fileName);
			
		if(f.exists()) {
			f.delete();
		}
	}
	
	
	// 여기부터 김상욱 꺼
	
	@RequestMapping("topList.no")
	public void boardTopList(HttpServletResponse response) throws IOException {
		
		response.setContentType("application/json; charset=utf-8");
		ArrayList<Notice> list = nService.selectTopList();
		
		JSONArray jArr = new JSONArray();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		System.out.println(list);
		
		for(Notice b : list) {
			b.setnTitle(URLEncoder.encode(b.getnTitle(),"utf-8"));
		}
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list, response.getWriter());
		
	}
		
	
}
