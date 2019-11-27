package com.project.bangpool.memberlevel.controller;

import java.util.HashMap;

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
                            HttpSession session,
                            ModelAndView mv) {
      
      Member m = (Member)session.getAttribute("loginUser");
      m.setAddress(m.getAddress().replace("/", "<br>")); // mypage 주소 줄바꿈 넣기 (은지)
      m = mService.memberLogin(m);
      
      int writeCount = lvService.getWriteCount(m.getNickname());
      int loginCount=m.getLoginCount();
      
      HashMap<String, String> countMap = new HashMap<String, String>();
//      countMap.put("writeCount", writeCount);
//      countMap.put("loginCount", m.getLoginCount());
      countMap.put("mNo", m.getmNo());
      
      String level = "B";
      if(loginCount >= 4 && writeCount >= 4) {
         level = "S";
      }else if(loginCount >= 10 && writeCount >= 10){
         level = "G";
      }
      
      countMap.put("level", level);
   
      int result = lvService.updatelCode(countMap);
      
     if(result > 0) {
        // 업데이트 되었을 때 select
        mv.addObject("mlCode", m.getMlCode()).setViewName("myPage");
        
     }else {
        throw new LevelException("mlCode 업데이트 실패");
     }
      
      return mv;
   }

}