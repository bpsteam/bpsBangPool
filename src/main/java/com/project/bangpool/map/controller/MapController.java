package com.project.bangpool.map.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String mapAddSC() {
		return "mapAddSC";
	}
	
	
}
