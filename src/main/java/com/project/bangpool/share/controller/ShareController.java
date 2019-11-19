package com.project.bangpool.share.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.bangpool.common.page.PageInfo;
import com.project.bangpool.common.page.Pagination;
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
								   // @RequestParam("uploadFile") MultipartFile uploadFile,
								    ModelAndView mv,
								    HttpServletRequest request,
								    HttpSession session) {
		
		System.out.println("ShareInsert : " + s);
		
/*		if(uploadFile != null && !uploadFile.isEmpty()) {
			String renameFileName = saveFile(uploadFile, request);
			
			if(renameFileName != null) {
				s.setOriginalFileName(uploadFile.getOriginalFilename());
				s.setRenameFileName(renameFileName);
			}
		}*/
		
		int result = srService.shareInsert(s);
		
		
		
		return mv;
		 
	}
	
	@RequestMapping("srdetail.sr")
	public ModelAndView shareDetail(@RequestParam("srbId") int srbId,
							  ModelAndView mv) {
		
		Share s = srService.shareDetail(srbId);
		
		double chance = 100;
		
		if(s.getSrEventEnterCount() != 0) {
			chance = s.getSrEventLimit()/s.getSrEventEnterCount();
		}
		
		if(s != null) {
			
			mv.addObject("share", s)
			  .addObject("chance",chance)
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

}
