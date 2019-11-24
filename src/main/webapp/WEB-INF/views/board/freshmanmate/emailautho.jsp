<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body id="emailbody">
	<div class="form-group">
		<label class="col-sm-2 control-label" for="email">대학생인증<strong class="sound_only">*</strong></label>
		<div class="col-sm-6">
			<input type="email" name="schoolemail" id="schoolemail"
				placeholder="인증받을 대학교 이메일을 입력해주세요." required
				class="form-control input-sm email" size="50" maxlength="100">
		<span id="result-check">
		</span>
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
	$(function(){
		$("#emailBtn").prop('disabled', true);
		$("#emailAuthBtn").prop('disabled', true);
	});
	// email check function
	function email_check(email) {   
	  var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	  var regExpKor = /ac.kr/; 
	  var regExpFor = /.edu/; 
		var test = false;
		
	  if(regExpKor.test(email) || regExpFor.test(email)){
		  test = true;
	  }else{
		  test= false;
	  }
	  return (email != '' && email != 'undefined' && test ); 
	}
	
	// check when email input lost foucus
	$("#schoolemail").blur(function(){
	  var email = $(this).val();
	
	  // if value is empty then exit
	  if( email == '' || email == 'undefined') return;
	
	  // valid check
	  if(! email_check(email) ) {
		  console.log("나와봐 " +email_check(email));
	  	$("#result-check").text('Not valid school email').css("color", "red");
	    $(this).focus();
	    return false;
	  }
	  else {
		  console.log("성공 나와봐 " +email_check(email));
	  	$("#result-check").text('Email address test OK.').css("color","green");
	  	$("#emailBtn").prop('disabled', false);
	  }
	});
	
	
	/*
	이메일 인증 버튼 클릭시 발생하는 이벤트
	*/
	$("#emailBtn").on("click",function(){
		$.ajax({
			type:"get",
			url : "emailcheck.fm",
			data : "schoolemail=" + $("#schoolemail").val() + "&random=" + $("#random").val(),
			success : function(data){
						alert("사용가능한 이메일입니다. 인증번호를 입력해주세요.");
						$("#emailAuthBtn").prop('disabled', false);
			}, error: function(data){
						alert("이메일전송에러");
						return false;
			}		
		});
	});
	/*
	이메일 인증번호 입력 후 인증 버튼 클릭 이벤트
	*/
	$("#emailAuthBtn").on("click",function(){
		$.ajax({
			type:"get",
			url:"emailAutho.fm",
			data:"authCode=" + $('#emailAuth').val() + "&random=" + $("#random").val(),
			success:function(data){
				if(data=="complete"){
					alert("인증이 완료되었습니다.");
					
					$("#schoolemail").attr('readonly',true);
					$("#emailAuth").attr('readonly',true);
					
				}else if(data == "false"){
					alert("인증번호를 잘못 입력하셨습니다.");
				}
			},
			error:function(data){
				alert("인증에러발생");
				}
			});
		});
	
	
	
</script>

</body>

</html>

