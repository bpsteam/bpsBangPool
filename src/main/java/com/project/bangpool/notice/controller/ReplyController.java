package com.project.bangpool.notice.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.project.bangpool.common.Reply;
import com.project.bangpool.member.model.vo.Member;
import com.project.bangpool.notice.model.exception.NoticeException;
import com.project.bangpool.notice.model.service.ReplyService;

@Controller
public class ReplyController {
	
	@Autowired
	private ReplyService rService;
	
	@RequestMapping("reply_list.no")
	public void reply_list(HttpServletResponse response, int refBid) throws JsonIOException, IOException {

		ArrayList<Reply> list = rService.selectReplyList(refBid);
		for(Reply r: list) {
			
			r.setrWriter(URLEncoder.encode(r.getrWriter(),"utf-8"));
			r.setrContent(URLEncoder.encode(r.getrContent(),"utf-8"));
			
		}
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list, response.getWriter());
	}
	
	@RequestMapping("reply_input.no")
	@ResponseBody
	public String reply_input(Reply r, Member m,HttpSession session) {
		
		String rWriter = m.getNickname();
		
		int result = rService.insertReply(r);
		
		if(result >0) {
			return "success";
		}else {
			throw new NoticeException("댓글 등록에 실패 하였습니다.");
		}
	}
	
	@RequestMapping("rDeleteA.no")
	public ModelAndView reply_Delete(@RequestParam("nId") int nId,
									 @RequestParam("rId") int rId,
									 @RequestParam("page") int page,
									 ModelAndView mv){
		
		int result = rService.deleteReply(rId);
		
		if(result>0) {
			mv.setViewName("redirect:ndetail.no?nId="+nId+"&page="+page);
		}
		
		
		return mv;
	}

}

