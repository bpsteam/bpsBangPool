<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방풀</title>
<link rel="stylesheet" href="http://myroom.oceanmate.co.kr/css/default.css?ver=161101">
<link rel="stylesheet" href="http://myroom.oceanmate.co.kr/css/apms.css?ver=161101">
<link rel="stylesheet" href="http://myroom.oceanmate.co.kr/thema/Basic/assets/bs3/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="http://myroom.oceanmate.co.kr/thema/Basic/colorset/Basic/colorset.css" type="text/css">
<link rel="stylesheet" href="http://myroom.oceanmate.co.kr/skin/member/basic/style.css" >
<link rel="stylesheet" href="http://myroom.oceanmate.co.kr/css/font-awesome/css/font-awesome.min.css?ver=161101">
<link rel="stylesheet" href="http://myroom.oceanmate.co.kr/css/level/basic.css?ver=161101">
<!--[if lte IE 8]>
<script src="http://myroom.oceanmate.co.kr/js/html5.js"></script>
<![endif]-->
<script>
// 자바스크립트에서 사용하는 전역변수 선언
/* 여기 */
/* var g5_url       = "http://myroom.oceanmate.co.kr"; */
var g5_bbs_url   = "http://myroom.oceanmate.co.kr/bbs";
var g5_is_member = "1";
/* var g5_is_admin  = "";
var g5_is_mobile = "";
var g5_bo_table  = "";
var g5_sca       = "";
var g5_pim       = "";
var g5_editor    = "";
var g5_responsive    = "1";
var g5_cookie_domain = "";
var g5_purl = "http://myroom.oceanmate.co.kr/bbs/myphoto.php";  */
</script>
<script src="http://myroom.oceanmate.co.kr/js/jquery-1.11.3.min.js"></script>
<script src="http://myroom.oceanmate.co.kr/js/jquery-migrate-1.2.1.min.js"></script>
<script src="http://myroom.oceanmate.co.kr/lang/korean/lang.js?ver=161101"></script>
<script src="http://myroom.oceanmate.co.kr/js/common.js?ver=161101"></script>
<script src="http://myroom.oceanmate.co.kr/js/wrest.js?ver=161101"></script>
<script src="http://myroom.oceanmate.co.kr/js/apms.js?ver=161101"></script>
<meta name="naver-site-verification" content="7bb97e907c9a5215448ed8833227643d8c77f864"/>
<!-- <script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-35884088-1', 'auto');
  ga('send', 'pageview');
</script> -->

<!-- <script type="text/javascript">
var JsHost = (("https:" == document.location.protocol) ? "https://" : "http://");
var sTime = new Date().getTime();
document.write(unescape("%3Cscript id='log_script' src='" + JsHost + "rkdxhxh.weblog.cafe24.com/weblog.js?uid=rkdxhxh_14&t="+sTime+"' type='text/javascript'%3E%3C/script%3E"));
</script> -->
<body class="responsive is-pc">

<div class="ko"><style>
	.myphoto img, .myphoto i { width:80px; height:80px; }
</style>
<!-- <form name="fphotoform" class="form" role="form" method="post" enctype="multipart/form-data" autocomplete="off"> -->
<form  class="form" id="form" method="post" enctype="multipart/form-data" autocomplete="off">
	<input type="hidden" name="mode" value="u">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">My Photo</h3>
		</div>
		<div class="panel-body">
			<div class="row">
				<div class="col-lg-2 col-sm-3 text-center">
					<div class="myphoto">
						<!-- <i class="fa fa-user"></i> -->
						<img src="${ contextPath }/resources/photo2.png" style="width:80px; border-radius:50px;">					
					</div>
				</div>
				<div class="col-lg-10 col-sm-9">
					<p>회원사진은 이미지(gif/jpg/png) 파일만 가능하며, 등록시 80x80 사이즈로 자동 리사이즈됩니다.</p>
					<p><input type=file id="uploadFile" name="uploadFile"></p>
				</div>
			</div>
		</div>
	</div>

	<div class="text-center">
		<button id="profileInsert" class="btn btn-color btn-sm">등록</button>
		<button type="button" class="btn btn-black btn-sm" onclick="window.close();">닫기</button>
	</div>		
</form>

<script>
$(function() {
	/* window.resizeTo(320, 440); */
	/* window.resizeTo(150, 220); */
	open_resizeby_window.resizeTo(300,150);

});

/* $('#profileInsert').click(function(e){
	e.preventDefault();
	var form = $('#form')[0];
	console.log(form);
	var uploadFile = new FormData(form);
	console.log(uploadFile);
	$.ajax({
		url: "pinsert.me",
		enctype:"multipart/form-data",
		data: uploadFile,
		contentType: false,
		processData: false,
		cache : false,
		success: function(){
			window.opener.location.reload();
			self.close();
		}
	})
}) */
</script>
</div>

<!-- JavaScript -->
<script type="text/javascript" src="http://myroom.oceanmate.co.kr/thema/Basic/assets/bs3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://myroom.oceanmate.co.kr/thema/Basic/assets/js/custom.sub.js"></script>

</html>