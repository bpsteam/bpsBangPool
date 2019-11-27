<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>
/*   #ultag li {
            display: inline;
            padding: 0 30px;
        }

        #table th {
            width: 150px;

        }

        #table td {
            width: 150px;
            
        } */
.table tbody tr {
	border-bottom: 1px solid #dddddd;
}

.section_matching {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 500; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

.matching_content {
	position: relative;
	background-color: #fefefe;
	margin: auto;
	padding: 0;
	width: 100%;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	-webkit-animation-name: animatetop;
	-webkit-animation-duration: 0.4s;
	animation-name: animatetop;
	animation-duration: 0.4s
}
</style>



</head>
<body>

	<!-- ==== HEADER START ==== -->
	<c:import url="../../common/header.jsp" />
	<!-- ==== HEADER END ==== -->


	<!-- === BEGIN CONTENT === -->


	<div id="content">

		<div id="slideshow" class="bottom-border-shadow">
			<div class="container background-grey bottom-border">

				<div class="margin-bottom-10">
					<hr>
				</div>
				<!-- ==== BEGIN ADVERTISEMENT ==== -->
				<c:import url="../../common/advertisement.jsp" />
				<!-- ==== END ADVERTISEMENT ==== -->
				<br> <br>
			</div>


		</div>
		<div class="margin-bottom-20">
			<hr>
		</div>
		<div class="container background-white ">

			<div class="row margin-vert-30">
				<!-- Main Column -->
				<div class="col-sm-9">
					<div class="tab-content">
						<div class="tab-pane fade in active" id="housemate">
							<h1>
								<small>HOUSEMATE</small>
							</h1>
							<div class="margin-bottom-10">
								<hr>
							</div>

							<form action="blist.hm">
								<div class="tabs alternative">
									<ul class="nav nav-tabs" id="tabs">
										<li id="all"><c:url var="loc" value="blist.hm">
												<c:param name="hLocation" value="ALL" />
											</c:url> <a href="${ loc }">전체</a></li>
										<li id="seoul"><c:url var="loc" value="blist.hm">
												<c:param name="hLocation" value="SEOUL" />
											</c:url> <a href="${ loc }">서울</a></li>
										<li id="inc"><c:url var="loc" value="blist.hm">
												<c:param name="hLocation" value="INCHEON" />
											</c:url> <a href="${ loc }">인천/부천</a></li>
										<li id="su"><c:url var="loc" value="blist.hm">
												<c:param name="hLocation" value="SU" />
											</c:url> <a href="${ loc }">수원/경기</a></li>
										<li id="dae"><c:url var="loc" value="blist.hm">
												<c:param name="hLocation" value="DAE" />
											</c:url> <a href="${ loc }">대구/경북</a></li>
										<li id="bu"><c:url var="loc" value="blist.hm">
												<c:param name="hLocation" value="BU" />
											</c:url> <a href="${ loc }">부산/경남</a></li>
										<li id="chung"><c:url var="loc" value="blist.hm">
												<c:param name="hLocation" value="CHUNG" />
											</c:url> <a href="${ loc }">충청/강원</a></li>
										<li id="kwang"><c:url var="loc" value="blist.hm">
												<c:param name="hLocation" value="GWANG" />
											</c:url> <a href="${ loc }">광주/전라</a></li>
									</ul>
									<div class="tab-content">
										<div class="tab-pane fade in active" id="integrate">
											<div class="row">
												<div class="col-md-12">
													<div class="table-responsive">
														<table class="table table-hover">
															<thead>
																<tr>
																	<th>No.</th>
																	<th>지역분류</th>
																	<th>제목</th>
																	<th>작성자</th>
																	<th>날짜</th>
																	<th>조회수</th>
																</tr>
															</thead>
															<tbody>
																<c:forEach var="b" items="${ list }">
																	<tr>
																		<td>${ b.hbId }</td>
																		<td>${ b.hLocation }</td>
																		<c:url var="hbdetail" value="bdetail.hm">
																			<c:param name="hbId" value="${ b.hbId }" />
																		</c:url>
																		<td onclick="location.href='${ hbdetail }'"
																			style="width: 220px;">
																			<%-- <a href="${ hbdetail }">${ b.hbTitle }</a></td> --%>
																			${ b.hbTitle }
																		</td>
																		<td>${ b.hbWriter }</td>
																		<td>${ b.hbCreateDate }</td>
																		<td>${ b.hbCount }</td>
																	</tr>

																</c:forEach>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>




										<!-- 페이징 처리 -->
										<div class="text-center">
											<ul class="pagination">
												<!-- [이전] -->
												<li><c:if test="${ pi.currentPage <= 1 }">
														<a>«</a>
													</c:if> <c:if test="${ pi.currentPage > 1 }">
														<c:url var="before" value="blist.hm">
															<c:param name="page" value="${ pi.currentPage - 1 }" />
														</c:url>
														<a href="${ before }">«</a>
													</c:if></li>

												<!-- 페이지 -->
												<c:forEach var="p" begin="${ pi.startPage }"
													end="${ pi.endPage }">
													<c:if test="${ p eq pi.currentPage }">
														<li class="active"><a>${ p }</a></li>
													</c:if>

													<c:if test="${ p ne pi.currentPage }">
														<li><c:url var="pagi" value="blist.hm">
																<c:param name="page" value="${ p }" />
															</c:url> <a href="${ pagi }">${ p }</a></li>
													</c:if>
												</c:forEach>

												<!-- [다음] -->
												<li><c:if test="${ pi.currentPage >= pi.maxPage }">
														<a>»</a>
													</c:if> <c:if test="${ pi.currentPage < pi.maxPage }">
														<c:url var="after" value="blist.hm">
															<c:param name="page" value="${ pi.currentPage + 1 }" />
														</c:url>
														<a href="${ after }">»</a>
													</c:if></li>


											</ul>
											<a href="#" style="float: left" class="btn btn-aqua btn-sm"
												data-toggle="modal" data-target="#searchModal"
												onclick="return false;"><i class="fa fa-search"></i></a>
											<c:if test="${ !empty loginUser }">
												<a href="binsertView.hm" type="button" class="btn btn-red"
													style="float: right;">글쓰기</a>
											</c:if>
										</div>
									</div>

								</div>
							</form>

						</div>

					</div>
				</div>
				<!-- End Main Column -->


				<!-- 검색 모달창 시작 -->
				<div class="modal fade" id="searchModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true"
					style="display: none;">
					<div class="modal-dialog modal-sm">
						<div class="modal-content">
							<div class="modal-body">
								<div class="text-center">
									<h4 id="myModalLabel"
										style="font-weight: 500; font-family: 'Roboto', sans-serif; color: unset; line-height: 1.1">
										<i class="fa fa-search fa-lg"></i> Search
									</h4>
								</div>
								<form action="hserach.hm" name="hsearch" method="get"
									role="form" class="form" style="margin-top: 20px;">
									<input type="hidden" name="bo_table" value="roomate"> <input
										type="hidden" name="sca" value=""> <input
										type="hidden" name="sop" value="and">
									<div class="form-group">
										<label for="sfl" class="sound_only">검색대상</label> <select
											name="searchCondition" id="searchCondition"
											class="form-control input-sm">
											<option value="wr_subject">제목</option>
											<option value="wr_content">내용</option>
											<option value="titleNcontent">제목+내용</option>
											<option value="email">회원아이디</option>
											<option value="hbwriter">글쓴이</option>
										</select>
									</div>
									<div class="form-group">
										<label for="stx" class="sound_only">검색어<strong
											class="sound_only"> 필수</strong></label> <input type="text"
											name="searchValue" required id="searchValue"
											class="form-control input-sm" maxlength="20"
											placeholder="검색어">
									</div>

									<div class="btn-group btn-group-justified">
										<div class="btn-group">
											<button type="submit" class="btn btn-danger">
												<i class="fa fa-check"></i>
											</button>
										</div>
										<div class="btn-group">
											<button type="button" class="btn btn-aqua"
												data-dismiss="modal">
												<i class="fa fa-times"></i>
											</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- 검색 모달창 끝 -->

				<!-- Side Column -->
				<div class="col-md-3">

					<!-- 메이트 매칭 모달창 -->
					<button id="matching_onclick" type="button"
						class="btn btn-primary btn-sm" style="width: 100%;">나에게
						맞는 메이트 찾기</button>
					<!-- mateMatching -->
					<c:import url="../../common/mateMatching.jsp" />
					<!-- mateMatching -->

					<br>


					<!-- Recent Posts -->
					<div class="margin-bottom-10">
						<hr>
					</div>
					<div class="panel panel-success">
						<div class="panel-body" style="background-color: white;">
							<!-- <a href="#"><b>룸메이트</b></a> <br>
                                <a href="#">하우스메이트</a> <br>
                                <a href="#">신입생메이트</a> -->
							<ul class="nav nav-pills nav-stacked">
								<li><a href="blist.rm"> <i class="fa fa-cloud"></i>
										룸메이트
								</a></li>
								<li class="active"><a href="#housemate" data-toggle="tab">
										<i class="fa fa-home"></i> 하우스메이트
								</a></li>
								<li><a href="blist.fm?fLocation=전체"> <i
										class="fa fa-comments"></i> 신입생메이트
								</a></li>

							</ul>
						</div>
					</div>
					<!-- category 시작 -->
					<c:import url="../../common/rightCategory.jsp" />
					<!-- category  끝-->
				</div>
				<!-- End Side Column -->
			</div>
		</div>

		<div class="margin-bottom-30">
			<hr>
		</div>

	</div>
	<!-- === END CONTENT === -->


	<!-- ==== FOOTER START ==== -->
	<c:import url="../../common/footer.jsp" />
	<!-- ==== FOOTER END ==== -->

	<script>
// 탭 액티브 처리
	$(function(){
		var location= "${ hLoc }";
		console.log(location);
		
		switch(location) {
		case "SEOUL" : 
			$("#tabs li").removeClass("active");
			$("#seoul").addClass("active");
			break;
		case "INCHEON" : 
			$("#tabs li").removeClass("active");
			$("#inc").addClass("active");
			break;
		case "SU" : 
			$("#tabs li").removeClass("active");
			$("#su").addClass("active");
			break;
		case "DAE" : 
			$("#tabs li").removeClass("active");
			$("#dae").addClass("active");
			break;
		case "BU" : 
			$("#tabs li").removeClass("active");
			$("#bu").addClass("active");
			break;
		case "CHUNG" : 
			$("#tabs li").removeClass("active");
			$("#chung").addClass("active");
			break;
		case "GWANG" : 
			$("#tabs li").removeClass("active");
			$("#gwang").addClass("active");
			break;
		default :
			$("#tabs li").removeClass("active");
			$("#all").addClass("active");
			break;
		}
	});
	
</script>


</body>

</html>