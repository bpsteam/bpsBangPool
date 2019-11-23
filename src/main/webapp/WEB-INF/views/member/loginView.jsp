<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>로그인</title>
</head>
<body>

<!-- ==== HEADER START ==== -->
	<c:import url ="../common/header.jsp"/>
<!-- ==== HEADER END ==== -->

<!--  ==== BEGIN CONTENT ==== -->

	<div id="content" class="bottom-border-shadow">
		<div class="container background-gray">

			<div>
				<hr class="margin-bottom-10">
			</div>
			<div class="row margin-vert-30">

				<!-- Login Box -->
				<div class="col-md-6 col-md-offset-3 col-sm-offset-3">
					<form class="login-page" action="login.me" method="post"
						id="loginForm">
						<div class="login-header margin-bottom-30">
							<h2>Login to your account</h2>
						</div>
						<div class="input-group margin-bottom-20">
							<span class="input-group-addon"> <i class="fa fa-user"></i>
							</span> <input placeholder="Username" name="email" class="form-control"
								type="text">
						</div>
						<div class="input-group margin-bottom-20">
							<span class="input-group-addon"> <i class="fa fa-lock"></i>
							</span> <input placeholder="Password" name="pwd" class="form-control"
								type="password">
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="checkbox"> <input type="checkbox">Stay
									signed in
								</label>
							</div>
							<div class="col-md-6">
								<button class="btn btn-primary pull-right" type="submit">Login</button>
							</div>
						</div>
						<hr>
						<!--  <h4>Forget your Password ?</h4>
                                    <p>
                                        <a href="#">Click here</a>to reset your password.</p> -->
<script>
var naver = "${naverUrl}";
console.log("naver: "+naver);
</script>
						<!-- 네이버 로그인 화면으로 이동 시키는 URL -->
						<!-- 네이버 로그인 화면에서 ID, PW를 올바르게 입력하면 callback 메소드 실행 요청 -->
						<div id="naver_id_login" style="text-align: center">
							<a href="${naverUrl}"> <img width="223"
								src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
						</div>
						<div class="margin-top-20" id="kakao_id_login" style="text-align: center">
						<%-- 	<a href="${kakaoUrl}">  --%>
							<img width="223"
								src="${ contextPath }/resources/assets/img/bps/kakao_login_btn.png" />
							<!-- 	</a> -->
						</div>
					</form>
				</div>
				<!-- End Login Box -->
			</div>

			<div>
				<hr class="margin-top-10">
			</div>
		</div>
	</div>

	<!--  ==== END CONTENT ==== -->
 
 
  
  
  
<!-- ==== FOOTER START ==== -->
	<c:import url ="../common/footer.jsp"/>
<!-- ==== FOOTER END ==== -->
  
</body>
</html>