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
		<label class="col-sm-2 control-label" for="email">대학생인증<strong class="sound_only">*</strong></label>
		<div class="col-sm-6">
			<input type="text" name="schoolemail" id="schoolemail"
				placeholder="인증받을 대학교 이메일을 입력해주세요."
				class="form-control input-sm email" size="50" maxlength="100">
		</div>
		<button type="button" class="btn btn-green btn-sm" id="emailBtn">인증번호발송</button>
	</div>

	<div class="form-group">
		<label class="col-sm-2 control-label" for="authoNo"> 인증번호
			<strong class="sound_only">*</strong>
		</label>
		<div class="col-sm-3">
			<input type="text" name="emailAuth" id="emailAuth" required
				class="form-control input-sm" maxlength="20"> 
		</div>
		<button type="button" class="btn btn-bronze btn-sm" id="emailAuthBtn">인증번호확인</button>
	</div>
		<input type="hidden" id="random" value="${random}" />
		
 <script type="text/javascript" src="${contextPath}/resources/assets/js/jquery.min.js" type="text/javascript"></script>
		
<script>

/*
이메일 인증 버튼 클릭시 발생하는 이벤트
*/
$("#emailBtn").on("click",function(){
/* 이메일 중복 체크 후 메일 발송 비동기 처리 */
	$.ajax({
		/* beforeSend: function(){
			loadingBarStart();
		}, */
		type:"get",
		url : "emailcheck.fm",
		data : "schoolemail=" + $("#schoolemail").val() + "&random=" + $("#random").val(),
		//data: "userEmail="+encodeURIComponent($('#userEmail').val()),
		/* encodeURIComponent
		예를들어, http://a.com?name=egoing&job=programmer 에서 &job=programmer
		중 '&'는 하나의 파라미터가 끝나고 다음 파라미터가 온다는 의미이다.
		그런데 다음과 같이 job의 값에 &가 포함된다면 시스템은 job의 값을 제대로 인식할수 없게 된다. */
		success : function(data){
					alert("사용가능한 이메일입니다. 인증번호를 입력해주세요.");
				
		}, error: function(data){
					alert("이메일전송에러");
					console.log(data);
					return false;
		}		
	});
});
/*
이메일 인증번호 입력 후 인증 버튼 클릭 이벤트
*/
$("#emailAuthBtn").on("click",function(){
	$.ajax({
		/* beforeSend: function(){
			loadingBarStart();
		}, */
		type:"get",
		url:"emailAutho.fm",
		data:"authCode=" + $('#emailAuth').val() + "&random=" + $("#random").val(),
		success:function(data){
			if(data=="complete"){
				alert("인증이 완료되었습니다.");
			}else if(data == "false"){
				alert("인증번호를 잘못 입력하셨습니다.");
			}
		},
		/* complete: function(){
			loadingBarEnd();
		}, */
		error:function(data){
			alert("인증에러발생");
			}
		});
	});
	
</script>

</body>

</html>

