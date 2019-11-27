package com.project.bangpool.freshmanmateboard.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.project.bangpool.common.Reply;
import com.project.bangpool.common.page.PageInfo;
import com.project.bangpool.common.page.Pagination;
import com.project.bangpool.freshmanmateboard.model.exception.FMBoardException;
import com.project.bangpool.freshmanmateboard.model.service.FMBoardService;
import com.project.bangpool.freshmanmateboard.model.service.MailService;
import com.project.bangpool.freshmanmateboard.model.vo.FMBoard;
import com.project.bangpool.housemateboard.model.service.HMBoardService;
import com.project.bangpool.housemateboard.model.vo.HMBoard;
import com.project.bangpool.member.model.vo.Member;
import com.project.bangpool.roommateboard.model.service.RMBoardService;
import com.project.bangpool.roommateboard.model.vo.RMBoard;


@Controller
public class FMBoardController {
	

	@Autowired // boardservice에 알아서 객체만들어서 쏴준다. 
	private FMBoardService fbService;
	@Autowired 
	private HMBoardService hbService;
	@Autowired 
	private RMBoardService rbService;
	@Autowired 
	private MailService mailService;

	@RequestMapping("blist.fm")
	public ModelAndView boardList(@RequestParam(value="page", required=false) Integer page, 
								ModelAndView mv, @RequestParam("fLocation") String location) {
		
		System.out.println("blist location 출력 : " +location);
		if(location.equals("전체")) {
			location = null;
		}
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = fbService.getListCount(location);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<FMBoard> list = fbService.selectList(location, pi);
		
		if(list != null ) {
			System.out.println("리스트불러오기 성공하고 페이지 출력 "+pi);
			//  list, pi --> boardListView
			mv.addObject("list", list);
			mv.addObject("pi", pi).addObject("location",location);
			mv.setViewName("fmBoardList");
		}else {
			throw new FMBoardException("게시글 전체 조회 실패");
		}
		return mv;
		
	}
	

	@RequestMapping("tablist.fm")
	public ModelAndView tabBoardList(@RequestParam(value="page", required=false) Integer page,
						HttpServletResponse response, String fLocation, ModelAndView mv) 
								throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");
		
//		System.out.println("blist location 출력 : " +fLocation);
		
		String location = fLocation.trim();
		
		if(location.equals("전체")) {
			location = null;
		}

		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = fbService.getListCount(location);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
//		System.out.println("탭리스트에서 페이지 pi정보 "+pi);
//		ArrayList<PiBoard> list = fbService.selectPiList(location, pi);
		ArrayList<FMBoard> list = fbService.selectList(location, pi);
		System.out.println(list);
		// 객체 타입이 서로 다른 게시판과 페이징 객체를 한번에 ajax 결과로 보내주기 위해 
		// HashMap<String, Object> 선언. Object로 선언하여 두가지 객체 담음.
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("pi", pi);
		
		mv.addAllObjects(map);
		mv.setViewName("jsonView");
		
		return mv;
		
//		JSONArray jArr = new JSONArray();
//		for(PiBoard b : list) {
//			
//			b.setBoardLimit(pi.getBoardLimit());
//			b.setEndPage(pi.getEndPage());
//			b.setListCount(pi.getListCount());
//			b.setCurrentPage(pi.getCurrentPage());
//			b.setMaxPage(pi.getMaxPage());
//			b.setStartPage(pi.getStartPage());
//			b.setPageLimit(pi.getPageLimit());
//		}
		
//		for(FMBoard b : list) {
//			JSONObject board = new JSONObject();
//			
//			board.put("fbId", b.getFbId());
//			board.put("fLocation", b.getfLocation());
//			board.put("fbTitle", b.getFbTitle());
//			board.put("fbCount", b.getFbCount());
//			board.put("fbWriter", b.getFbWriter());
			
//			board.put("boardLimit", b.getBoardLimit());
//			board.put("endPage", b.getEndPage());
//			board.put("listCount", b.getListCount());
//			board.put("currentPage", b.getCurrentPage());
//			board.put("maxPage", b.getMaxPage());
//			board.put("startPage", b.getStartPage());
//			board.put("pageLimit", b.getPageLimit());
	        
//	        jArr.add(board);
	        
