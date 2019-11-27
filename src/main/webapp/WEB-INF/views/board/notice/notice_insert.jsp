<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	
</head>
<body>

	<!-- ==== HEADER START ==== -->
	<c:import url ="../../common/header.jsp"/>
	<!-- ==== HEADER END ==== -->

	<div id="content">
                <div class="container background-white">
                    <div class="row margin-vert-30">
                        <!-- Register Box -->
                        <div class="col-md-9 ">
                       		<form action="nInsert.no" method="POST" enctype="Multipart/form-data">
                                <div class="signup-header">
                                    <h2>공지사항 작성하기</h2>
                                    <p>추가하실 말씀을 작성해주세요</p>
                                </div>
                                <label>글제목</label>
                                <input name="nTitle" class="form-control margin-bottom-20" type="text">
                                <label>작성자</label><br>
                                <input name="nWriter" value="${ loginUser.nickname }"><br><br>
                                <!-- start sending 게시글 -->
                                <label><h3>게시글</h3></label><br>
                                <textarea id="nContent" name="nContent" class="form-control margin-bottom-20" style="resize:none; width: 700px; height: 400px;"></textarea>
                                <hr>
                                <input type="file" name="uploadFile" class="btn btn-primary">
                                <button id="file_upload" type="button" class="btn btn-primary" onclick="upFile()">파일올리기</button>
                                <span> 파일이름 영역 </span><br><br>
                                <div class="row">
                                    <div class="col-lg-4 pull-right">
	                                        <button class="btn btn-primary " onclick="location.href ='nList.no'" type="button">목록으로</button>
                                        	<button class="btn btn-primary " type="submit" >등록하기</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- End Register Box -->
                          <!-- Side Column -->
                          <div class="col-md-3">
                          		<!-- category 시작 -->
					<c:import url="../../common/rightCategory.jsp" />
					<!-- category  끝-->
                            </div>
                            <!-- End Side Column -->
                    </div>
                </div>
            </div>
   <!-- ==== FOOTER START ==== -->
	<c:import url ="../../common/footer.jsp"/>
  <!-- ==== FOOTER END ==== -->
      <script type="text/javascript">
      
      	$(function(){
      		
      		$('#file_upload').click(function(){
      			
      		});
      		
	       function upFile(){
	           var uploadFile = document.getElementById("upFilebutton");
	           uploadFile.click();
	       }
      	});
      </script>

</body>
</html>