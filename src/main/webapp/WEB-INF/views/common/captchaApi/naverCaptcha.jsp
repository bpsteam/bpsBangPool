<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- <script> 
		var g5_captcha_url = "https://openapi.naver.com/v1/captcha/nkey";
	</script>
	<script src="https://openapi.naver.com/v1/captcha/nkey"></script> -->
	<fieldset id="captcha" class="captcha">
		<legend>
			<label for="captcha_key">자동등록방지</label>
		</legend>
		<div class="col-md-6" id="captchaDiv">
		<!-- <img src=""
			alt="" id="captcha_img" style="float:right"> -->
		<br>
		
		</div>
		<div class="col-md-5">
		<br>
		<button type="button" id="checkNo"  >
			확인
		</button>
		<button type="button" id="capReload"  >
			<span></span>새로고침
		</button>
		<input type="text" name="captcha_key" id="value"
			required class="captcha_box required" size="15"
			maxlength="15" style="float:left"> <br><span id="captcha_info"style="float:left">자동등록방지
			숫자를 순서대로 입력하세요.</span>
		</div>
		<input type="hidden" id="key" name="key">
	</fieldset>
	
	<script>
	
	$('#capReload').on('click', function(){
		$("#submit").attr('disabled',true);
		$.ajax({
			url : "captchaKey.do",
			success : function(data) {
				console.log(data);
				$('#key').val(data);
				getCaptchaImg();
			}, error : function(data){
				console.log("error : "+data);
			}
		});
	});
	
	$(document).ready(function() { // 키발급 요청
		$.ajax({
			url : "captchaKey.do",
			success : function(data) {
				console.log(data);
				// 컨트롤러에서 받아오는 key값을 hidden input 태그에 value 설정
				$('#key').val(data); // PrintWriter를 사용하여 받아온 키 값 
				// 방아온 키를 사용하여 이미지를 받아오기 위한 메소드
				getCaptchaImg();
			}, error : function(data){
				console.log("error : "+data);
			}
		});
		
	});
	
	function getCaptchaImg(){ // 캡차 이미지 요청
		$(function(){
			// hidden input에 담아 준 키 가지고 이미지 받으러 가는 ajax 실행
			var key = $("#key").val();
			$.ajax({
				url: "captchaImg.do",
				data: {key: key},
				success: function(data){
					// 성공하고 받아오는 이미지 이름으로 경로 찾아서 div에서 출력해주기
					$("#captchaDiv").html // PrintWriter로 받아온 이미지 파일이름
					("<img src='${ contextPath }/resources/captchaImg/"+data+"'>")
					.css('float','left');
				}
			});
		});
	}
	
	
	 $("#checkNo").on("click",function(){ // 키 & value 비교
		// 인증 키 값과 사용자가 입력한 value를 가지고 비교하는 ajax
		var key = $("#key").val();
		var value = $("#value").val();
		$.ajax({
			url : "checkNo.do",
			data : {key:key,value:value},
			dataType:"json", // json 타입으로 반환
			success : function(data) {
				// 값 비교 후 성공하면 성공 알림창, 실패하면 실패 알림창 
				if(data.result){
					alert("성공");
					$("#submit").attr('disabled',false);
				}else{
					alert("일치하지 않습니다. 다시 확인해주세요.");
				}
			},error : function(data){
				alert("에러");
				console.log(data);
			}
		});
	}); 
	 
	
</script>
	
</body>
</html>