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
//								    @RequestParam("recommend") int recommend,
//								    @RequestParam("mlCode") String mlCode,
								    HttpSession session,
								    ModelAndView mv) {
		
		Member m = (Member)session.getAttribute("loginUser");
		System.out.println("LevelController m객체 : "+m);
		
//		int loginCount = lvService.getLoginCount(m.getmNo());
//		System.out.println("LevelController loginCount : "+loginCount); //  1

		int result = lvService.updatelCode(m);
		
		if(result > 0) {
			System.out.println("result값???"+result);
			m.setMlCode(m.getMlCode());
		}
		
		mv.addObject("mm", mm)
//		  .addObject("loginCount", loginCount)
//		  .addObject("mlCode", mlCode)
		  .setViewName("myPage");
		
		return mv;
	}

}
