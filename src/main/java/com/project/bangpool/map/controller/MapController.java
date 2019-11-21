package com.project.bangpool.map.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes("loginUser")
@Controller
public class MapController {
	//
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
//		response.setContentType("application/json; charset=utf-8");
		// TODO 선행으로 선의 거리 계산하기
		/*ArrayList<share> list = srService*/
		
		
		
		
		// start geoCode 
			double lon1 = 37.51442617882784; 	// 로그인 유저 가정
			double lon2 = 37.51375250260386;
			double lat1 = 127.10061030204156; 	// 로그인 유저 가정
			double lat2 = 127.10444609981751;
			// The math module contains a function 
	        // named toRadians which converts from 
	        // degrees to radians. 
	        lon1 = Math.toRadians(lon1); 
	        lon2 = Math.toRadians(lon2); 
	        lat1 = Math.toRadians(lat1); 
	        lat2 = Math.toRadians(lat2); 
	  
	        // Haversine formula  
	        double dlon = lon2 - lon1;  
	        double dlat = lat2 - lat1; 
	        double a = Math.pow(Math.sin(dlat / 2), 2) 
	                 + Math.cos(lat1) * Math.cos(lat2) 
	                 * Math.pow(Math.sin(dlon / 2),2); 
	              
	        double c = 2 * Math.asin(Math.sqrt(a)); 
	  
	        // Radius of earth in kilometers. Use 3956  
	        // for miles 
	        double r = 6371; 
	  
	        // calculate the result 
	        double result1 = (c * r);
	       int result2 = ((int)(c * r));
	       System.out.println("result1 double 결과값" + result1);
	       // 거리값은 정수부터 킬로미터 값으로 나온다.
	       System.out.println("result2 int 결과값" + result2);
		// end geoCode
		
		
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
	
}
