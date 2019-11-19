<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<style>
	
		.panel-default > .panel-heading {
		    color: #EEE;
		    background-color: #444;
		    border-color: #555;
		}
		
		.view-line {
		    height: 1px;
		    margin-top: 14px;
		    border-bottom: 1px dotted #aaa;
		    margin-bottom: 15px;
		}
		
		
	</style>

</head>
<body>

	

	<!-- ==== HEADER START ==== -->
	<c:import url="../../common/header.jsp" />
	<!-- ==== HEADER END ==== -->
	<div id="content">
	
			<div class="margin-bottom-20">
				<hr>
			</div>
			
			<div class="container background-white ">
				<div class="row margin-vert-30">
					<div class="panel panel-default" style="margin-top:10px;">
					<div class="panel-heading">
						<h3 class="panel-title font-16">
							<span class="pull-right" style="font-weight:bold;">
								<i class="fa fa-comment"></i>
								<!-- 댓글이 있으면 -->
								<b class="orange">40</b>				&nbsp;&nbsp;
								<i class="fa fa-eye"></i>
								<!-- 조회수 -->
								431			</span>
							<i class="fa fa-gift"></i> 나눔 제품
						</h3>
					</div>
					
					
					<h1 class="text-center">${ share.srbTitle }</h1>
					
					<div class="panel-body">
						<div class="row">
							<div class="col-sm-5">
												<img itemprop="image" src="https://quasarzone.co.kr/skin/board/nanum/img/jijang.jpg" class="reimg" data-toggle="modal" data-target="#eventModal" style="cursor: pointer;">
								<!-- 이미지 확대-->
								<div class="modal fade" id="eventModal" tabindex="-1" role="dialog" aria-labelledby="myEventModalLabel" aria-hidden="false">
									<div class="modal-dialog modal-sm">
										<div class="modal-content">
											<div class="modal-body">
												<img src="https://quasarzone.co.kr/skin/board/nanum/img/jijang.jpg">
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-7 font-14">
												<div class="col-sm-12 font-16">
									<strike class="gray">${ share.srItemName }</strike>
								</div>
								<div class="col-sm-12">
									<strike class="gray">배송방법: ${ share.srDelivery }</strike>
								</div>
								<div class="col-sm-12">
									시작일시: ${ share.srStartDate }<br>
									종료일시: ${ share.srEndDate }<br>
														남은시간: <span class="gray">종료</span><br>
														당첨방법: ${ share.srEvent }<br>
									당첨인원: 총 ${ share.srEventLimit }명 ${ chance }%<br>
									현재참가: 총 ${ share.srEventEnterCount }명
								</div>
							</div>
						</div>
						<div class="view-line"></div>
						<div class="text-center">
						<button type="button" class="btn btn-danger" onclick="alert('나눔이 종료되었습니다.');">나눔종료!</button>		</div>
						<div class="view-line"></div>
						
						  <div class="view-padding">
						    <div class="view-content">
								${ share.srbContent }
						    </div>
						  </div>
						
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- ==== FOOTER START ==== -->
	<c:import url="../../common/footer.jsp" />
	<!-- ==== FOOTER END ==== -->

</body>
</html>