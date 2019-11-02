package com.project.bangpool.freshmanmateboard.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.bangpool.freshmanmateboard.model.exception.FMBoardException;
import com.project.bangpool.freshmanmateboard.model.service.FMBoardService;
import com.project.bangpool.freshmanmateboard.model.vo.FMBoard;

@Controller
public class FMBoardController {
	

	@Autowired // boardservice에 알아서 객체만들어서 쏴준다. 
	private FMBoardService bService;

	@RequestMapping("blist.fm")
	public ModelAndView boardList(ModelAndView mv) {
		
		ArrayList<FMBoard> list = bService.selectList();
		
		if(list != null ) {
			System.out.println("리스트불러오기 성공하고 출력 "+list);
			//  list, pi --> boardListView
			mv.addObject("list", list);
			mv.setViewName("fmBoardList");
		}else {
			throw new FMBoardException("게시글 전체 조회 실패");
		}
		return mv;
		
	}
	
	@RequestMapping("insertview.fm")
	public String boardInsertView() {
		return "fmInsertBoard";
		
	}
	
	@RequestMapping("binsert.fm")
	public String insertBoard(@ModelAttribute FMBoard b, @RequestParam("phone1")String phone1,
							@RequestParam("phone2")String phone2, @RequestParam("phone3")String phone3,
							@RequestParam("uploadFile") MultipartFile uploadFile, HttpServletRequest request) {
		
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

		int result = bService.insertBoard(b);
	
		
		
		
		if(result>0) {
			
			return "redirect:blist.fm";
		}else {
			throw new FMBoardException("게시글등록실패 ");
		}
		
		
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
	public ModelAndView selectOneBoard(@RequestParam("bId") int bId, ModelAndView mv,
										HttpSession session) {
		
		FMBoard board = bService.selectBoard(bId);
		

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
	
}


