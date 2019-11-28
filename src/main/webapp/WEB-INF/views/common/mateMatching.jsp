<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  .btn.btn-lightgray { 
   color: #333 !important; border-image: none !important; background-image: none !important;
   border: 1px solid #ddd; 
   background-color: #fafafa; 
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
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  }

  .matching_content {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    width: 100%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s
  }
</style>
</head>
<body>

	<!-- Recent Posts -->
	<!-- <button id="matching_onclick" type="button" class="btn btn-primary btn-sm" style="width: 100%;">나에게 맞는 메이트 찾기</button> -->
	<div id="matching_form" class="section_matching">
		<div class="matching_content">
			<div class="col-md-6 col-md-offset-3 col-sm-offset-3">
				<form class="signup-page" id="mform">
					<div class="signup-header">
						<h2 style="display: inline;">나에게 맞는 메이트는?</h2>
						<span class="close"><h1 style="display: inline;">&times;</h1></span>
						<br> <br> <br> <br>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<label>메이트 *</label> <select id="mBcode"
								class="form-control margin-bottom-20">
								<option value="">선택</option>
								<option value="RMBCODE">룸메이트</option>
								<option value="HMBCODE">하우스메이트</option>
								<option value="FMBCODE">신입생메이트</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<label>지역</label> <select id="mLocation"
								class="form-control margin-bottom-20">
								<option value="">선택하세요</option>
								<option value="서울">서울</option>
								<option value="인천">인천/부천</option>
								<option value="수원">수원/경기</option>
								<option value="대구">대구/경북</option>
								<option value="부산">부산/경남</option>
								<option value="충청">충청/강원</option>
								<option value="광주">광주/전라</option>
							</select>
						</div>
						<div class="col-sm-6">
							<label>상대 성별</label> <select id="mReqgender"
								class="form-control margin-bottom-20">
								<option value="">선택하세요</option>
								<option value="무관">무관</option>
								<option value="남성">남성</option>
								<option value="여성">여성</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<label>주거형태</label> <select id="mLivingType"
								class="form-control margin-bottom-20">
								<option value="">선택하세요</option>
								<option value="단독주택">단독주택</option>
								<option value="빌라">빌라</option>
								<option value="아파트">아파트</option>
								<option value="오피스텔">오피스텔</option>
							</select>
						</div>
						<div class="col-sm-6">
							<label>방갯수</label> <select id="mRoom"
								class="form-control margin-bottom-20">
								<option value="">선택하세요</option>
								<option value="원룸">원룸</option>
								<option value="투룸">투룸</option>
								<option value="쓰리룸">쓰리룸</option>
								<option value="포룸">포룸</option>
							</select>
						</div>
					</div>


					<div class="row">
						<div class="col-lg-8"></div>
						<div class="col-lg-4 text-right">
							<button class="btn btn-primary" type="button" id="matchingBtn">매칭하기</button>
						</div>
					</div>
					<hr>

					<!-- 매칭하기 누른 후 추천 메이트 목록 보여주기 -->
					<div class="row">
						<div class="col-md-12" id="matListDiv"></div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script>
		var section_matching = document.getElementById("matching_form");

		var matching_btn = document.getElementById("matching_onclick");

		var span = document.getElementsByClassName("close")[0];

		matching_btn.onclick = function() {
			section_matching.style.display = "block";
		}

		span.onclick = function() {
			section_matching.style.display = "none";
		}

		// "나에게 맞는 메이트 찾기" 버튼 눌렀을 때
		$("#matchingBtn")
				.on(
						"click",
						function() {
							var mBcode = $("#mBcode option:selected").val();
							var mLocation = $("#mLocation option:selected")
									.val();
							var mReqgender = $("#mReqgender option:selected")
									.val();
							var mLivingType = $("#mLivingType option:selected")
									.val();
							var mRoom = $("#mRoom option:selected").val();
							console.log(mBcode);

							$
									.ajax({
										url : "matchingList.mc",
										data : {
											mBcode : mBcode,
											mLocation : mLocation,
											mReqgender : mReqgender,
											mLivingType : mLivingType,
											mRoom : mRoom
										},
										type : "post",
										success : function(data) {
											console.log("ajax 성공");
											$(".section_matching").css(
													'display', 'block');

											$matListDiv = $("#matListDiv");
											$matListDiv.html("");
											console.log(data);

											var $mDiv;
											var $atag;
											var $figuretag;
											var $imgtag;
											var $h6tag;

											if (data.length > 0) {

												switch (data[0].bcode) {
												case "RMBCODE":
													for ( var i in data) {
														$mDiv = $("<div>")
																.addClass(
																		"col-md-4 portfolio-item margin-bottom-40 design");
														$atag = $("<a>")
																.attr(
																		'href',
																		'bdetail.rm?rbId='
																				+ data[i].rbId);
														$figuretag = $("<figure>");
														if (data[i].renameFileName != null) {
															$imgtag = $("<img>")
																	.attr(
																			'src',
																			'${ contextPath }/resources/rmboarduploads/'
																					+ data[i].renameFileName)
																	.width(
																			'400px')
																	.height(
																			'200px');
														} else {
															$imgtag = $("<img>")
																	.attr(
																			'src',
																			'${ contextPath }/resources/assets/img/matchingNoImg.png')
																	.width(
																			'400px')
																	.height(
																			'200px');
														}
														$h6tag = $("<h6>")
																.addClass(
																		"project-item__cover__title")
																.text(
																		data[i].rbTitle);

														$mDiv.append($atag);
														$atag
																.append($figuretag);
														$figuretag
																.append($imgtag);
														$atag.append($h6tag);
														$matListDiv
																.append($mDiv);
													}
													break;

												case "HMBCODE":
													for ( var i in data) {
														$mDiv = $("<div>")
																.addClass(
																		"col-md-4 portfolio-item margin-bottom-40 design");
														$atag = $("<a>")
																.attr(
																		'href',
																		'bdetail.hm?hbId='
																				+ data[i].hbId);
														$figuretag = $("<figure>");
														if (data[i].renameFileName != null) {
															$imgtag = $("<img>")
																	.attr(
																			'src',
																			'${ contextPath }/resources/hmBoardUploadFiles/'
																					+ data[i].renameFileName)
																	.width(
																			'400px')
																	.height(
																			'200px');
														} else {
															$imgtag = $("<img>")
																	.attr(
																			'src',
																			'${ contextPath }/resources/assets/img/matchingNoImg.png')
																	.width(
																			'400px')
																	.height(
																			'200px');
														}
														$h6tag = $("<h6>")
																.addClass(
																		"project-item__cover__title")
																.text(
																		data[i].hbTitle);

														$mDiv.append($atag);
														$atag
																.append($figuretag);
														$figuretag
																.append($imgtag);
														$atag.append($h6tag);
														$matListDiv
																.append($mDiv);
													}
													break;
												case "FMBCODE":
													for ( var i in data) {
														$mDiv = $("<div>")
																.addClass(
																		"col-md-4 portfolio-item margin-bottom-40 design");
														$atag = $("<a>")
																.attr(
																		'href',
																		'bdetail.fm?fbId='
																				+ data[i].fbId);
														$figuretag = $("<figure>");
														if (data[i].renameFileName != null) {
															$imgtag = $("<img>")
																	.attr(
																			'src',
																			'${ contextPath }/resources/fmboarduploads/'
																					+ data[i].renameFileName)
																	.width(
																			'400px')
																	.height(
																			'200px');
														} else {
															$imgtag = $("<img>")
																	.attr(
																			'src',
																			'${ contextPath }/resources/assets/img/matchingNoImg.png')
																	.width(
																			'400px')
																	.height(
																			'200px');
														}
														$h6tag = $("<h6>")
																.addClass(
																		"project-item__cover__title")
																.text(
																		data[i].fbTitle);

														$mDiv.append($atag);
														$atag
																.append($figuretag);
														$figuretag
																.append($imgtag);
														$atag.append($h6tag);
														$matListDiv
																.append($mDiv);
													}
													break;
												default:
													break;
												}

											}

											// 모달창의 x를 누를때  기존값 초기화시키기
											$(".close").on("click", function() {
												$matListDiv.html("");
												$("#mform").each(function() {
													this.reset();
												});
											});

										},
										error : function() {
											alert("필수 항목을 반드시 입력해주세요.");
										}
									});

						});
	</script>

</body>
</html>