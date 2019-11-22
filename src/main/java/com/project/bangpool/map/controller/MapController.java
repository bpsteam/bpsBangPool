package com.project.bangpool.map.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.project.bangpool.map.model.service.MapService;
import com.project.bangpool.map.model.vo.Map;
import com.project.bangpool.member.model.vo.Member;
import com.project.bangpool.share.model.vo.Share;

@SessionAttributes("loginUser")
@Controller
public class MapController {
	
	@Autowired
	private MapService mService;
	
	@RequestMapping("mapView.map")
	public String mapShowing() {
		return "mapShowing";
	}
	
	@RequestMapping("mapAddress.map")
	public String mapAddress() {
		return "mapAddress";
	}
	
	@RequestMapping("mapKeyWordSC.map")
	public String mapKeyWordSC() {
		return "mapKeyWordSC";
	}
	
	@RequestMapping("mapMultiMark.map")
	public String mapMultiMark() {
		return "mapMultiMark";
	}
	
	@RequestMapping("mapKeyAndList.map")
	public String mapKeyAndList() {
		return "mapKeyAndList";
	}
	
	@RequestMapping("mapAddSC.map")
	public String mapAddSC(/*HttpServletResponse response, int loginUserId*/) {
		//response.setContentType("application/json; charset=utf-8");
		/*ArrayList<share> list = srService
		 * sssss*/
		
		return "mapAddSC";
	}
	
	@RequestMapping("mapLineCal.map")
	public String mapLineCal() {
		return "mapLineCal";
	}
	
	@RequestMapping("mapDistance.map")
	public String mapDistance() {
		return "mapDistance";
	}
	
	// ajax map
	@RequestMapping("mapAjax.map")
	@ResponseBody
	public void mapAjax(HttpSession session, Map mp) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		ArrayList<Share> list = mService.selectList();
		System.out.println(loginUser); 			// 로그인한 유져의 정보
		System.out.println("list : "+list);
		
	}
}
