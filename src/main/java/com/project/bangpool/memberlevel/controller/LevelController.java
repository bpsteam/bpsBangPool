package com.project.bangpool.memberlevel.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.project.bangpool.member.model.vo.Member;
import com.project.bangpool.memberlevel.model.service.LevelService;
import com.project.bangpool.memberlevel.model.vo.ManageMember;

@Controller
@SessionAttributes("loginUser")
public class LevelController {
	
	@Autowired LevelService lvService;
	
	@RequestMapping("mlevel.me")
	public ModelAndView memberLevel(@ModelAttribute ManageMember mm,
//							 	    @RequestParam("loginCount") int loginCount,
//								    @RequestParam("recommend") int recommend,
//								    @RequestParam("mlCode") String mlCode,
								    HttpSession session,
								    ModelAndView mv) {
		// header.jsp -> loginCount , recommend, mlCode 
		
		Member m = (Member)session.getAttribute("loginUser");
		System.out.println("LevelController m객체 : "+m);
		
		int loginCount = lvService.getLoginCount(m.getmNo());
		System.out.println("LevelController loginCount : "+loginCount); //  1
		
		String mlCode = lvService.selectlCode(loginCount);
		System.out.println("mlCode 가져오니???"+mlCode);
		
		
		
//		mm = lvService.updateLevel(mlCode);
		
		mv.addObject("mm", mm)
//		  .addObject("loginCount", loginCount)
//		  .addObject("mlCode", mlCode)
		  .setViewName("myPage");
		
		return mv;
	}

}
