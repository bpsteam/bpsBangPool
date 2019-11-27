<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 오른쪽 카테고리</title>
</head>
<body>

	<!-- Recent Posts -->
 
   <div class="margin-bottom-10">
       <hr>
   </div>

   <div class="panel panel-danger">
       <div class="panel-heading">
           <a href="blist.rm" style="color:white">
               <span class="pull-right lightgray font-16 en">+</span>
               <span class="div-title-underbar-bold border-navy font-16 en" >
                   <b>공지사항</b>
               </span>
           </a>
       </div>
       <div class="widget-box panel-body">
           <div class="basic-post-list ">
          <c:import url ="../../common/noticeTopList.jsp"/> 
          <%--  	<c:import url ="noticeTopList.jsp"/> --%>
           </div>
       </div>
   </div>
   <!-- End recent Posts -->
   <div class="margin-bottom-10">
       <hr>
   </div>
   <!-- End recent Posts -->
   <!-- RecentPost -->
   <div class="panel panel-info">

<!-- recentPost 최근 본 개시물 Import -->
<c:import url="../../common/recentPosts.jsp"/> 
<%-- <c:import url="recentPosts.jsp"/> --%>
<!-- recentPost Import -->
   </div>
   <!-- End RecentPost -->

</body>
</html>