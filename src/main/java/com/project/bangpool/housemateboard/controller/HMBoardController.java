package com.project.bangpool.housemateboard.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.bangpool.housemateboard.model.exception.HMBoardException;
import com.project.bangpool.housemateboard.model.service.HMBoardService;
import com.project.bangpool.housemateboard.model.vo.HMBoard;

@Controller
public class HMBoardController {
	
	@Autowired	//service에 자동으로 객체 만들어주기
	private HMBoardService hbService;

	/*** 전체 게시글 불러오기 ***/
	@RequestMapping("blist.hm")
	public ModelAndView boardList(ModelAndView mv) {
		
		ArrayList<HMBoard> list = hbService.selectList();
		if(list != null) {
			mv.addObject("list", list);
			mv.setViewName("hmboardList");
		} else {
			throw new HMBoardException("게시글 전체 조회 실패하였습니다.");
		}
		//return "hmboardList";
		return mv;
	}
	
	
	/*** 게시글 선택시 디테일 화면가기 ***/
	@RequestMapping("bdetail.hm")
	public ModelAndView boardDetail(@RequestParam("hbId") int hbId, 
									ModelAndView mv) {
		
		HMBoard hmboard = hbService.selectBoard(hbId);
		
		if(hmboard != null) {
			mv.addObject("hboard", hmboard)
			  .setViewName("hmboardDetailView");
		} else {
			throw new HMBoardException("게시글 상세보기 조회 실패하였습니다.");
		}
		
		//return "hmboardDetailView";
		return mv;
	}
	
	
	/*** 게시판 글쓰기 클릭시 넘어갈 화면 ***/
	@RequestMapping("binsertView.hm")
	public String insertBoardView() {
		return "hminsertBoard";
	}
	
	/*** 글쓰기 입력후 등록하기 버튼 누를시. ***/
	@RequestMapping("binsert.hm")
	public String boardInsert(HMBoard hb , 
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
		}
		
		int result = hbService.insertBoard(hb);

		if (result > 0) {
			return "redirect:blist.hm";
		} else {
			throw new HMBoardException("게시글 등록 실패하였습니다.");
		}
		 
	}


	private String saveFile(MultipartFile file, HttpServletRequest request) {
		//파일이 저장될 경로 설정
		String root = request.getSession().getServletContext().getRealPath("resources");
		// ==> webapp 아래에 있는 resources를 데려온다는 의미.
		
		String savePath = root + "\\hbuploadFiles";   // '\\' 두개 입력해줘야함
		
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


