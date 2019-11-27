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
                       		<form action="nupdate.no" method="POST" enctype="Multipart/form-data">
									<input type="hidden" name="page" value="${ page }">
									<input type="hidden" name="nId" value="${ notice.nId }">
									<input type="hidden" name="renameFileName" value="${ notice.renameFileName }">
                                <div class="signup-header">
                                    <h2>공지사항 작성하기</h2>
                                    <p>추가하실 말씀을 작성해주세요</p>
                                </div>
                                <label>글제목</label>
                                <input name="nTitle" class="form-control margin-bottom-20" type="text" value="${ notice.nTitle }">
                                <label>작성자</label><br>
                                <input name="nWriter" value="${ loginUser.nickname }"><br><br>
                                <label>게시글</label><br>
                                <textarea name="nContent" style="resize: none; width: 680px; height: 400px;">${ notice.nContent }</textarea>
                                <hr>
                                <!-- <button class="btn btn-primary " type="submit">파일삭제</button> --> 
                                <!-- <input type="file" style="display: none;" id="upFilebutton"> -->
                                
                                <span>첨부파일</span>
                                <div>
                                	<input type="file" name="reloadFile">
                                	<c:if test="${ !empty notice.originalFileName }">
                                		<br>
                                		현재 업로드한 파일 : 
                                		<a href="${ contextPath }/resources/buploadFiles/${ notice.renameFileName }" download="${ notice.originalFileName }">
										${ notice.originalFileName }
										</a>
                                	</c:if>
                                </div>
                                
                                <div class="row">
                                    <div class="col-lg-4 pull-right">
	                                        <button class="btn btn-primary " onclick="location.href ='nList.no'" type="button">목록으로</button>
										
                                        	<button class="btn btn-primary " type="submit" >수정하기</button>
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

</body>
</html>