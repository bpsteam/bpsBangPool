<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${contextPath}/resources/js/jquery-3.4.1.min.js"></script>
</head>
<body>

<!-- ==== HEADER START ==== -->
	<c:import url ="../common/header.jsp"/>
<!-- ==== HEADER END ==== -->

<!-- === BEGIN CONTENT === -->
            <div id="content">
                <div class="container background-white">
                    <div class="row margin-vert-30">
                        <!-- Register Box -->
                        <div class="col-md-6 col-md-offset-3 col-sm-offset-3">
                        
                        
                             <form class="signup-page" action="minsert.me" method="post" id="joinForm">
                                <div class="signup-header">
                                    <h2>회원 가입</h2>
                                    <p>이미 회원이신가요?
                                        <a href="#">여기</a>를 눌러 로그인하세요!</p>
                                </div>
                                
                                <label>회원ID(E-Mail)
                                    <span class="color-red">*</span>
                                </label>
                                <input class="form-control margin-bottom-20" type="text" name="email">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <label>비밀번호
                                            <span class="color-red">*</span>
                                        </label>
                                        <input class="form-control margin-bottom-20" type="password" name="pwd">
                                    </div>
                                    <div class="col-sm-6">
                                        <label>비밀번호 확인
                                            <span class="color-red">*</span>
                                        </label>
                                        <input class="form-control margin-bottom-20" type="password" name="pwd2">
                                    </div>
                                </div>
                                <label>이름
                                    <span class="color-red">*</span>
                                </label>
                                <input class="form-control margin-bottom-20" type="text" name="name">
                                <label>닉네임
                                    <span class="color-red">*</span>
                                </label>
                                <input class="form-control margin-bottom-20" type="text" name="nickname">
                                <label>생년월일
                                    <!-- <span class="color-red">*</span> -->
                                </label>
                                <input class="form-control margin-bottom-20" type="text" name="birth">
                                <label>성별
                                    <!-- <span class="color-red">*</span> -->
                                </label>
                                <!-- <input class="form-control margin-bottom-20" type="text"> -->
                                <select class="form-control margin-bottom-20" name="gender">
                                	<option value="M">남성</option>
                                	<option value="F">여성</option>
                                </select>
                                <label>전화번호
                                   <!--  <span class="color-red">*</span> -->
                                </label>
                                <input class="form-control margin-bottom-20" placeholder="-없이 입력" type="tel" name="phone">
                                <label>주소
                                    <!-- <span class="color-red">*</span> -->
                                </label><br>
                               <!--  <input class="form-control margin-bottom-20" type="text" name="address"> -->
                                <input type="search" class="form-control postcodify_postcode5" id="post" name="post" placeholder="zipCode"
				                  style="width:50%;float:left">
				               
				                <button class="btn btn-sm btn-primary" type="button" id="postcodify_search_button" style="height:35px;float:left;margin-left:10px" >검색</button>
								<br><br>
				                <input type="text" class="form-control margin-bottom-20 postcodify_address" name="address1" id="address1" placeholder="address1">
				                <input type="text" class="form-control margin-bottom-20 postcodify_extra_info" name="address2" id="address2" placeholder="address2">
				                                
                                <img src="../noAuto.PNG"><br>
                                <label>자동등록 방지 확인
                                     <span class="color-red">*</span> 
                                </label>
                                <input class="form-control margin-bottom-20" type="text">
                                <hr>
                                <div class="row">
                                    <div class="col-lg-8">
                                        <!-- <label class="checkbox">
                                            <input type="checkbox">I read the
                                            <a href="#">Terms and Conditions</a>
                                        </label> -->
                                    </div>
                                    <div class="col-lg-4 text-right">
                                        <!-- <button class="btn btn-primary" type="submit">Register</button> -->
                                        <button type="submit" class="btn btn-primary" >Register</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- End Register Box -->
                    </div>
                </div>
            </div>
            <!-- === END CONTENT === -->


<!-- ==== FOOTER START ==== -->
	<c:import url ="../common/footer.jsp"/>
<!-- ==== FOOTER END ==== -->


 <!-- jQuery와 Postcodify를 로딩한다. -->
 <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
 <script>
    // 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
    $(function(){
       $("#postcodify_search_button").postcodifyPopUp();
    });
 </script>
 
 
</body>
</html>