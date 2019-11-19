<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="at-body">
		<div class="at-container">
				<div class="at-content">
						
					<div class="row">
						<div class="col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-3">
							<div class="form-box">
								<div class="form-header">
									<h2><b><i class="fa fa-lock"></i> 회원 비밀번호 확인</b></h2>
								</div>
								<div class="form-body">
									<p>
										<strong>비밀번호를 한번 더 입력해주세요.</strong>
										<br>
																회원님의 정보를 안전하게 보호하기 위해 비밀번호를 한번 더 확인합니다.
														</p>
					
									<form class="form" role="form" name="fmemberconfirm" action="register_form.php" onsubmit="return fmemberconfirm_submit(this);" method="post">
									<input type="hidden" name="mb_id" value="khajsfirepunch">
									<input type="hidden" name="w" value="u">
					
										<div class="form-group has-feedback">
											<label><b>회원아이디 : <span id="mb_confirm_id" class="text-primary">khajsfirepunch</span></b></label>
											<label class="sound_only" for="confirm_mb_password">비밀번호<strong class="sound_only">필수</strong></label>
									        <input type="password" name="mb_password" id="confirm_mb_password" required="" class="form-control input-sm" size="15" maxlength="20">
											<span class="fa fa-lock form-control-feedback"></span>
										</div>
					
										<button type="submit" id="btn_sumbit" class="btn btn-color btn-block">확인하기</button>
									</form>
								</div>
							</div>
						</div>
					</div>
	
					<div class="text-center" style="margin:30px 0px;">
					<!-- 수정 -->
						<a href="http://myroom.oceanmate.co.kr/" class="btn btn-black btn-sm" role="button">메인으로</a>
					</div>
					
	
		<script>
		function fmemberconfirm_submit(f) {
		    document.getElementById("btn_submit").disabled = true;
		
		    return true;
		}
		</script>
			<!-- } 회원 비밀번호 확인 끝 -->									
			</div><!-- .at-content -->
		</div><!-- .at-container -->
	</div>

</body>
</html>