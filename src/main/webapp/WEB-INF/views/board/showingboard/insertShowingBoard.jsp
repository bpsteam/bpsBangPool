<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
    <body>
        <!-- ==== HEADER START ==== -->
	    <c:import url ="../../common/header.jsp"/>
	    <!-- ==== HEADER END ==== -->
            <!-- === BEGIN CONTENT === -->
            <div id="content">
                <div class="container background-white">
                    <div class="row margin-vert-30">
                        <!-- insertShowingBoard start Box -->
                        <div class="col-md-9 ">
                            <form id="insertForm" class="form-group" action="binsertShowingBoard.sb" method="post" enctype="Multipart/form-data">
                                <div class="signup-header">
                                    <h2><b>자랑하기 작성하기</b></h2>
                                    <p>추가하실 말씀을 작성해주세요</p>
                                </div>
                                <label><h3>글제목</h3></label>
                                <input class="form-control margin-bottom-20" type="text" style="width: 700px; height: 55px; font-size:16px;" name="sbtitle">
                                <label><h3>작성자</h3></label><br>
                                <c:if test="${ !empty sessionScope.loginUser }">
                                	<input class="form-control margin-bottom-20"  name="sbwriter" value="${ loginUser.nickname }" style="width: 700px; height: 55px; font-size:16px;"></input><br>
                                </c:if>
                                <!-- start sending 게시글 -->
                                <label><h3>게시글</h3></label><br>
                                <div id="dbText" class="form-control margin-bottom-20" contenteditable="true" style="width: 700px; height: 400px;"></div>
                                <textarea id="jsText" class="form-control margin-bottom-20" style="resize:none; display:none; width: 700px; height: 400px;" name="sbcontent" ></textarea>
                                <!-- end sending 게시글 -->
                                <hr>
                                <label>자랑하기 게시판은 사진일 필수인 게시판입니다.</label><br>
                                <button class="btn btn-primary " type="reset">파일삭제</button> 
	                                <input type="file" id="upFilebutton" style="display:none" name="uploadFile[]" 
                                			accept="image/*" onchange="javascript:getRealPath(this)" multiple="multiple" required>
	                                <button type="button" class="btn btn-primary" onclick="upFile()">파일올리기</button>
	                                <input type="text" id="fileName" name="fileName" style="width: 510px; height: 34px; padding-bottom:3px;"/>
                                	<br><br>
                                <div class="row">
                                    <div class="col-lg-4 pull-right">
                                        <button class="btn btn-primary " onclick="location.href='bShowing.sb'" type="button">목록으로</button>
                                        <button class="btn btn-primary " type="button" onclick="sendingText()">등록하기</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- insertShowingBoard end Box -->
                        <!-- Side Column start -->
                        <div class="col-md-3">
                                <!-- Recent Posts -->
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">공지사항</h3>
                                    </div>
                                    <c:import url="../../common/noticeTopList.jsp"/>
                                </div>
                                <!-- End recent Posts -->
                                <!-- About -->
                                <div class="panel panel-default">
	                                <!-- 이슈 시작-->
									<c:import url="../../common/recentPosts.jsp"/>
									<!-- 이슈 끝-->
                                </div>
                             	<!-- End About -->
                            </div>
                        <!-- Side Column end -->
                    </div>
                </div>
            </div>
            <script>
            	// upload button
                function upFile(){
                    var uploadFile = document.getElementById("upFilebutton");
                    uploadFile.click();
                }
                // path writer
                function getRealPath(t){
                	var files = document.getElementById("upFilebutton").files;
                	for(var i = 0; i < files.length; i++){
                		if(i < files.length-1)
                			document.getElementById("fileName").value += files[i].name+", ";
                		else
                			document.getElementById("fileName").value += files[i].name;
                	}
                }
				// sending text
				function sendingText(){
					var insertText = document.getElementById("dbText").innerHTML
					document.getElementById("jsText").value = document.getElementById("dbText").innerHTML;
					document.getElementById("insertForm").submit();
				}
            </script>
            <!-- === END CONTENT === -->
            <!-- === BEGIN FOOTER === -->
            <c:import url ="../../common/footer.jsp"/>
            <!-- === END FOOTER === -->
    </body>
</html>
