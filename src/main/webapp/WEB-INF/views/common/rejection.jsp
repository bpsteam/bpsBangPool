<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 무단수집 거부</title>
<style>
</style>

</head>
<body>
	<!-- ==== HEADER START ==== -->
	<c:import url="../common/header.jsp" />
	<!-- ==== HEADER END ==== -->

	<!-- === BEGIN CONTENT === -->


	<div id="content">



		<div class="container background-white ">

			<div class="row margin-vert-30">
				<!-- Main Column -->
				<div class="col-sm-12">
					<div class="tab-content">
						<div class="at-title">
							<div class="at-container" style="display: inline">
								<div class="page-title col-md-9" style="font-size: 30px">
									<strong> <i class="fa fa-ban"></i> Rejection of E-mail
										Collection
									</strong>
								</div>
								<div class="page-desc hidden-xs col-md-3"
									style="text-align: right">이메일 무단수집 거부</div>
								<div class="clearfix"></div>
							</div>
						</div>
						<div class="margin-bottom-20">
							<hr>
						</div>
						<div class="page-content">

							<div class="text-center" style="margin: 15px 0px;">
								<h2 class="div-title-underline-bold border-color"style="border-bottom: 3px solid red; width:30%; margin:auto">이메일
									무단수집거부</h2>
							</div>

							<div class="text-center">
							<br>
								<p>본 사이트에 게시된 이메일 주소가 전자우편 수집 프로그램이나 그 밖의 기술적 장치를 이용하여 무단으로
									수집 되는 것을 거부합니다.</p>
								<p>
									이를 위반시 <b>「정보통신망 이용촉진 및 정보보호 등에 관한 법률」</b>에 의해 형사처벌됨을 유념하시기
									바랍니다.
								</p>
								<br>
								<p>
									<i class="fa fa-envelope" style="font-size: 80px;"></i>
								</p>
							</div>
						</div>


					</div>
				</div>
				<!-- End Main Column -->





			</div>

			<div class="margin-bottom-30">
				<hr>
			</div>
		</div>

	</div>
	<!-- === END CONTENT === -->




	<!-- ==== FOOTER START ==== -->
	<c:import url="../common/footer.jsp" />
	<!-- ==== FOOTER END ==== -->


</body>
</html>