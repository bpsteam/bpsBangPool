package com.project.bangpool.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.project.bangpool.member.model.exception.MemberException;
import com.project.bangpool.member.model.service.MemberService;
import com.project.bangpool.member.model.vo.Member;


@Controller
@SessionAttributes("loginUser")
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired  
	private BCryptPasswordEncoder bcryptPasswordEncoder; 
	
	@RequestMapping(value="login.me", method=RequestMethod.POST)
	public String memberLogin(Member m, Model model) {
		
		Member loginUser = mService.memberLogin(m);
		
		if(bcryptPasswordEncoder.matches(m.getPwd(), loginUser.getPwd())) {
			model.addAttribute("loginUser", loginUser);
			System.out.println("찍혀?:"+loginUser);
			System.out.println("로그인 정보: "+m);
			System.out.println("로그인성공");
			// log기록 남기기
			// logger.info(loginUser.getEmail());
			// == logger.info(message); 
		}else {
			throw new MemberException("로그인 실패");
		}
		 
		return "redirect:home.do";
	}
	
	//로그아웃 용 컨트롤러 2
		@RequestMapping("logout.me")
		public String logout(SessionStatus status) {
			
			
			status.setComplete();
			
			return "redirect:home.do";
		}

	@RequestMapping("termsNConditions.me")
	public String showTermsNConditions() {
		return "yakwan";
	}
	
	@RequestMapping("mInsertView.me")
	public String memberInsertForm() {
		return "signUp";
	}
	
	@RequestMapping("minsert.me")
	public String memberInsert(@ModelAttribute Member m,
			   @RequestParam("post") String post,
			   @RequestParam("address1") String address1,
			   @RequestParam("address2") String address2,
			   @RequestParam("year") String year, 
			   @RequestParam("month") String month,
			   @RequestParam("date") String date) {
		
		m.setBirth(year+"-"+month+"-"+date);
		m.setAddress(post+"/"+address1+"/"+address2);
		System.out.println(m);
		
		String encPwd = bcryptPasswordEncoder.encode(m.getPwd());
		m.setPwd(encPwd);
		
		int result = mService.insertMember(m);
		
		if(result>0) {
			return "redirect:home.do";
		}else {
			throw new MemberException("회원가입 실패!");
		}
		
	}
	
	@RequestMapping("mypage.me")
	public String myPageView() {
		return "myPage";
	}
	
	@RequestMapping("loginView.me")
	public String naverloginView() {
		return "naverlogin";
	}
	
}
