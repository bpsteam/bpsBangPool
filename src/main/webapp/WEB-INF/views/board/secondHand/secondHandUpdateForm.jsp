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
                                        <h3 class="panel-title">공지사항</h3>
                                    </div>
                                    <c:import url="../../common/noticeTopList.jsp"/>
                                </div>
                                <!-- End recent Posts -->
                                <!-- About -->
                                <div class="panel panel-default">
                                    <c:import url="../../common/recentPosts.jsp"/>
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