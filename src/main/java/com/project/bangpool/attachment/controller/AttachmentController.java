package com.project.bangpool.attachment.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.project.bangpool.attachment.model.service.AttachmentService;
import com.project.bangpool.attachment.model.vo.Attachment;
import com.project.bangpool.secondHandBoard.model.vo.SecondHandBoard;

@Controller
public class AttachmentController {
	
	@Autowired
	private AttachmentService attService;
	
	
	@RequestMapping("topList.at")
	public void boardTopList(HttpServletResponse response) throws IOException {
		
		response.setContentType("application/json; charset=utf-8");
		ArrayList<Attachment> list = attService.selectTopList();
		
		JSONArray jArr = new JSONArray();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		//System.out.println(list);
		
				
		for(Attachment b : list) {
			
			if(b.getRenameFileName().contains(";")) {
				
				String[] name = b.getRenameFileName().split(";");
				String name2 = name[0];
				b.setRenameFileName(URLEncoder.encode(name2,"utf-8"));
			}
			
		}
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list, response.getWriter());
		
	}
	
	@RequestMapping("topList2.at")
	public void boardTopList2(HttpServletResponse response) throws IOException {
		
		response.setContentType("application/json; charset=utf-8");
		ArrayList<Attachment> list = attService.selectTopList2();
		
		JSONArray jArr = new JSONArray();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		//System.out.println(list);
		
		System.out.println("Attachment : "+list);		
		for(Attachment b : list) {
			
			if(b.getRenameFileName().contains(";")) {
				
				String[] name = b.getRenameFileName().split(";");
				String name2 = name[0];
				b.setRenameFileName(URLEncoder.encode(name2,"utf-8"));
			}
			
		}
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list, response.getWriter());
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
