<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="form-group">
		<label class="col-sm-2 control-label" for="wr_email">대학생인증<strong class="sound_only">*</strong></label>
		<div class="col-sm-6">
			<input type="text" name="schoolemail" id="schoolemail"
				placeholder="인증받을 대학교 이메일을 입력해주세요."
				class="form-control input-sm email" size="50" maxlength="100">
		</div>
		<button type="button" class="btn btn-green btn-sm">인증번호발송</button>
	</div>

	<div class="form-group has-feedback">
		<label class="col-sm-2 control-label" for="wr_password"> 인증번호
			<strong class="sound_only">*</strong>
		</label>
		<div class="col-sm-3">
			<input type="password" name="wr_password" id="wr_password" required
				class="form-control input-sm" maxlength="20"> <span
				class="fa fa-check form-control-feedback"></span>
		</div>
	</div>

</body>
</html>