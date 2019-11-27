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
		style="background-color: white; padding-bottom: 0px; height: 313px; overflow-y:scroll; overflow:hidden; ">
		<ul class="post-list" id="ultag" style=" list-style: none; padding: 0px; overflow:hidden; text-overflow:ellipsis">
			<%
	    String bId ="";
		String bcode ="";
		String bTitle ="";
		String img="";
		
	    Cookie[] cookies = request.getCookies();
	    
	    for(Cookie c : cookies){
	    	
	        if(c.getName().contains("recent_")){
	        	String cValue = c.getValue();
	        	
	 			bId = cValue.split("_")[0];
	 			bcode = cValue.split("_")[1];
	 			bTitle = cValue.split("_")[2].replace("%32%"," ");
	 			
		 			if(cValue.split("_").length>3){
		 				img=cValue.split("_")[3];
			 			pageContext.setAttribute("img", img);
			 			System.out.println("cookie img print : " +img);
		 			}
		 		// JSP로 받은 값을 JSTL로 호환하기 위해 pageContext.setAttribute 사용
	 			pageContext.setAttribute("bcode", bcode);
	 			pageContext.setAttribute("bTitle", bTitle);
	 			pageContext.setAttribute("bId", bId);
	        %>

			<li class="ellipsis" style="padding:0px;text-align: left; " >
				<!-- pageContext.setAttribute로 올라온 값을 JSTL로 받아서 사용 -->
				<c:if test="${ bcode eq 'FMBCODE' }">
					<a href="bdetail.fm?bId=${bId }" />
				</c:if> <c:if test="${ bcode eq 'HMBCODE' }">
					<a href="bdetail.hm?bId=${bId }" />
				</c:if> <c:if test="${ bcode eq 'RMBCODE' }">
					<a href="bdetail.rm?bId=${bId }" />
				</c:if> <c:if test="${ img eq 'imageExists' }">
					<i class="fa-camera"></i>
				</c:if> <c:if test="${ empty img }">
					<i class="fa-file-text"></i>
				</c:if> 
					<b> <c:out value="${ bTitle }" /></b>
				</a>
			</li><br>
			<% 
	  	  }
	        
	    }%>
		</ul>
	 <%   if (cookies.length==1){ 
	    
	    %>
	    <ul style="text-align:center; padding:0px">
	    	<li class="ellipsis" style=" padding:0px"><span>최근
					본 게시물이 없습니다.</span></li>
		</ul>
	   <% 
	   }
	    %>
			<%-- </c:forTokens> --%>
			<%-- 	<%
	        } 수정해
	    } %> --%>
	</div>

<script>

/* 	$(function(){
		var bcode = "${bcode}";
		var bId = "${bId}";
		$.ajax({
			url: "recentPost.fm",
			data: {bcode: bcode, bId: bId},
			success: function(data){
				
			},error: function(data){
				alert("error");
			}
			
		});
	}); */

</script>
</body>
</html>