	  //      System.out.println("jsonarray: "+board);
//		}
		
	
//		
//		response.setContentType("application/json; charset=utf-8");
		
	
		
//		return map;
		
//		JSONObject sendJson = new JSONObject();
//		sendJson.put("list",jArr);
//		sendJson.put("pi", pi);
//		
//		JSONObject real = new JSONObject();
//		real.put("real", sendJson);
//		
//		PrintWriter out = response.getWriter();
//		out.print(real);
//		out.flush();
//		out.close();
		
		
		
		//model.addAttribute("tabPi", pi);
//		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
//		gson.toJson(list, response.getWriter());
//		gson.toJson(pi, response.getWriter());
	}

	
	@RequestMapping("insertview.fm")
	public ModelAndView boardInsertView(ModelAndView mv) {
		// email 인증을 위한 랜덤 넘버 보내기
		int ran = new Random().nextInt(900000) + 100000;
		System.out.println("random for email autho: "+ran);
		mv.addObject("random", ran).setViewName("fmInsertBoard");
		return mv;
		
	}
	
	@RequestMapping("binsert.fm")
	public ModelAndView insertBoard(@ModelAttribute FMBoard b, @RequestParam("phone1")String phone1,
							@RequestParam("phone2")String phone2, @RequestParam("phone3")String phone3,
							@RequestParam(value="uploadFile1", required=false) MultipartFile uploadFile1, 
							@RequestParam(value="uploadFile2", required=false) MultipartFile uploadFile2, 
							@RequestParam(value="uploadFile3", required=false) MultipartFile uploadFile3,
							HttpServletRequest request,ModelAndView mv) {
		
		b.setContactInfo(phone1+"-"+phone2+"-"+phone3);
		System.out.println("인서트할때 엔터 값 확인 : "+b);
//		System.out.println(uploadFile1 +"/"+ uploadFile2+"/"+uploadFile3);
//		System.out.println(uploadFile1.getOriginalFilename());
//		System.out.println(uploadFile2.getOriginalFilename());
//		System.out.println(uploadFile3.getOriginalFilename());
//		
		String uploadFileName="";
		String rename="";
		
		if(uploadFile1 != null && !uploadFile1.isEmpty()) { 
			String renameFileName = saveFile(uploadFile1, request); // saveFile 메소드로 넘어가서 반환값 받아오기
			
			if(renameFileName != null) {
//				b.setOriginalFileName(uploadFile1.getOriginalFilename());
//				b.setRenameFileName(renameFileName);
//				// System.out.println("인서트정보 파일이랑 같이 들어오는지? "+ b); // 들어온다 
				uploadFileName += uploadFile1.getOriginalFilename();
				rename += renameFileName;
			}
		}
		if(uploadFile2 != null && !uploadFile2.isEmpty()) { 
			String renameFileName = saveFile(uploadFile2, request); 
			
			if(renameFileName != null) {
				uploadFileName += ";"+uploadFile2.getOriginalFilename();
				rename += ";"+renameFileName;
			}
		}
		if(uploadFile3 != null && !uploadFile3.isEmpty()) { 
			String renameFileName = saveFile(uploadFile3, request); 
			
			if(renameFileName != null) {
				uploadFileName += ";"+uploadFile3.getOriginalFilename();
				rename += ";"+renameFileName;
			}
		}
		
		b.setOriginalFileName(uploadFileName);
		b.setRenameFileName(rename);
		
		System.out.println("인서트 전 출력 : "+b);

		int result = fbService.insertBoard(b);
	
		if(result>0) {
			mv.addObject("fLocation",b.getfLocation()).setViewName("redirect:blist.fm");
		}else {
			throw new FMBoardException("게시글등록실패 ");
		}
		
		return mv;
		
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources"); 
		System.out.println("루트 : " + root);
		String savePath = root + "\\fmboarduploads"; 
		String savePath2 = root + "\\attboarduploads";
		System.out.println("저장경로 : " + savePath);
	
		File folder = new File(savePath);
		File folder2 = new File(savePath2);
		
		if(!folder.exists()) {
			folder.mkdirs(); // buploadFiles folder가없으면 만들어준다. 
		}
		
		if(!folder2.exists()) {
			folder2.mkdirs(); // buploadFiles folder가없으면 만들어준다. 
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS"); // millisecond -> yyyyMMddHHmmssSSS
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()))
								+"."
								+originFileName.substring(originFileName.lastIndexOf(".")+1); // .확장자 가지고옴
		
		String renamePath = folder + "\\" + renameFileName;
		String renamePath2 = folder2 + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath)); // 전달받은 rename파일을 file에 덮어쓴다. 
			file.transferTo(new File(renamePath2)); // 전달받은 rename파일을 file에 덮어쓴다. 
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return renameFileName;
	}
	
	
	@RequestMapping("bdetail.fm")
	public ModelAndView selectOneBoard(@RequestParam(value="fbId", required=false) Integer fbId, 
									@RequestParam(value="bId", required=false) String bId,
									ModelAndView mv, HttpSession session) {
		System.out.println("나오냐 : "+bId);
		if(bId != "" && bId != null) {
			fbId=Integer.parseInt(bId);
		}
		
		System.out.println("디테일뷰 보드 출력 fbId : "+fbId);
		FMBoard board = fbService.selectBoard(fbId);

		if(board != null) {
			System.out.println("디테일뷰 정보하나 불러오기 성공 "+board); 
			board.setFbContent(board.getFbContent().replace("\n", "<br>"));
			if(board.getRenameFileName()!=null) {
				String[] original=board.getOriginalFileName().split(";");
				String[] rename=board.getRenameFileName().split(";");
				for(int i=0; i<rename.length; i++) {
					mv.addObject("rename"+i, rename[i]);
				}
			}
			
			mv.addObject("board", board).setViewName("fmBoardDetailView"); // method chaining 
		}else {
			throw new FMBoardException("게시글 상세보기를 실패하였습니다.");
		}
		
		return mv;
		
	}
	
	@RequestMapping("bupView.fm")
	public ModelAndView updateBoard(@RequestParam("fbId") int fbId, ModelAndView mv) {
		
		System.out.println("bupdate.fm/fbId : "+fbId);
		FMBoard b = fbService.selectBoard(fbId);
		
		System.out.println("bupdate.fm/b : " + b);
		
		String contact =  b.getContactInfo();
		String[] phone = new String[3];
		if(contact != null) {
			phone =contact.split("-");
		}
		mv.addObject("board",b).addObject("phone1",phone[0]).addObject("phone2",phone[1]).addObject("phone3",phone[2]).
		setViewName("fmUpdateBoard");
		
		return mv;
		
	}
	
	@RequestMapping("bdelete.fm")
	public String deleteBoard(@RequestParam("fbId") int fbId) {
		int result = fbService.deleteBoard(fbId);
		
		if(result>0) {
			return "redirect: blist.fm";
		}else {
			throw new FMBoardException("삭제실패");
		}
	}
	
	@RequestMapping("bupdate.fm")
	public ModelAndView updateBoard(@ModelAttribute FMBoard b, @RequestParam("phone1")String phone1,
			@RequestParam("phone2")String phone2, @RequestParam("phone3")String phone3,
			
			@RequestParam(value="reloadFile1", required=false) MultipartFile reloadFile1, 
			@RequestParam(value="reloadFile2", required=false) MultipartFile reloadFile2, 
			@RequestParam(value="reloadFile3", required=false) MultipartFile reloadFile3,
							HttpServletRequest request, ModelAndView mv) {
		
		
		
		b.setContactInfo(phone1+"-"+phone2+"-"+phone3);

		System.out.println("bupdate.fm / b : "+b);
		System.out.println("bupdate.fm / reloadFile : "+reloadFile1+";"+reloadFile2+";"+reloadFile3);
		String renameFileName1 =null;
		String renameFileName2 =null;
		String renameFileName3 =null;
		
		String originalFile = "";
		String renameFile = "";
		
		if(reloadFile1 != null && !reloadFile1.isEmpty()) {
			String dbFile = b.getRenameFileName();
			if(dbFile != null) {
				String file[] = dbFile.split(";");
				for(int i=0; i<file.length; i++) {
					deleteFile(file[i], request); // 파일삭제하는 메소드 만들기
				}
			}
			renameFileName1 = saveFile(reloadFile1, request);
			if(renameFileName1 != null) {
				originalFile +=reloadFile1.getOriginalFilename();
				renameFile +=renameFileName1;
			}
			if(reloadFile2 != null && !reloadFile2.isEmpty()) {
				renameFileName2 = saveFile(reloadFile1, request);
				if(renameFileName2 != null) {
					originalFile +=";"+reloadFile2.getOriginalFilename();
					renameFile +=";"+renameFileName2;
				}
			}
			if(reloadFile3 != null && !reloadFile3.isEmpty()) {
				renameFileName3 = saveFile(reloadFile3, request);
				if(renameFileName3 != null) {
					originalFile +=";"+reloadFile3.getOriginalFilename();
					renameFile +=";"+renameFileName3;
				}
			}
			b.setOriginalFileName(originalFile);
			b.setRenameFileName(renameFile);
		}	
//		}else {
//			FMBoard board = fbService.selectBoard(b.getFbId());
//			b.setOriginalFileName(board.getOriginalFileName());
//			b.setRenameFileName(board.getRenameFileName());
//		}
		
//		if(renameFileName1 != null) {
//			originalFile =reloadFile1.getOriginalFilename();
//			b.setOriginalFileName(reloadFile1.getOriginalFilename());
//			b.setRenameFileName(renameFileName1);
//		}
		
		System.out.println("파일네임 수정 됐어? : "+b);
		
		int result = fbService.updateBoard(b);
		
		if(result>0) {
			// page --> bdetail
			mv.setViewName("redirect:bdetail.fm?fbId=" + b.getFbId());
		}else {
			throw new FMBoardException("게시글 수정에 실패하였습니다.");
		}
		
		
		return mv;
	}
	

	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/fmboarduploads"; 
		
		File f = new File(savePath+"/"+fileName);
		
		if(f.exists()) { 
			f.delete();  
		}
	}
	
	@RequestMapping("addReply.fm")
	@ResponseBody
	public String addReply(Reply r, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String rWriter = loginUser.getNickname();
		
		r.setrWriter(rWriter);
		r.setbCode("FMBCODE");
		
		System.out.println("댓글불러오기 : "+ r);
		int result = fbService.insertReply(r);
		
		if(result>0) {
			return "success";
			
		}else {
			throw new FMBoardException("댓글등록실패");
		}
		
	}
	
	
	@RequestMapping("rList.fm")
	public void getReplyList(HttpServletResponse response, int fbId) throws JsonIOException, IOException {
		
		response.setContentType("application/json; charset=utf-8");
		
		ArrayList<Reply> list = fbService.selectReplyList(fbId);
		
		for(Reply r : list) {
			r.setrContent(URLEncoder.encode(r.getrContent(), "utf-8"));
		}
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list, response.getWriter());
		
	}
	
	@RequestMapping("bsearch.fm")
	public ModelAndView searchList(@RequestParam(value="page", required=false) Integer page,
								@RequestParam("searchMethod") String smethod,
								@RequestParam("searchword") String sword, ModelAndView mv) {

		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		HashMap<String, String> searchMap = new HashMap<String, String>();
		searchMap.put("smethod", smethod);
		searchMap.put("sword", sword);
		
		
		int listCount = fbService.getSearchListCount(searchMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
//		System.out.println("리스트카운트 받아왔어? "+listCount); // 됐어
		
		ArrayList<FMBoard> list = fbService.searchList(searchMap, pi);
		
		if(list != null ) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("fmBoardList");
		}else {
			throw new FMBoardException("검색 전체 조회 실패");
		}
		
		return mv;
	}
	
	@RequestMapping("rdelete.fm")
	public ModelAndView deleteReply(Reply r, ModelAndView mv) {
		
		int result = fbService.deleteReply(r.getrId());
		
		if(result>0) {
			mv.addObject("fbId", r.getRefbId()).setViewName("redirect:bdetail.fm");
		}else {
			throw new FMBoardException("댓글 삭제 실패");
		}
		
		return mv;
	}

	@RequestMapping("emailcheck.fm")
	@ResponseBody
	public String createEmailCheck(@RequestParam("schoolemail") String userEmail, 
									@RequestParam int random, HttpServletRequest request){
		System.out.println(random);
		//이메일 인증
		int ran = new Random().nextInt(900000) + 100000;
		HttpSession session = request.getSession(true);
		Member loginUser = (Member)session.getAttribute("loginUser");
		String authCode = String.valueOf(ran);
		session.setAttribute("authCode", authCode);
		session.setAttribute("random", random);
		String subject = "BangPool 학교이메일 인증 코드 발급 안내 입니다.";
		StringBuilder sb = new StringBuilder();
//		sb.append("BangPool 서비스 이용을 위한 본인 확인 메일 입니다."+authCode);
		sb.append("BangPool <br>서비스 이용을 위한 본인 확인 메일 입니다."
				+ "<br><br>안녕하세요 "+loginUser.getNickname()+"님, <br>"
				+ "<br>본인 확인을 위하여 이래의 ID 및 인증 번호를 확인하신 후, 글 작성을 완료해주세요."
				+ "<br><br>BangPool ID : "+loginUser.getEmail()
				+ "<br>인증 번호 : " + authCode
				+ "<br><br>감사합니다.<br><br><br>BANGPOOL, 방판소년단"
				+ "<br><br>서울시 강남구 역삼동" + 
				"<br>태헤란로 테헤란로14길" + 
				"<br>6 남도빌딩," + 
				"<br>KH 정보교육원"+
				"<br>G오후 강의장");
		String sendEmailId = "bangpool.kh@gmail.com";
		
		String result = mailService.send(subject, sb.toString(), sendEmailId, userEmail, null) + "";
		return result;
	}

	@RequestMapping(value="emailAutho.fm", method=RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<String> emailAuth(@RequestParam String authCode, 
											@RequestParam String random, HttpSession session){
		String originalJoinCode = (String) session.getAttribute("authCode");
		String originalRandom = Integer.toString((int) session.getAttribute("random"));
		System.out.println("authCode="+originalJoinCode);
		if(originalJoinCode.equals(authCode) && originalRandom.equals(random))
			return new ResponseEntity<String>("complete", HttpStatus.OK);
		else return new ResponseEntity<String>("false", HttpStatus.OK);
	}

	
	// 여기부터 김상욱 꺼
	
	@RequestMapping("topList.fm")
	public void boardTopList(HttpServletResponse response) throws IOException {
		
		response.setContentType("application/json; charset=utf-8");
		ArrayList<FMBoard> list = fbService.selectTopList();
		
		JSONArray jArr = new JSONArray();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		//System.out.println(list);
		
		for(FMBoard b : list) {
			b.setFbTitle(URLEncoder.encode(b.getFbTitle(),"utf-8"));
		}
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list, response.getWriter());
		
	}
	
	// 김상욱 추가 메소드
	@RequestMapping("bdetail2.fm")
	public ModelAndView selectOneBoard2(@RequestParam("fbId") int fbId, ModelAndView mv) {

		
//			System.out.println("디테일뷰 보드 출력 fbId : "+fbId);
		FMBoard board = fbService.selectBoard(fbId);

		if(board != null) {
//				System.out.println("디테일뷰 정보하나 불러오기 성공 "+board);
			
			mv.addObject("board", board).setViewName("fmBoardDetailView"); // method chaining 
		}else {
			throw new FMBoardException("게시글 상세보기를 실패하였습니다.");
		}
		
		return mv;
		
	}
	
	@RequestMapping("createCookie.fm")
	public void createCookie(HttpServletResponse response, HttpSession session, 
					FMBoard b, @RequestParam(value="img", required=false) String img) {
		String cookieValue = "";
		// 쿠키에 올릴때 space가 안올라감.  
		String title = b.getFbTitle().trim().replace(" ", "%32%");
		
		if(img == null || img == "") {
			cookieValue = b.getFbId()+"_"+b.getBcode()+"_"+title;
		}else {
			cookieValue = b.getFbId()+"_"+b.getBcode()+"_"+title+"_imageExists";
		}
		Cookie setCookie = new Cookie("recent_hm"+b.getFbId(), cookieValue);
		
		setCookie.setComment("최근본게시물") ;
		setCookie.setMaxAge(60*60*24); // 기간을 하루로 지정
		System.out.println("쿠키생성 : " +setCookie.getValue());
		response.addCookie(setCookie);
	}
	
//	@RequestMapping("recentPost.fm")
//	public void recentPost(@RequestParam("bcode") String bcode, @RequestParam("bId") String bId) {
//		HashMap<String, String> map = new HashMap<String, String>();
//			map.put("bcode", bcode);
//			map.put("bId", bId);
//		
//		if(bcode.equals("FMBOARD")) {
//			int fbId = Integer.parseInt(bId);
//			FMBoard board = fbService.selectBoard(fbId);
//			map.put("bId", bId);
//			map.put("bTitle", board.getFbTitle());
//			map.put("bcode", bcode);
//			
//		}else if(bcode.equals("HMBOARD")) {
//			int hbId = Integer.parseInt(bId);
//			HMBoard board = hbService.selectBoard(hbId);
//			map.put("bId", bId);
//			map.put("bTitle", board.getHbTitle());
//			map.put("bcode", bcode);
//		}else {
//			int rbId = Integer.parseInt(bId);
//			RMBoard board = rbService.selectBoard(rbId);
//			map.put("bId", bId);
//			map.put("bTitle", board.getRbTitle());
//			map.put("bcode", bcode);
//		}
//		
//	}
//	
	
}


