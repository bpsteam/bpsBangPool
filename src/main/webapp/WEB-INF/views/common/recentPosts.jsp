<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.Cookie" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	<div class="panel-body"  style="background-color: white">
	    <ul class="post-list" style="list-style: none; padding:0px;">
	    <%
	    String bId ="";
		String bcode ="";
		String fbTitle ="";
	    Cookie[] cookies = request.getCookies();
	    System.out.println("쿠키개수 : "+cookies.length);
	    for(Cookie c : cookies){
	        System.out.println("cookies: " +c);
	        System.out.println("cookies: " +c.getValue());
	    }
	     /*    String cName = c.getName();
	        if(cName.equals("recentList")){
	        	String cValue = c.getValue() ;
	 			System.out.println("쿠키불러오기 name : "+cName+" value: "+cValue);
	 			
	 			bId = cValue.split("_")[1];
	 			bcode = cValue.split("_")[2];
	 			fbTitle = cValue.split("_")[3];
	 			pageContext.setAttribute("bcode", bcode) ;
	 			pageContext.setAttribute("fbTitle", fbTitle) ;
	 			pageContext.setAttribute("bId", bId) ; */
	    %>
	  <%--   <c:set var=cValue value="${ cValue }"/>
	 	 <c:forTokens  var="name" items="${ cValue }" delims="_"> --%>
		     
		      <li class="ellipsis">
		          <a href="#">
		              <span class="subject_title">
		              <b> <c:out value="${ fbTitle }"/></b></span>
		          </a>
		      </li>
		<%-- </c:forTokens> --%>
	<%-- 	<%
	        } 수정해
	    } %> --%>
	  </ul>
	</div>
	
	
</body>
</html>