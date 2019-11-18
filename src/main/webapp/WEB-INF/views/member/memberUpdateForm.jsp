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
		<script src="http://myroom.oceanmate.co.kr/js/jquery.register_form.js"></script>
		
		<form class="form-horizontal register-form" role="form" id="fregisterform" name="fregisterform" action="http://myroom.oceanmate.co.kr/bbs/register_form_update.php" onsubmit="return fregisterform_submit(this);" method="post" enctype="multipart/form-data" autocomplete="off">
			<input type="hidden" name="w" value="u">
			<input type="hidden" name="url" value="%2Fbbs%2Fregister_form.php">
			<input type="hidden" name="pim" value=""> 
			<input type="hidden" name="agree" value="">
			<input type="hidden" name="agree2" value="">
			<input type="hidden" name="cert_type" value="">
			<input type="hidden" name="cert_no" value="">
			<input type="hidden" name="mb_sex" value="">			<input type="hidden" name="mb_nick_default" value="중중식">
				<input type="hidden" name="mb_nick" value="중중식">
			
			<div class="panel panel-default">
				<div class="panel-heading"><strong><i class="fa fa-star fa-lg"></i> 사이트 이용정보 입력</strong></div>
				<div class="panel-body">
		
					<div class="form-group has-feedback text-gap">
						<label class="col-sm-2 control-label" for="reg_mb_id"><b>아이디</b><strong class="sound_only">필수</strong></label>
						<div class="col-sm-3">
							<input type="text" name="mb_id" value="khajsfirepunch" id="reg_mb_id" readonly="" class="form-control input-sm" minlength="3" maxlength="20">
							<span class="fa fa-check form-control-feedback"></span>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-8 text-muted">
							<div id="msg_mb_id"></div>
							영문자, 숫자, _ 만 입력 가능. 최소 3자이상 입력하세요.
						</div>
					</div>
		
					<div class="form-group has-feedback">
						<label class="col-sm-2 control-label" for="reg_mb_password"><b>비밀번호</b><strong class="sound_only">필수</strong></label>
						<div class="col-sm-3">
							<input type="password" name="mb_password" id="reg_mb_password" class="form-control input-sm" minlength="3" maxlength="20">
							<span class="fa fa-lock form-control-feedback"></span>
						</div>
						<label class="col-sm-2 control-label" for="reg_mb_password_re"><b>비밀번호 확인</b><strong class="sound_only">필수</strong></label>
						<div class="col-sm-3">
							<input type="password" name="mb_password_re" id="reg_mb_password_re" class="form-control input-sm" minlength="3" maxlength="20">
							<span class="fa fa-check form-control-feedback"></span>
						</div>
					</div>
				</div>
			</div>
		
			<div class="panel panel-default">
				<div class="panel-heading"><strong><i class="fa fa-user fa-lg"></i> 개인정보 입력</strong></div>
				<div class="panel-body">
		
					<div class="form-group has-feedback">
						<label class="col-sm-2 control-label" for="reg_mb_name"><b>이름</b><strong class="sound_only">필수</strong></label>
						<div class="col-sm-3">
							<input type="text" id="reg_mb_name" name="mb_name" value="안정식" readonly="" class="form-control input-sm" size="10">
							<span class="fa fa-check form-control-feedback"></span>
						</div>
									</div>
		
					
					
					<div class="form-group has-feedback">
						<label class="col-sm-2 control-label" for="reg_mb_email"><b>E-mail</b><strong class="sound_only">필수</strong></label>
						<div class="col-sm-5">
							<input type="hidden" name="old_email" value="ajs15010120@gmail.com">
							<input type="text" name="mb_email" value="ajs15010120@gmail.com" id="reg_mb_email" required="" class="form-control input-sm email" size="70" maxlength="100">
							<span class="fa fa-envelope form-control-feedback"></span>
						</div>
					</div>
					
					
					
									<div class="form-group has-feedback">
							<label class="col-sm-2 control-label" for="reg_mb_hp"><b>휴대폰번호</b></label>
							<div class="col-sm-3">
								<input type="text" name="mb_hp" value="010-8787-3759" id="reg_mb_hp" class="form-control input-sm" maxlength="20">
								<span class="fa fa-mobile form-control-feedback"></span>
													</div>
						</div>
					
					
				</div>
			</div>
		
			<div class="panel panel-default">
				<div class="panel-heading"><strong><i class="fa fa-cog fa-lg"></i> 기타 개인설정</strong></div>
				<div class="panel-body">
				
		
					<div class="form-group">
					<label class="col-sm-2 control-label" for="reg_mb_profile"><b>회원아이콘</b></label>
					<div class="col-sm-8">
						<input type="file" name="mb_icon" id="reg_mb_icon">
							<span class="help-block">
								이미지 크기는 가로 22픽셀, 세로 22픽셀 이하로 해주세요.
								gif만 가능하며 용량 5,000바이트 이하만 등록됩니다.
							</span>
					</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label" for="reg_mb_mailling"><b>메일링서비스</b></label>
						<div class="col-sm-8">
							<label class="control-label">
								<input type="checkbox" name="mb_mailling" value="1" id="reg_mb_mailling">
								정보 메일을 받겠습니다.
							</label>
						</div>
					</div>
		
									<div class="form-group">
							<label class="col-sm-2 control-label" for="reg_mb_sms"><b>SMS 수신여부</b></label>
							<div class="col-sm-8">
								<label class="control-label">
									<input type="checkbox" name="mb_sms" value="1" id="reg_mb_sms">
									휴대폰 문자메세지를 받겠습니다.
								</label>
							</div>
						</div>
					
									<div class="form-group">
							<label class="col-sm-2 control-label" for="reg_mb_open"><b>정보공개</b></label>
							<div class="col-sm-8">
								<label class="control-label">
									<input type="hidden" name="mb_open_default" value="0">
									<input type="checkbox" name="mb_open" value="1" id="reg_mb_open">
									다른분들이 나의 정보를 볼 수 있도록 합니다.
								</label>
								<span class="help-block">
									정보공개를 바꾸시면 앞으로 0일 이내에는 변경이 안됩니다.
								</span>
							</div>
						</div>
					
					
					<div class="form-group">
						<label class="col-sm-2 control-label"><b>자동등록방지</b></label>
						<div class="col-sm-8">
							
		<script>var g5_captcha_url  = "http://myroom.oceanmate.co.kr/plugin/kcaptcha";</script>
		<script src="http://myroom.oceanmate.co.kr/plugin/kcaptcha/kcaptcha.js"></script>
		<fieldset id="captcha" class="captcha">
		<legend><label for="captcha_key">자동등록방지</label></legend>
		<img src="http://myroom.oceanmate.co.kr/plugin/kcaptcha/kcaptcha_image.php?t=1573717588104" alt="" id="captcha_img">
		<button type="button" id="captcha_mp3"><span></span>숫자음성듣기</button>
		<button type="button" id="captcha_reload"><span></span>새로고침</button><input type="text" name="captcha_key" id="captcha_key" required="" class="captcha_box required" size="6" maxlength="6">
		<span id="captcha_info">자동등록방지 숫자를 순서대로 입력하세요.</span>
		</fieldset>				</div>
					</div>
				</div>
			</div>
		
			<div class="text-center" style="margin:30px 0px;">
				<button type="submit" id="btn_submit" class="btn btn-color" accesskey="s">정보수정</button>
							<a href="http://myroom.oceanmate.co.kr" class="btn btn-black" role="button">취소</a>
					</div>
		
		</form>

