package com.project.bangpool.member.controller;


import javax.servlet.http.HttpSession;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

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
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.project.bangpool.member.model.exception.MemberException;
import com.project.bangpool.member.model.service.MemberService;
import com.project.bangpool.member.model.vo.Member;


@Controller
@SessionAttributes("loginUser")
public class MemberController {
	 /* NaverLoginBO */
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;
    
    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }
    
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
	public ModelAndView memberInsertForm(@ModelAttribute Member snsMember) {
		if(snsMember != null) {
			System.out.println("약관페이지에서 넘어온 정보 : "+snsMember);
			return new ModelAndView("signUp").addObject("snsMember", snsMember);
		}else {
			return new ModelAndView("signUp");
		}		
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
	
	@RequestMapping("mUpdate.me")
	public String memberUpdate(Member m,
							   @RequestParam("post") String post,
							   @RequestParam("address1") String address1,
							   @RequestParam("address2") String address2,
							   @RequestParam("year") String year,
							   @RequestParam("month") String month,
							   @RequestParam("date") String date,
							   Model model) {
		m.setAddress(post+"/"+address1+"/"+address2);
		m.setBirth(year+"-"+month+"-"+date);
		
		String encPwd = bcryptPasswordEncoder.encode(m.getPwd());
		m.setPwd(encPwd);
		
		System.out.println("update : " + m);
		//update : Member [mNo=null, mlCode=null, email=admin@bangpool.com, pwd=1234, 
		// name=관리자이름, nickname=관리자닉네임, gender=여성, birth=null, 
		// address=17017/경기도 용인시 처인구 동백죽전대로 80/123123, phone=123123, mStatus=null, enrollDate=null, updateDate=null, snsId=null]
		int result = mService.memberUpdate(m);
		
		if(result>0) {
			Member loginUser = mService.memberLogin(m);
			System.out.println("session 에 새로올리자 "+loginUser);
			model.addAttribute("loginUser", loginUser);
			return "myPage";
		}else {
			throw new MemberException("회원정보 수정 실패");
		}
		
	}
	
	@RequestMapping("mypage.me")
	public String myPageView() {
		return "myPage";
	}
	

// 	@RequestMapping("loginView.me")
// 	public String naverloginView() {
// 		return "naverlogin";
// 	}
    

   
  	@RequestMapping("mdelete.me")
	public String memberDelete(Model model, SessionStatus status) {
		
		Member m = (Member)model.getAttribute("loginUser");
		
		System.out.println("탈퇴 : "+m);
		
		int result = mService.deleteMember(m);
		
		if(result>0) {
			status.setComplete();
			return "redirect:home.do";
		}else {
			throw new MemberException("탈퇴 실패.");
		}
		
	}
	

//	@RequestMapping("loginView.me")
//	public String naverloginView() {
//		return "loginView";
//	}
	
	 //로그인 첫 화면 요청 메소드
    @RequestMapping(value = "loginView.me", method = { RequestMethod.GET, RequestMethod.POST })
    public String login(Model model, @RequestParam(value="naverAuthUrl", required=false) String naverAuthUrl) {
        
        /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
//    	System.out.println("???"+session);
 //   	String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
//    	String kakaoAuthUrl = kakaoLoginBO.getAuthorizationUrl(session);
        
        //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
        //redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
        System.out.println("로그인 컨트롤러에서 네이버 인증 주소?:" + naverAuthUrl);
        
        //네이버 
    //    model.addAttribute("naverUrl", naverAuthUrl);
        //카카 
//        model.addAttribute("kakaoUrl", kakaoAuthUrl);

        /* 생성한 인증 URL을 View로 전달 */
        return "loginView";
    }
//    
//    @RequestMapping(value = "naverlogin.me", method = { RequestMethod.GET, RequestMethod.POST })
//    public String naverlogin(Model model, HttpSession session) {
//    	String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
//	   model.addAttribute("naverUrl", naverAuthUrl);
//    	return "redirect: callback.me";
//    }
    
    //네이버 로그인 성공시 callback호출 메소드
    @RequestMapping(value = "callback.me", method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView callback(Model model, @RequestParam String code, 
    					@RequestParam String state, HttpSession session,HttpServletResponse response)
            throws IOException {
    	
		response.setContentType("application/json; charset=utf-8");

        System.out.println("여기는 callback");
        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
        apiResult = naverLoginBO.getUserProfile(oauthToken);
        System.out.println(naverLoginBO.getUserProfile(oauthToken).toString());
        
        
//        model.addAttribute("naverLoginUser", apiResult);
        System.out.println("naverLoginUser"+apiResult);
        /* 네이버 로그인 성공 페이지 View 호출 */
      JsonStringParse jsonparse = new JsonStringParse(); 
      //"response":{"id":"65345837","nickname":"eunji",
      //"gender":"F","email":"eunjiii_@naver.com","name":"\uad8c\uc740\uc9c0"}}
      JSONObject jsonobj = jsonparse.stringToJson(apiResult, "response");
      String snsId = jsonparse.JsonToString(jsonobj, "id");
      String name = jsonparse.JsonToString(jsonobj, "name");
      String nickname = jsonparse.JsonToString(jsonobj, "nickname");
      String gender = jsonparse.JsonToString(jsonobj, "gender");
      String email = jsonparse.JsonToString(jsonobj, "email");
      

      Member m = new Member();
      m.setSnsId(snsId);
      
//      System.out.println("이름나와 ? " +name); //나온다
//      try {
//          vo = service.naverLogin(vo);
//      } catch (Exception e) {
//          // TODO Auto-generated catch block
//          e.printStackTrace();
//      }
      
      	Member loginUser = mService.snsLogin(m);
      	System.out.println("snslogin 디비갔다온거 : "+loginUser);
      	
      	if(loginUser !=null) {
      		model.addAttribute("loginUser", loginUser);
      		return new ModelAndView("naverSuccess");
      	}else {
      		// 여기서 바로 회원가입 창으로 가서 네이버정보 입력시키고 네이버 아이디는 snsid로 집어넣어 
      		m.setName(name);
      		m.setNickname(nickname);
      		if(gender.equals("F"))	m.setGender("여성");
      		else	m.setGender("남성");
      		m.setEmail(email);
      		
      		System.out.println("회원가입창으로 보낼 네이버 정보 : "+m );
      		return new ModelAndView("yakwan").addObject("snsMember", m).addObject("naverId",m.getSnsId());
      	}
        
    }
	
	
	
	@RequestMapping("dupid.me")
	public void idDuplicateCheck(HttpServletResponse response, 
								@RequestParam("email") String email) throws IOException {
		boolean isUsable = mService.checkIdDup(email) == 0 ? true : false;

		response.getWriter().print(isUsable);
	}

	@RequestMapping("dupnick.me")
	public void nicknameDuplicateCheck(HttpServletResponse response, @RequestParam("nickname") String nickname) throws IOException {

		boolean isUsable = mService.checkNickDup(nickname) == 0? true:false;

		response.getWriter().print(isUsable);
	}
  

	// mypage 정보수정 버튼 -> 비밀번호 확인 페이지
	@RequestMapping("mupConfirm.me")
	public String updateConfirm () {
		return "mUpdateConfirm";
	}
  
  
	// updateConfirm 페이지에서 -> 비밀번호 확인하고 정보수정페이지로 가기 
	@RequestMapping("pwdConfirm.me")
	public ModelAndView pwdConfirm(Model model, @RequestParam("pwd") String rawPwd, 
							@RequestParam("email") String email) {
		
		Member m = (Member) model.getAttribute("loginUser");
		
//		System.out.println("pwdConfirm m: "+m);
//		System.out.println("pwdConfirm pwd: "+rawPwd);
//pwdConfirm m: Member [mNo=2, mlCode=TEMPMLCODE, email=admin@bangpool.com, pwd=$2a$10$uQiko/23OGXaGqiEPi3hMuW8XWLhRt7752lQTKdX16F32UurNdG2q, name=관리자, nickname=관리자닉네임, gender=여성, birth=1985-6-10, address=17017/경기도 용인시 처인구 동백죽전대로 80/(삼가동), phone=01092923838, mStatus=Y, enrollDate=2019-11-13, updateDate=2019-11-13, snsId=null]
//pwdConfirm pwd: 1111

		if(bcryptPasswordEncoder.matches(rawPwd, m.getPwd())) {
			String post = m.getAddress().split("/")[0];
			String address1 = m.getAddress().split("/")[1];
			String address2 = m.getAddress().split("/")[2];
			
			String year = m.getBirth().split("-")[0];
			String month = m.getBirth().split("-")[1];
			String date = m.getBirth().split("-")[2];
			
			
			return new ModelAndView("mUpdateForm")
					.addObject("post",post).addObject("address1",address1)
					.addObject("address2",address2).addObject("year",year)
					.addObject("month",month).addObject("date",date);
		}else {
			return new ModelAndView("mUpdateConfirm").addObject("match", "F");
		}
		
	}

 


}

