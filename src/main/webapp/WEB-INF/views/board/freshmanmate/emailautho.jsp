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
				placeholder="인증받을 대학교 이메일을 입력해주세요." 
				class="form-control input-sm email" size="50" maxlength="100">
		<span id="result-check">
		</span>
		</div>
		<button type="button" disabled class="btn btn-green btn-sm" id="emailBtn">인증번호발송</button>
	</div>

	<div class="form-group">
		<label class="col-sm-2 control-label" for="authoNo"> 인증번호
			<strong class="sound_only">*</strong>
		</label>
		<div class="col-sm-3">
			<input type="text" name="emailAuth" id="emailAuth" 
				class="form-control input-sm" maxlength="20" > 
		</div>
		<button type="button" disabled class="btn btn-bronze btn-sm" id="emailAuthBtn">인증번호확인</button>
	</div>
		<input type="hidden" id="random" value="${random}" />
		
 <script type="text/javascript" src="${contextPath}/resources/assets/js/jquery.min.js" type="text/javascript"></script>
		
<script>
	$("#emailBtn").blur(function(){
		var emailbtn=$('#emailBtn').val();
		if( emailbtn == null || emailbtn == "" ){
			$("#emailBtn").prop('disabled', true);
			$("#result-check").text('');
		}
	});
	
	$("#emailAuthBtn").blur(function(){
		var emailAuthBtn=$('#emailAuthBtn').val();
		
		if(emailAuthBtn == null || emailAuthBtn == ""){
			//$("#emailAuthBtn").prop('disabled', true);
		}
	});
	
	
	// 학교 이메일만 들어오게 유효성 검사 
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
	
	// blur : 인풋에서 커서가 떠나면
	$("#schoolemail").blur(function(){
	  var email = $(this).val();
	  if( email == '' || email == 'undefined') return;
	  // email_check(email) 이라는 함수를 통해 이메일 검사 후 결과 처리 ]
	  if(! email_check(email) ) { // 검사 통과 실패 (학교이메일X)
	  	$("#result-check").text('Not valid school email').css("color", "red");
	    $(this).focus();
	    return false;
	  } else { // 검사 통과 (학교이메일O)
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
						$("#emailAuth").attr('readonly',false);
			}, error: function(data){
						alert("이메일전송에러");
						return false;
			}		
		});
	});
	var validation = false;
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
					validation = true;
				}else if(data == "false"){
					alert("인증번호를 잘못 입력하셨습니다.");
				}
				
			},
			error:function(data){
				alert("인증에러발생");
				}
			});
		});
	
	$('#insertform').submit(function(e){
		if(validation){
			$('#insertform').submit();
		}else{
			$('#insertform').submit();
			/* e.preventDefault();
			alert("이메일 인증은 필수입니다.");
			$('#emailAuth').select(); */
		}
		
	});
	
</script>

</body>

</html>

