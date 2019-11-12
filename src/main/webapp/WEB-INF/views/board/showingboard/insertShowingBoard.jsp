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
                            <form class="form-group" action="binsertShowingBoard.sb" method="post" enctype="Multipart/form-data">
                                <div class="signup-header">
                                    <h2>자랑하기 작성하기</h2>
                                    <p>추가하실 말씀을 작성해주세요</p>
                                </div>
                                <label>글제목</label>
                                <input class="form-control margin-bottom-20" type="text" name="sbtitle">
                                <label>작성자</label><br>
                                <c:if test="${ !empty sessionScope.loginUser }">
                                	<input class="form-control margin-bottom-20"  name="sbwriter" value="${ loginUser.nickname }"></input><br><br>
                                </c:if>
                                <label>게시글</label><br>
                                <textarea style="resize: none; width: 680px; height: 400px;" name="sbcontent"></textarea>
                                <hr>
                                <button class="btn btn-primary " type="submit">파일삭제</button> 
                                <input type="file" id="upFilebutton" style="display:none" name="uploadFile[]" 
                                accept="image/*" onchange="javascript:document.getElementById('fileName').value = this.value" multiple="multiple" required>
                                <!-- <input type="file" id="upFilebutton" style="display:none" name="uploadFile" 
                                accept="image/*" onchange="javascript:document.getElementById('fileName').value = this.value" required> -->
                                <button type="button" class="btn btn-primary" onclick="upFile()">파일올리기</button>
                                <input type="text" id="fileName" name="fileName"/>
                                <br><br>
                                <div class="row">
                                    <div class="col-lg-4 pull-right">
                                        <button class="btn btn-primary " onclick="location.href='bShowing.sb'" type="button">목록으로</button>
                                        <button class="btn btn-primary " type="submit">등록하기</button>
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
                                        <h3 class="panel-title">인기 TOP 게시글</h3>
                                    </div>
                                    <div class="panel-body" style="height: 250px; overflow: auto;" >
                                        <ul class="posts-list margin-top-10">
                                            <li>
                                                <div class="recent-post">
                                                    <a href="">
                                                        <img class="pull-left" src="resources/assets/img/detailShowingImg/02.jfif" alt="thumb1">
                                                    </a>
                                                    <a href="#" class="posts-list-title">역삼역 자취생 방방방</a>
                                                    <br>
                                                    <span class="recent-post-date">
                                                        10 30, 2019
                                                    </span>
                                                </div>
                                                <div class="clearfix"></div>
                                            </li>
                                            <li>
                                                <div class="recent-post">
                                                    <a href="">
                                                        <img class="pull-left" src="resources/assets/img/detailShowingImg/04.jfif" alt="thumb2">
                                                    </a>
                                                    <a href="#" class="posts-list-title">강남역 쉐어하우스를 소개.</a>
                                                    <br>
                                                    <span class="recent-post-date">
                                                        10 28, 2019
                                                    </span>
                                                </div>
                                                <div class="clearfix"></div>
                                            </li>
                                            <li>
                                                <div class="recent-post">
                                                    <a href="">
                                                        <img class="pull-left" src="resources/assets/img/detailShowingImg/07.jfif" alt="thumb3">
                                                    </a>
                                                    <a href="#" class="posts-list-title">선릉에서 혼자 꾸미면서 살아요</a>
                                                    <br>
                                                    <span class="recent-post-date">
                                                        10 28, 2019
                                                    </span>
                                                </div>
                                                <div class="clearfix"></div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- End recent Posts -->
                                <!-- About -->
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">오늘의 자취 꿀팁</h3>
                                    </div>
                                    <div class="panel-body" style="overflow: auto;">
                                        1. 계란한판으로 맛있게 먹는 요리 <br>
                                        2. 인테리어 꾸르팁 <br>
                                        3. 쉐어하우스 잘 고르는 방법 <br>
                                        4. 동물을 키울수 있는 쉐어하우스 찾는 방법  <br>
                                    </div>
                                </div>
                             	<!-- End About -->
                            </div>
                        <!-- Side Column end -->
                    </div>
                </div>
            </div>
            <script>
                function upFile(){
                    var uploadFile = document.getElementById("upFilebutton");
                    uploadFile.click();
                }
            </script>
            <!-- === END CONTENT === -->
            <!-- === BEGIN FOOTER === -->
            <c:import url ="../../common/footer.jsp"/>
            <!-- === END FOOTER === -->
    </body>
</html>
