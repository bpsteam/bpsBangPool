<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.table tbody tr {
	border-bottom: 1px solid #dddddd;
}

#form label {
	margin-top: 5px;
}

#variableFiles {
	width: 100%;
	margin: 0;
	border: 0;
}

#variableFiles td {
	padding: 0px 0px 7px;
	border: 0;
}

#variableFiles input[type=file] {
	box-shadow: none;
	border: 1px solid #ccc !important;
	outline: none;
}

#variableFiles .form-group {
	margin-left: 0;
	margin-right: 0;
	margin-bottom: 7px;
}

#variableFiles .checkbox-inline {
	padding-top: 0px;
	font-weight: normal;
}
</style>

</head>
<body>

	<!-- ==== HEADER START ==== -->
	<c:import url="../../common/header.jsp" />
	<!-- ==== HEADER END ==== -->

	<!-- === BEGIN CONTENT === -->


	<div id="content">
		<div class="margin-bottom-20">
			<hr>
		</div>
		<div class="container background-white ">
			<div class="row margin-vert-30">
				<!-- Main Column -->
				<div class="col-sm-9">
					<div class="tab-content">
					<form id="srInsert.sr" action="srInsert.sr" method="POST" enctype="Multipart/form-data">
						<h1>
							<small>글쓰기</small>
						</h1>
						<div class="margin-bottom-10">
							<hr>
						</div>
						<input type="hidden" value="${ loginUser.nickname }" name="srbWriter">
						<div class="panel panel-blue">
							<div class="panel-body" style="padding-bottom: 0px;">
								<div class="form-group">
									<label class="col-sm-2 col-xs-12 control-label" for="nanum_model">제목</label>
									<div class="col-sm-10 col-xs-12">
										<div class="control-label input-group input-group-sm">
											<input id="nanum_model" class="form-control input-sm" type="text" name="srbTitle" value="" size="150" placeholder="">
										</div>
									</div>
								</div>
								
								<div class="form-group">
								<br>
								<label class="col-sm-2 control-label" for="ca_name">지역분류 <strong class="sound_only">*</strong></label>
									<div class="col-sm-4">
										<select name="srbLocation" required
											class="form-control input-sm">
											<option value="">선택하세요</option>
											<option value="서울">서울</option>
											<option value="인천/부천">인천/부천</option>
											<option value="수원/경기">수원/경기</option>
											<option value="대구/경북">대구/경북</option>
											<option value="부산/경남">부산/경남</option>
											<option value="충청/강원">충청/강원</option>
											<option value="광주/전라">광주/전라</option>
										</select>
									</div>
								</div>
								<br>
								<br>
									<!-- start insert input date -->
									<div class="form-group">
										<label class="col-sm-2 col-xs-12 control-label" for="sdate">시작일시</label>
											<div class="col-sm-5 col-xs-6">
												<div class="control-label input-group input-group-sm col-sm-4">
													<input type="date" id="srStartDate" name="srStartDate"  min="2019-11-07" required> 
													<span id="calendarBtn" class="input-group-addon"><i	class="fa fa-calendar"></i></span>
												</div>
											</div>
									<div class="col-sm-5 col-xs-6">
										<div class="control-label input-group input-group-sm">
											<select id="shour" name="srStartHour" class="form-control input-sm">
												<option value="00" selected="">00</option>
												<option value="01">01</option>
												<option value="02">02</option>
												<option value="03">03</option>
												<option value="04">04</option>
												<option value="05">05</option>
												<option value="06">06</option>
												<option value="07">07</option>
												<option value="08">08</option>
												<option value="09">09</option>
												<option value="10">10</option>
												<option value="11">11</option>
												<option value="12">12</option>
												<option value="13">13</option>
												<option value="14">14</option>
												<option value="15">15</option>
												<option value="16">16</option>
												<option value="17">17</option>
												<option value="18">18</option>
												<option value="19">19</option>
												<option value="20">20</option>
												<option value="21">21</option>
												<option value="22">22</option>
												<option value="23">23</option>
											</select> <span class="input-group-addon">시 00분</span>
										</div>
									</div>
								</div>
								<br>
								<br>
								<div class="form-group">
									<label class="col-sm-2 col-xs-12 control-label" for="edate">종료일시</label>
									<div class="col-sm-5 col-xs-6">
										<div class="control-label input-group input-group-sm col-sm-4">
											<input type="date" id="srEndDate" name="srEndDate" required> 
											<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
										</div>
									</div>
									<div class="col-sm-5 col-xs-6">
										<div class="control-label input-group input-group-sm">
											<select id="ehour" name="srEndHour" class="form-control input-sm">
												<option value="00">00</option>
												<option value="01">01</option>
												<option value="02">02</option>
												<option value="03">03</option>
												<option value="04">04</option>
												<option value="05">05</option>
												<option value="06">06</option>
												<option value="07">07</option>
												<option value="08">08</option>
												<option value="09">09</option>
												<option value="10">10</option>
												<option value="11">11</option>
												<option value="12">12</option>
												<option value="13">13</option>
												<option value="14">14</option>
												<option value="15">15</option>
												<option value="16">16</option>
												<option value="17">17</option>
												<option value="18">18</option>
												<option value="19">19</option>
												<option value="20">20</option>
												<option value="21">21</option>
												<option value="22">22</option>
												<option value="23" selected="">23</option>
											</select> <span class="input-group-addon">시 59분</span>
										</div>
									</div>
								</div>
								<!-- end insert end date -->
								<div class="form-group">
								<br>
								<br>
									<label class="col-sm-2 col-xs-12 control-label"	for="nanum_type">방법</label>
									<div class="col-sm-5 col-xs-6">
										<div class="control-label input-group input-group-sm">
											<select id="nanum_type" class="form-control input-sm"
												name="srEvent">
												<option value="랜덤당첨">랜덤당첨</option>
											</select>
										</div>
									</div>
									<div class="col-sm-5 col-xs-6">
										<div class="control-label input-group input-group-sm">
											<input class="form-control input-sm" type="text"
												name="srEventLimit" value="" size="10" placeholder="숫자만 입력" required>
											<span class="input-group-addon">명 당첨</span>
										</div>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 col-xs-12 control-label"
										for="nanum_model">제품</label>
									<div class="col-sm-10 col-xs-12">
										<div class="control-label input-group input-group-sm">
											<input id="nanum_model" class="form-control input-sm"
												type="text" name="srItemName" value="" size="150"
												placeholder="제품명을 입력해주세요" required>
										</div>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 col-xs-12 control-label"
										for="nanum_sent">배송방법</label>
									<div class="col-sm-10 col-xs-6">
										<div class="control-label" style="width: 20%">
											<select id="nanum_sent" class="form-control input-sm"
												name="srDelivery" style="width: 100px">
												<option value="무료배송" selected="">무료배송</option>
												<option value="택배선불">택배선불</option>
												<option value="택배착불">택배착불</option>
											</select>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">내용</label>
									<div class="col-sm-12">
										<textarea id="wr_content" name="srbContent"
											class="form-control input-sm write-content" maxlength="65536"
											style="width: 100%; height: 300px" required></textarea>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label hidden-xs">첨부파일</label>
								</div>
								<div class="col-sm-10 col-sm-offset-2">
									<table id="variableFiles">
										<tbody>
											<tr>
												<td><div class="row">
														<div class="col-sm-7">
															<div class="form-group">
																<div class="input-group input-group-sm">
																	<span class="input-group-addon">파일 0</span><input
																		type="file" class="form-control input-sm"
																		name="uploadFile"
																		title="img 파일만 업로드 가능합니다"
																		accept="image/*" required>
																</div>
															</div>
														</div>
												</div></td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="write-btn pull-right">
									<button type="submit" id="btn_submit" accesskey="s"	class="btn btn-success btn-sm ">
										<i class="fa fa-check"></i> <b>작성완료</b>
									</button>
									<a href="blist.hm" class="btn btn-danger btn-sm" role="button">취소</a>
								</div>
							</form>
						</div>
						<br>
					</div>
				</div>
			</div>
				<!-- End Main Column -->
				<!-- Side Column -->
				<div class="col-md-3">
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
								<li><a href="#sample-3a" data-toggle="tab"> <i
										class="fa fa-cloud"></i> 룸메이트
								</a></li>
								<li class="active"><a href="#sample-3b" data-toggle="tab">
										<i class="fa fa-home"></i> 하우스메이트
								</a></li>
								<li><a href="#sample-3c" data-toggle="tab"> <i
										class="fa fa-comments"></i> 신입생메이트
								</a></li>

							</ul>
						</div>
					</div>

					<div class="margin-bottom-10">
						<hr>
					</div>

					<div class="panel panel-danger">
						<div class="panel-heading">
							<h3 class="panel-title">공지사항</h3>
						</div>
						<div class="panel-body" style="background-color: white;">
							<div class="table-responsive">
								<table class="table table-hover" style="margin-bottom: 0px">

									<tbody>
										<tr>
											<td>1</td>
											<td>공지사항입니다1</td>
											<td>07/19</td>
										</tr>
										<tr>
											<td>2</td>
											<td>공지사항입니다2</td>
											<td>08/24</td>
										</tr>
										<tr>
											<td>3</td>
											<td>공지사항입니다3</td>
											<td>10/20</td>
										</tr>
										<tr style="border-bottom: 1px solid #dddddd;">
											<td>4</td>
											<td>공지사항입니다4</td>
											<td>11/15</td>
										</tr>

									</tbody>
								</table>
							</div>

						</div>
					</div>
					<!-- End recent Posts -->
					<!-- 공지사항 -->
					<div class="panel panel-info">
						<!-- 이슈 시작-->
						<div class="panel-heading">
							<h3 class="panel-title">최신 게시글</h3>
						</div>
						<div class="widget-box panel-body"
							style="background-color: white;">
							<div class="table-responsive">
								<table class="table table-hover" style="margin-bottom: 0px">

									<tbody>
										<tr>
											<td>1</td>
											<td>최신글입니다1</td>
											<td>07/19</td>
										</tr>
										<tr>
											<td>2</td>
											<td>최신글입니다2</td>
											<td>08/24</td>
										</tr>
										<tr>
											<td>3</td>
											<td>최신글입니다3</td>
											<td>10/20</td>
										</tr>
										<tr style="border-bottom: 1px solid #dddddd;">
											<td>4</td>
											<td>최신글입니다4</td>
											<td>11/15</td>
										</tr>

									</tbody>
								</table>
							</div>
						</div>
						<!-- 이슈 끝-->
					</div>
					<!-- End 공지사항 -->
				</div>
				<!-- End Side Column -->
			</div>
		</div>

		<div class="margin-bottom-30">
			<hr>
		</div>

	</div>
	<!-- === END CONTENT === -->

	<script type="text/javascript">
		$(function() {
			
			
			
			var today = new Date();
			var year = today.getFullYear();
			var month = today.getMonth()+1;
			var date = today.getDate();
			
			var min = year+"-"+month+"-"+(date+1);
			
			$('#srStartDate').attr({"min":min});
			$('#srEndDate').attr({"min":min});
			
			$('#srStartDate').change(function(){
				var startDate = $('#srStartDate').val();
				var startDateArr = startDate.split('-');
				var startDateCompare = startDateArr[0] +"-"+ startDateArr[1]+"-"+(parseInt(startDateArr[2])+1);
				console.log(startDateCompare);
				$('#srEndDate').attr({"min":startDateCompare});
			});
			
			$('#srEndDate').change(function(){
				var endDate = $('#srEndDate').val();
				var endDateArr = endDate.split('-');
				var endDateCompare = endDateArr[0] +"-"+ endDateArr[1] +"-"+ (parseInt(endDateArr[2])-1);
				console.log(endDateCompare);
				$('#srStartDate').attr({"max":endDateCompare});
			});
			
		});
	</script>

	<!-- ==== FOOTER START ==== -->
	<c:import url="../../common/footer.jsp" />
	<!-- ==== FOOTER END ==== -->
</body>
</html>