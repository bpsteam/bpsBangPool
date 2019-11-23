package com.project.bangpool.memberlevel.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.project.bangpool.member.model.service.MemberService;
import com.project.bangpool.member.model.vo.Member;
import com.project.bangpool.memberlevel.model.exception.LevelException;
import com.project.bangpool.memberlevel.model.service.LevelService;
import com.project.bangpool.memberlevel.model.vo.ManageMember;

@Controller
@SessionAttributes("loginUser")
public class LevelController {
	
	@Autowired LevelService lvService;
	@Autowired MemberService mService;
	
	@RequestMapping("mlevel.me")
	public ModelAndView memberLevel(@ModelAttribute ManageMember mm,
//								    @RequestParam("recommend") int recommend,
//								    @RequestParam("mlCode") String mlCode,
								    HttpSession session,
								    ModelAndView mv) {
		
		Member m = (Member)session.getAttribute("loginUser");
		System.out.println("LevelController m객체 : "+m);

		int result = lvService.updatelCode(m);
	      
	      if(result > 0) {
	         System.out.println("result값???"+result);
	         
	         // 업데이트 되었을 때 select
	         m = mService.memberLogin(m);
	         System.out.println("업데이트 됐냐?"+m);
	         
	         mv.addObject("mlCode", m.getMlCode()).setViewName("myPage");
	         
	      }else {
	         throw new LevelException("mlCode 업데이트 실패");
	      }
		
		
		return mv;
	}

}
