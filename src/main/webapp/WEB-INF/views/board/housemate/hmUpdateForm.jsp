<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
/*     #ultag li {
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
						<h1>
							<small>글쓰기</small>
						</h1>
						<div class="margin-bottom-10">
							<hr>
						</div>

						<div class="panel panel-blue">
							<div class="panel-body" style="background-color: white;">
								<form action="bupdate.hm" method="post"
									enctype="multipart/form-data"
									class="form-horizontal">
								<input type="hidden" name="hbId" value="${ hboard.hbId }">
									<div class="form-group has-feedback">
										<label class="col-sm-2 control-label">작성자</label>
										<div class="col-sm-3">
											<c:if test="${ !empty loginUser }">
                                                  <input type="text" name="hbWriter"  id="hbWriter" value="${ loginUser.nickname }" readonly class="form-control input-sm" size="10" maxlength="20">
	                                         </c:if>
										</div>
									</div>

								<!-- 	<div class="form-group">
										<label class="col-sm-2 control-label" for="wr_email">E-mail</label>
										<div class="col-sm-6">
											<input type="text" name="wr_email" id="wr_email" readonly
												value=""
												class="form-control input-sm email" size="50"
												maxlength="100">
										</div>
									</div> -->

									<div class="form-group">
										<label class="col-sm-2 control-label" for="ca_name">
											지역분류 <strong class="sound_only">*</strong>
										</label>
										<div class="col-sm-3">
											<select name="hLocation" id="hlocation" required
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

									<div class="form-group">
										<label class="col-sm-2 control-label" for="wr_subject">제목<strong
											class="sound_only">*</strong></label>
										<div class="col-sm-10">
											<div class="input-group">
												<input type="text" name="hbTitle" value="${ hboard.hbTitle }" required
													class="form-control input-sm" size="50" maxlength="255">
													
											</div>
										</div>
									</div>



									<div class="form-group">
										<label class="col-sm-2 control-label " for="ca_name">매물구분<strong
											class="sound_only">*</strong></label>
										<div class="col-sm-3">

											<select name="hRentType" required id="hrenttype"
												class="form-control input-sm">
												<option value="">매물구분 선택</option>
												<option value="전세">전세</option>
												<option value="월세">월세</option>
												<option value="매매">매매</option>
											</select>
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-2 control-label " for="ca_name">매물종류<strong
											class="sound_only">*</strong></label>
										<div class="col-sm-3">
											<select name="hLivingType"  required id="hlivingtype"
												class="form-control input-sm">
												<option value="">매물종류 선택</option>
												<option value="오피스텔">오피스텔</option>
												<option value="아파트">아파트</option>
												<option value="빌라">빌라</option>
												<option value="단독주택">단독주택</option>
											</select>
										</div>
									</div>



									<div class="form-group">
										<label class="col-sm-2 control-label " for="ca_name">방갯수<strong
											class="sound_only">*</strong></label>
										<div class="col-sm-3">

											<select name="hRoom" required  id="hroom"
												class="form-control input-sm">
												<option value="">방갯수를 선택해주세요.</option>
												<option value="원룸">원룸</option>
												<option value="투룸">투룸</option>
												<option value="쓰리룸">쓰리룸</option>
												<option value="포룸">포룸</option>
											</select>
										</div>
									</div>



									<div class="form-group">
										<label class="col-sm-2 control-label " for="ca_name">해당층수<strong
											class="sound_only">*</strong></label>
										<div class="col-sm-3">
											<select name="hFloor" required id="hfloor"
												class="form-control input-sm">
												<option value="" selected="">층수를 선택해주세요.</option>
												<option value="지하">지하</option>
												<option value="반지하">반지하</option>
												<option value="1층">1층</option>
												<option value="2층">2층</option>
												<option value="3층">3층</option>
												<option value="4층">4층</option>
												<option value="5층">5층</option>
												<option value="6층이상">6층이상</option>
											</select>
										</div>
									</div>



									<div class="form-group">
										<label class="col-sm-2 control-label " for="ca_name">핸드폰</label>
										<div class="col-sm-7">
											<input type="text" name="wr_phone" readonly
												value="${ loginUser.phone }" id="wr_name"
												class="form-control input-sm" size="10" maxlength="20">
				
											<!-- <table>
												<tbody>
													<tr>
														<td><select name="wr_4" itemname="핸드폰 국번"
															class="form-control input-sm" style="width: 100px;">
																<option value="" selected="">국번</option>
																<option value="010">010</option>
																<option value="011">011</option>
																<option value="016">016</option>
																<option value="017">017</option>
																<option value="018">018</option>
																<option value="019">019</option>
														</select></td>
														<td>-</td>
														<td><input type="text" name="wr_5" size="4"
															maxlength="4" itemname="핸드폰 앞자리" value=""
															class="form-control input-sm"></td>
														<td>-</td>
														<td><input type="text" name="wr_6" size="4"
															maxlength="4" itemname="핸드폰 뒷자리" value=""
															class="form-control input-sm"></td>
													</tr>
												</tbody>
											</table> -->
										</div>
									</div>


									<div class="form-group">
										<label class="col-sm-2 control-label " for="ca_name">상대 성별</label>
										<div class="col-sm-3">
											<select name="hReqgender" required class="form-control input-sm" id="hReqgender">
                                                <option value="" selected >원하는 상대 성별을 선택해주세요.</option>
                                                <option value="무관">무관</option>
                                                <option value="여성">여성</option>
                                                <option value="남성">남성</option>
                                            </select>	
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-2 control-label " for="ca_name">거래금액</label>
										<div class="col-sm-3">
											<input type="text" name="hPrice" size="50" value="${ hboard.hPrice }"
												class="form-control input-sm">
										</div>
									</div>


									<div class="form-group">
										<label class="col-sm-2 control-label " for="ca_name">주차가능여부</label>
										<div class="col-sm-3">
											<select name="hParking" id="hparking"
													class="form-control input-sm" style="width: 100px;">
															<option value="" selected>선택</option>
															<option value="주차가능">주차가능</option>
															<option value="주차불가">주차불가</option>
											</select>
										</div>
									</div>



									<div class="form-group">
										<label class="col-sm-2 control-label">내용</label>
										<div class="col-sm-12">
											<span class="sound_only"></span>
											<textarea id="wr_content" name="hbContent" 
												class="form-control input-sm write-content"
												maxlength="65536" style="width: 100%; height: 300px">${ hboard.hbContent }</textarea>
											<span class="sound_only"></span>
										</div>
									</div>


									<div class="form-group">
										<label class="col-sm-2 control-label">첨부파일</label>
										<div class="col-sm-10">
											<button class="btn btn-blue btn-sm" type="button" onclick="add_file();">
												<i class="fa fa-plus-circle fa-lg"></i> 추가하기
											</button>
											<button class="btn btn-red btn-sm" type="button" onclick="del_file();">
												<i class="fa fa-times-circle fa-lg"></i> 삭제하기
											</button>
										</div>
									</div>
									<div class="form-group" style="margin-bottom: 0;">
										<div class="col-sm-10 col-sm-offset-2">
											<table id="variableFiles">
												<tbody>
													<%-- <tr>
														<td><div class="row">
																<div class="col-sm-7">
																	<div class="form-group">
																		<div class="input-group input-group-sm">
																			<span class="input-group-addon">파일 1</span> 
																			<input	type="file" class="input-sm" name="reloadFile"> 
																			<c:if test="${ !empty hboard.originalFileName }">
																				<input type="text" class="input-sm" value="현재 업로드한 파일 :">
																				<a href="${ contextPath }/resources/hmBoardUploadFiles/${ hboard.renameFileName }"
																					download="${ hboard.originalFileName }"> ${ hboard.originalFileName }
																				</a>
																			</c:if>
																		</div>
																	</div>
																</div>
															</div></td>
													</tr> --%>
												</tbody>
											</table>
										</div>
									</div>
									
									<script>
                                     var flen = 0;
                                     function add_file(delete_code) {
                                         var upload_count = 3;
                                         if (upload_count && flen >= upload_count) {
                                             alert("이 게시판은 "+upload_count+"개 까지만 파일 업로드가 가능합니다.");
                                             return;
                                         }
                             
                                         var objTbl;
                                         var objNum;
                                         var objRow;
                                         var objCell;
                                         var objContent;
                                         if (document.getElementById)
                                             objTbl = document.getElementById("variableFiles");
                                         else
                                             objTbl = document.all["variableFiles"];
                             
                                         objNum = objTbl.rows.length;
                                         objRow = objTbl.insertRow(objNum);
                                         objCell = objRow.insertCell(0);
                             
                                         
                                        /*  var hFileName = "${ hboard.originalFileName }";
                                         var hFileREName = "${ hboard.renameFileName }";
                                         var contextpath = "${ contextPath }";
                                         var himg = hFileName.split(";")[0];
                                         console.log(himg);
                                         
                                       	 if( hFileName != null){
                                         objContent = "<div class='row'>";
                                     	 objContent += "<div class='col-sm-7'><div class='form-group'><div class='input-group input-group-sm'><span class='input-group-addon'>파일 "
                                     					+ (objNum+1) + "</span><input class='input-sm' name='reloadFile"+(objNum+1)
                                     					+"' value='"+himg+"'>"
                                     					+"</div></div></div>";
                                       	 }else {
                                       		objContent = "<div class='row'>";
                                        	objContent += "<div class='col-sm-7'><div class='form-group'><div class='input-group input-group-sm'><span class='input-group-addon'>파일 "
                                        				+ (objNum+1) + "</span>	<input type='file' class='input-sm' name='reloadFile"+(objNum+1)
                                        				+"'></div></div></div>";
                                       	 } */
                                         
                                       	objContent = "<div class='row'>";
                        				objContent += "<div class='col-sm-7'><div class='form-group'><div class='input-group input-group-sm'><span class='input-group-addon'>파일 "
                        					+ (objNum+1)
                        					+ "</span>	<input type='file' class='input-sm' name='reloadFile"+(objNum+1)+"'></div></div></div>";
                                         if (delete_code) {
                                             objContent += delete_code;
                                         } else {
                                                             ;
                                         }
                                         objContent += "</div>";
                             
                                         objCell.innerHTML = objContent;
                             
                                         flen++;
                                     }
                             
                                     add_file('');
                             
                                     function del_file() {
                                         // file_length 이하로는 필드가 삭제되지 않아야 합니다.
                                         var file_length = 0;
                                         var objTbl = document.getElementById("variableFiles");
                                         if (objTbl.rows.length - 1 > file_length) {
                                             objTbl.deleteRow(objTbl.rows.length - 1);
                                             flen--;
                                         }
                                     }
                                     </script>


									<div class="well well-sm text-center">

										<script> var g5_captcha_url  = "http://myroom.oceanmate.co.kr/plugin/kcaptcha";</script>
										<script
											src="http://myroom.oceanmate.co.kr/plugin/kcaptcha/kcaptcha.js"></script>
										<fieldset id="captcha" class="captcha">
											<legend>
												<label for="captcha_key">자동등록방지</label>
											</legend>
											<img
												src="http://myroom.oceanmate.co.kr/plugin/kcaptcha/kcaptcha_image.php?t=1571763466619"
												alt="" id="captcha_img">
											<button type="button" id="captcha_mp3">
												<span></span>숫자음성듣기
											</button>
											<button type="button" id="captcha_reload">
												<span></span>새로고침
											</button>
											<input type="text" name="captcha_key" id="captcha_key"
												required="" class="captcha_box required" size="6"
												maxlength="6"> <span id="captcha_info">자동등록방지
												숫자를 순서대로 입력하세요.</span>
										</fieldset>
									</div>

									<div class="write-btn pull-center">
										<button type="submit" id="btn_submit" accesskey="s" class="btn btn-success btn-sm"><i class="fa fa-check"></i> <b>작성완료</b></button>
										<!-- <a href="bdetail.hm" id="btn_submit" accesskey="s"
											class="btn btn-success btn-sm"><i class="fa fa-check"></i>
											<b>작성완료</b></a>  -->
										<a href="blist.hm" class="btn btn-danger btn-sm" role="button">취소</a>
									</div>

							

								</form>
							</div>

						</div>

					</div>
				</div>
				<!-- End Main Column -->
				<!-- Side Column -->
				<div class="col-md-3">
					<!-- Recent Posts -->
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
						<c:import url="../../common/noticeTopList.jsp"/>
					</div>
					<!-- End recent Posts -->
					<!-- 공지사항 -->
					<div class="panel panel-info">
						<!-- 이슈 시작-->
						<c:import url="../../common/recentPosts.jsp"/>
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

<script type="text/javascript" src="${contextPath}/resources/assets/js/jquery.min.js" type="text/javascript"></script>
<script>
	
	$("#hlocation").val("${ hboard.hLocation }").attr("selected", "selected");
	$("#hrenttype").val("${ hboard.hRentType }").attr("selected", true);
	$("#hlivingtype").val("${ hboard.hLivingType }").attr("selected", "selected");
	$("#hroom").val("${ hboard.hRoom }").attr("selected", "selected");
	$("#hfloor").val("${ hboard.hFloor }").attr("selected", "selected");
	$("#hparking").val("${ hboard.hParking }").attr("selected", "selected");
	$("#hReqgender").val("${ hboard.hReqgender }").attr("selected", "selected");
	 
</script>


	<!-- ==== FOOTER START ==== -->
	<c:import url="../../common/footer.jsp" />
	<!-- ==== FOOTER END ==== -->
</body>
</html>