<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- === BEGIN HEADER === -->
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
                        <!-- Register Box -->
                        <div class="col-md-9 ">
                            <form action="shbupdate.se" class="form-group" method="post" enctype="Multipart/form-data">
                            	<input type="hidden" name="page" value="${ page }">
								<input type="hidden" name="shbId" value="${ board.shbId }">
								<input type="hidden" name="renameFileName" value="${ board.shbRenameFileName }">
                            
                                <div class="signup-header">
                                    <h2>중고판매 수정하기</h2>
                                </div>
                                <label>글제목</label>
                                <input value="${ board.shbTitle }"class="form-control margin-bottom-20" type="text" name="shbTitle">
                                <label>작성자</label><br>
                                <label>${ loginUser.nickname }</label><br><br>
             
                                <div class="col-md-12" style="padding: 0px;">
                                        <label>지역</label>
                                        <select class="form-control margin-bottom-20" name="shbLocation">
                                            <option value="">전체</option>
                                            <option value="서울특별시">서울특별시</option>
                                            <option value="인천광역시">인천광역시</option>
                                            <option value="대전광역시">대전광역시</option>
                                            <option value="대구광역시">대구광역시</option>
                                            <option value="광주광역시">광주광역시</option>
                                            <option value="울산광역시">울산광역시</option>
                                            <option value="부산광역시">부산광역시</option>
                                            <option value="경기도">경기도</option>
                                            <option value="강원도">강원도</option>
                                            <option value="충청북도">충청북도</option>
                                            <option value="충청남도">충청남도</option>
                                            <option value="경상북도">경상북도</option>
                                            <option value="경상남도">경상남도</option>
                                            <option value="전라북도">전라북도</option>
                                            <option value="전라남도">전라남도</option>
                                            <option value="귤">귤</option>
                                        </select>
                                    </div>
								<label>가격</label>
								<input value="${ board.shbPrice }" class="form-control margin-bottom-20" type="text" name="shbPrice">
                                <label>카테고리</label><br>
                                <select class="form-control margin-bottom-20" name="shbCategory">
                                    <option value="">Default</option>
                                    <option value="소파">소파</option>
                                    <option value="화장대">화장대</option>
                                    <option value="책상">책상</option>
                                    <option value="식탁">식탁</option>
                                    <option value="장식장">장식장</option>
                                </select>
                                <label>게시글</label><br>
                                <textarea style="resize: none; width: 680px; height: 400px;" name="shbContent">${ board.shbContent }</textarea>
                                <hr>
                                <!-- <button class="btn btn-primary " type="#">파일삭제</button> --> 
                                <input type="file" style="display: none;" id="upFilebutton" name="reloadFile">
                                <button type="button" class="btn btn-primary" onclick="upFile()">파일올리기</button>
                                <!-- <span> 파일이름 영역 </span> -->
                                <br><br>
                                <div class="row">
                                    <div class="col-lg-4 pull-right">
                                        <button class="btn btn-primary " type="reset">입력취소</button>
                                        <button class="btn btn-primary " type="submit">등록하기</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- End Register Box -->
                          <!-- Side Column -->
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
                            <!-- End Side Column -->
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