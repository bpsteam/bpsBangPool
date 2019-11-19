<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 비밀번호 확인</title>
</head>
<body>
<!-- ==== HEADER START ==== -->
	<c:import url ="../common/header.jsp"/>
<!-- ==== HEADER END ==== -->

<!--  ==== BEGIN CONTENT ==== -->

	<div id="content" class="bottom-border-shadow">
		<div class="container background-gray-lighter">

			<div>
				<hr class="margin-bottom-10">
			</div>
			<div class="row margin-vert-30" style="text-align:-webkit-center">

				<div class="panel panel-default col-md-6" style="float:unset" >
					<div class="panel-heading">
						<h3 class="panel-title"><b><i class="fa fa-lock"></i> 회원 비밀번호 확인</b></h3>
					</div>
					<div class="panel-body" style="text-align:left">

							<p>
								<strong>비밀번호를 한번 더 입력해주세요.</strong> <br> 회원님의 정보를 안전하게 보호하기
								위해 비밀번호를 한번 더 확인합니다.
							</p>

							<form class="form" role="form" name="fmemberconfirm"
								action="pwdConfirm.me" onsubmit="return fmemberconfirm_submit(this);" method="post">

								<div class="form-group has-feedback" >
									<label><b>회원아이디 : 
									<span id="mb_confirm_id" class="text-primary">${loginUser.email }</span>
									</b></label> 
									<input type="password" name="pwd" id="pwd" required
										class="form-control input-sm" size="15" maxlength="20">
									<input type="hidden" name="email" value="${ loginUser.email }"/>
									<span class="fa fa-lock form-control-feedback"></span>
								</div>

								<button type="submit" id="btn_sumbit"
									class="btn btn-danger btn-block">확인하기</button>
							</form>

					</div>
				</div>



			</div>

			<div>
				<hr class="margin-top-10">
			</div>
		</div>
	</div>

	<!--  ==== END CONTENT ==== -->
 
 <!-- 비밀번호 불일치 모달 -->
	<div class="modal fade" id="pwdNotMatch" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">비밀번호 불일치</h4>
				</div>
				<div class="modal-body">
				가입시 입력하신 비밀번호와 일치하지 않습니다.<br>
				비밀번호를 다시 입력해주세요.
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
<!-- 비밀번호 불일치 모달 끝 -->


<!-- ==== FOOTER START ==== -->
	<c:import url ="../common/footer.jsp"/>
<!-- ==== FOOTER END ==== -->

<script>
$(function() {
	var match = "${match}";
	console.log(match);
	if (match == "F") {
		console.log("비밀번호 불일치");
		$("#pwdNotMatch").modal();
	} else {
		console.log("비밀번호 확인 전");
		$("#pwdNotMatch").hide();
	}
});
</script>
</body>
</html>