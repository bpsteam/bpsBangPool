package com.project.bangpool.freshmanmateboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.bangpool.freshmanmateboard.model.exception.FMBoardException;
import com.project.bangpool.freshmanmateboard.model.service.FMBoardService;
import com.project.bangpool.freshmanmateboard.model.vo.FMBoard;

@Controller
public class FMBoardController {
	

	@Autowired // boardservice에 알아서 객체만들어서 쏴준다. 
	private FMBoardService bService;

	@RequestMapping("blist.fm")
	public String boardList() {
		return "fmBoardList";
	}
	
	@RequestMapping("insertview.fm")
	public String boardInsertView() {
		return "fmInsertBoard";
	}
	
	@RequestMapping("binsert.fm")
	public String insertBoard(@ModelAttribute FMBoard b, @RequestParam("phone1")String phone1,
							@RequestParam("phone2")String phone2, @RequestParam("phone3")String phone3) {
		
		b.setContactInfo(phone1+"-"+phone2+"-"+phone3);
		
		//System.out.println("인서트정보 들어오는지? "+ b); 들어온다.
		

		int result = bService.insertBoard(b);
		
		if(result>0) {
			
			return "redirect:blist.fm";
		}else {
			throw new FMBoardException("게시글등록실패 ");
		}
		
		
		
	}
	
	@RequestMapping("bdetail.fm")
	public String selectOneBoard() {
		
		return "fmBoardDetailView";
	}
	
}


