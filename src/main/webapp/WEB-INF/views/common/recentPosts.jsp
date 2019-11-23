<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.Cookie"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<div class="panel-heading">
		<h3 class="panel-title">Recent Posts</h3>
	</div>
	<div class="panel-body"
		style="background-color: white; padding-bottom: 0px; height: 313px; overflow-y:scroll;">
		<ul class="post-list" id="ultag" style="list-style: none; padding: 0px;">
			<%
	    String bId ="";
		String bcode ="";
		String fbTitle ="";
		String img="";
		
	    Cookie[] cookies = request.getCookies();
	    System.out.println("쿠키개수 : "+cookies.length);
	    
	    for(Cookie c : cookies){
	        System.out.println("cookies: " +c.getName());
	        System.out.println("cookies: " +c.getValue());
	    	
	        if(c.getName().contains("recent_")){
	        	String cValue = c.getValue();
	        	
	 			bId = cValue.split("_")[0];
	 			bcode = cValue.split("_")[1];
	 			fbTitle = cValue.split("_")[2];
	 			
		 			if(cValue.split("_").length>3){
		 				img=cValue.split("_")[3];
			 			pageContext.setAttribute("img", img);
		 			}
		 			
	 			pageContext.setAttribute("bcode", bcode);
	 			pageContext.setAttribute("fbTitle", fbTitle);
	 			pageContext.setAttribute("bId", bId);
	        %>

			<%-- <c:set var=cValue value="${ cValue }"/> --%>
			<%-- <c:forTokens  var="name" items="${ cValue }" delims="_">  --%>

			<li class="ellipsis" style="border-bottom: 1px solid #efefef;">
				<c:if test="${ bcode eq 'FMBCODE' }">
					<a href="bdetail.fm?bId=${bId }" />
				</c:if> <c:if test="${ bcode eq 'HMBCODE' }">
					<a href="bdetail.hm?bId=${bId }" />
				</c:if> <c:if test="${ bcode eq 'RMBCODE' }">
					<a href="bdetail.rm?bId=${bId }" />
				</c:if> <c:if test="${ ! empty img }">
					<i class="fa-camera"></i>
				</c:if> <c:if test="${ empty img }">
					<i class="fa-file-text"></i>
				</c:if> 
					<span class="subject_title"> 
					<b> <c:out value="${ fbTitle }" /></b></span> 
				</a>
			</li>
			<% 
	  	  }
	        
	    }
	    if (cookies.length==1){ 
	    
	    %>
	    	<li class="ellipsis" style="text-align: center"><span>최근
					본 게시물이 없습니다.</span></li>
	   <% 
	   }
	    %>
			<%-- </c:forTokens> --%>
			<%-- 	<%
	        } 수정해
	    } %> --%>
		</ul>
	</div>

</body>
</html>