<script>
$(function() {
	$("#reg_zip_find").css("display", "inline-block");

		});

// submit 최종 폼체크
function fregisterform_submit(f)
{
	// 회원아이디 검사
	if (f.w.value == "") {
		var msg = reg_mb_id_check();
		if (msg) {
			alert(msg);
			f.mb_id.select();
			return false;
		}
	}

	if (f.w.value == "") {
		if (f.mb_password.value.length < 3) {
			alert("비밀번호를 3글자 이상 입력하십시오.");
			f.mb_password.focus();
			return false;
		}
	}

	if (f.mb_password.value != f.mb_password_re.value) {
		alert("비밀번호가 같지 않습니다.");
		f.mb_password_re.focus();
		return false;
	}

	if (f.mb_password.value.length > 0) {
		if (f.mb_password_re.value.length < 3) {
			alert("비밀번호를 3글자 이상 입력하십시오.");
			f.mb_password_re.focus();
			return false;
		}
	}

	// 이름 검사
	if (f.w.value=="") {
		if (f.mb_name.value.length < 1) {
			alert("이름을 입력하십시오.");
			f.mb_name.focus();
			return false;
		}

		/*
		var pattern = /([^가-힣\x20])/i;
		if (pattern.test(f.mb_name.value)) {
			alert("이름은 한글로 입력하십시오.");
			f.mb_name.select();
			return false;
		}
		*/
	}

	
	// 닉네임 검사
	if ((f.w.value == "") || (f.w.value == "u" && f.mb_nick.defaultValue != f.mb_nick.value)) {
		var msg = reg_mb_nick_check();
		if (msg) {
			alert(msg);
			f.reg_mb_nick.select();
			return false;
		}
	}

	// E-mail 검사
	if ((f.w.value == "") || (f.w.value == "u" && f.mb_email.defaultValue != f.mb_email.value)) {
		var msg = reg_mb_email_check();
		if (msg) {
			alert(msg);
			f.reg_mb_email.select();
			return false;
		}
	}

	
	if (typeof f.mb_icon != "undefined") {
		if (f.mb_icon.value) {
			if (!f.mb_icon.value.toLowerCase().match(/.(gif)$/i)) {
				alert("회원아이콘이 gif 파일이 아닙니다.");
				f.mb_icon.focus();
				return false;
			}
		}
	}

	if (typeof(f.mb_recommend) != "undefined" && f.mb_recommend.value) {
		if (f.mb_id.value == f.mb_recommend.value) {
			alert("본인을 추천할 수 없습니다.");
			f.mb_recommend.focus();
			return false;
		}

		var msg = reg_mb_recommend_check();
		if (msg) {
			alert(msg);
			f.mb_recommend.select();
			return false;
		}
	}

	if (!chk_captcha()) return false;

	document.getElementById("btn_submit").disabled = "disabled";

	return true;
}
</script>
									</div><!-- .at-content -->
						</div><!-- .at-container -->
			</div>

</body>
</html>