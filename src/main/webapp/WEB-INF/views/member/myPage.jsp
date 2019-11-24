<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
 /* 1114test */
        #ultag li {
            display: inline;
            padding: 0 30px;
        }

        #table th {
            width: 150px;

        }

        #table td {
            width: 150px;
        }
    
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


/********************************************************
■ Page Title : 페이지 타이틀 및 설명글
********************************************************/
.at-title { height:55px; position:relative; color:#000; background-color: #fafafa; border:1px solid #dfdfdf; border-radius: 5px; }
.at-title .at-container { height:100%; position:relative; }
.at-title .page-title { font-size:24px; position:absolute; left:20px; bottom:15px; z-index:1; }
.at-title .page-desc { color:#888; position:absolute; right:20px; bottom:10px; z-index:1; }
@media all and (max-width:767px) {
	.responsive .at-title { height:50px; }
	.responsive .at-title .page-title { font-size:20px; left:15px; bottom:10px; }
}

.btn.btn-navy {
    color: #fff !important;
    border-image: none !important;
    background-image: none !important;
    border: 1px solid rgb(40, 40, 50);
    background-color: rgb(50, 60, 70);
}

.basic-outlogin .profile h3 {
    font-size: 18px;
    line-height: 32px;
    padding: 0px;
    margin: 0px;
    letter-spacing: -1px;
    display: block;
    text-overflow: ellipsis;
    white-space: nowrap;
    word-wrap: normal;
    overflow: hidden;
}

.text-muted {
    color: #777;
}


    </style>

</head>
<body>


<!-- ==== HEADER START ==== -->
	<c:import url ="../common/header.jsp"/>
<!-- ==== HEADER END ==== -->

  <!-- === BEGIN CONTENT === -->


        <div id="content">

          
        <div class="margin-bottom-20">
                <hr>
            </div>
            <div class="container background-white">

                <div class="row margin-vert-30">
                    <!-- Main Column -->
                    <div class="col-md-9">
                            <!-- Tab v2 -->
                            <div class="tabs alternative">
                                <div class="at-title" style="width:950px;">
                                    <div class="at-container">
                                        <div class="page-title en">
                                            <strong>
                                                <i class="fa fa-user"></i>마이페이지 </strong>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="page-desc hidden-xs">
                                            마이페이지 </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <br>
                                <div class="tab-content" style="border-top: 1px; width:950px;">
                                
                                
                                    <div class="tab-pane fade in active" id="sample-2a">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="table-responsive">
                                                    <div class="panel panel-default view-author">
                                                        <div class="panel-heading">
                                                            <h3 class="panel-title">My Profile</h3>
                                                        </div>
                                                        <div class="panel-body" style="background-color:white;">
                                                            
                                                            <!-- 여기 -->
                                                            <div class="panel-body">
																<div class="pull-left text-center auth-photo" style="width:100px;">
																	<div class="img-photo">
																		<!-- <i class="fa fa-user" > -->
																			<img src="${ contextPath }/resources/456.jpg" style="width: 100%;">
																		<!-- </i> -->				
																	</div>
																	
																	
																	<!-- 
																	
																	0 ~ 3 : 베이직
																	3 ~ 5 : 실버
																	5 ~ 10 : 골드-->
																	<c:if test="loginCount lte 3">
																		
																	</c:if>
																	
																	<div class="btn-group" style="margin-top:-30px;white-space:nowrap;">
																		<button type="button" class="btn btn-color btn-sm" onclick="apms_like('khajsfirepunch', 'like', 'it_like'); return false;" title="Like">
																			<i class="fa fa-thumbs-up"></i> <span id="it_like">0</span>
																		</button>
																		<button type="button" class="btn btn-color btn-sm" onclick="apms_like('khajsfirepunch', 'follow', 'it_follow'); return false;" title="Follow">
																			<i class="fa fa-users"></i> <span id="it_follow">0</span>
																		</button>
																	</div>
																</div>
																<div class="auth-info">
																	<div class="en font-14" style="margin-bottom:6px;">
																		<span class="pull-right font-12">
																			<c:if test="${ mlCode eq 'B' }">Exp 0 (0%)</c:if>
																			<c:if test="${ mlCode eq 'S' }">Exp 30 (30%)</c:if>
																			<c:if test="${ mlCode eq 'G' }">Exp 60 (60%)</c:if>
																		</span>
																		<b><a href="javascript:;" onclick="showSideView(this, 'khajsfirepunch', '중중식', '', '');">
																		<span class="member"><span class="lv-icon lv-1">1</span> ${ loginUser.nickname }</span></a></b> &nbsp;
																		<span class="text-muted en font-12">
																		<c:if test="${ mlCode eq 'B' }">BASIC</c:if>
																		<c:if test="${ mlCode eq 'S' }">SILVER</c:if>
																		<c:if test="${ mlCode eq 'G' }">GOLD</c:if>
																		레벨
																		</span>
																	</div>
																	
																<c:if test="${ mlCode eq 'G' }">	
																	<div class="progress progress-striped active">
								                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 90%;">
								                                            <span class="sr-only">90% Complete (Sucess)</span>
								                                        </div>
								                                    </div>
							                                    </c:if>
							
																<c:if test="${ mlCode eq 'S' }">
																	<div class="progress progress-striped active">
								                                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 30%;">
								                                            <span class="sr-only">30% Complete (info)</span>
								                                        </div>
								                                    </div>
							                                    </c:if>

																<c:if test="${ mlCode eq 'B' }">
																	<div class="progress progress-striped active">
								                                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 20%;">
								                                            <span class="sr-only">20%Complete (warning)</span>
								                                        </div>
								                                    </div>
							                                    </c:if>
							                                    
							                                    <div class="progress progress-striped active">
							                                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 30%;">
							                                            <span class="sr-only">30% Complete (info)</span>
							                                        </div>
							                                    </div>

																<!-- <div class="progress progress-striped active">
							                                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 10%;">
							                                            <span class="sr-only">10% Complete (danger)</span>
							                                        </div>
							                                    </div> -->
																	
								                                    
							                                    	<!-- 기존 상태바 -->
																	<!-- <div class="div-progress progress progress-striped no-margin">
																		<div class="progress-bar progress-bar-exp" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
																			<span class="sr-only">0 (0%)</span>
																		</div>
																	</div> -->
																</div>
																<div class="clearfix"></div>
															</div>
                                                            <!-- 끝 -->
                                                            
                                                            <!-- 잠시 주석  -->
                                                            <%-- <div class="auth-info">
                                                                <div class="en font-14" style="margin-bottom:6px;">
                                                                    <span class="pull-right font-12">Lv.1</span>
                                                                    <b><a href="javascript:;" onclick="showSideView(this, 'ch93ksw', 'wbgg', '', '');"><span class="member"><span class="lv-icon lv-1">1</span> 
                                                                    ${ loginUser.nickname }</span></a></b> &nbsp;<span class="text-muted en font-12">실버</span>
                                                                </div>
                                                                
                                                                <!-- <div class="progress progress-striped active">
							                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 90%;">
							                                            <span class="sr-only">90% Complete (Sucess)</span>
							                                        </div>
							                                    </div> -->
							
																<!-- <div class="progress progress-striped active">
							                                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 30%;">
							                                            <span class="sr-only">30% Complete (info)</span>
							                                        </div>
							                                    </div> -->
							                                    
							                                    <c:if test="${ !empty loginUser }">
							
																	<div class="progress progress-striped active">
								                                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 20%;">
								                                            <span class="sr-only">20%Complete (warning)</span>
								                                        </div>
								                                    </div>
							                                    
							                                    </c:if>	
							
																<!-- <div class="progress progress-striped active">
							                                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 10%;">
							                                            <span class="sr-only">10% Complete (danger)</span>
							                                        </div>
							                                    </div> -->
							                                    
                                                            </div> --%>
                                                            
                                                            
                                                            
                                                            <div class="clearfix"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
    
                                    <div class="row">
                                        <div class="col-sm-7">
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title">My Info</h3>
                                                </div>
                                                <ul class="list-group" style="background-color:white;">
                                                    <li class="list-group-item">
                                                        <a href="http://myroom.oceanmate.co.kr/bbs/point.php" target="_blank" class="win_point">
                                                            <span class="pull-right">0점</span>
                                                            MP						</a>
                                                    </li>
                                                                        <li class="list-group-item">
                                                        <span class="pull-right">${ loginUser.phone }</span>
                                                        연락처
                                                    </li>
                                                    <li class="list-group-item">
                                                        <span class="pull-right">${ loginUser.email }</span>
                                                        E-Mail
                                                    </li>
                                                    <li class="list-group-item">
                                                        <span class="pull-right">${ loginUser.gender }</span>
                                                       성별
                                                    </li>
                                                    
                                                    <li class="list-group-item" style="height:88px">
                                                        <span class="pull-right" style="text-align:right">${ loginUser.address }</span>
                                                        주소
                                                    </li>
                                                    <li class="list-group-item">
                                                        <button id="matching_onclick" type="button" class="btn btn-primary btn-sm" style="width: 100%;">나에게 맞는 메이트 찾기</button>
                                                    </li>
                                                                    </ul>
                                                            </div>
                                        </div>
                                      
                                        <div class="col-sm-5">
                                            <div class="panel panel-default">
                                            	<!-- recentPost 최근 본 개시물 Import -->
                                            	<c:import url="../common/recentPosts.jsp"/>
                                            	<!-- recentPost Import -->
                                            </div>
                                                <!-- <div class="col-xs-6">
                                                    <div class="form-group">
                                                        <a href="http://myroom.oceanmate.co.kr/bbs/response.php" target="_blank" class="btn btn-lightgray btn-sm btn-block win_memo">
                                                            내글반응
                                                                                    </a>		
                                                    </div>
                                                </div>
                                                <div class="col-xs-6">
                                                    <div class="form-group">
                                                        <a href="http://myroom.oceanmate.co.kr/bbs/memo.php" target="_blank" class="btn btn-lightgray btn-sm btn-block win_memo">
                                                            쪽지함
                                                                                    </a>
                                                    </div>
                                                </div>
                                                <div class="col-xs-6">
                                                    <div class="form-group">
                                                        <a href="http://myroom.oceanmate.co.kr/bbs/follow.php" target="_blank" class="btn btn-lightgray btn-sm btn-block win_memo">
                                                            팔로우
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col-xs-6">
                                                    <div class="form-group">
                                                        <a href="http://myroom.oceanmate.co.kr/bbs/scrap.php" target="_blank" class="btn btn-lightgray btn-sm btn-block win_scrap">
                                                            스크랩
                                                        </a>
                                                    </div>
                                                </div>
                                                                <div class="col-xs-6">
                                                    <div class="form-group">   
                                                        <a href="http://myroom.oceanmate.co.kr/bbs/mypost.php" target="_blank" class="btn btn-lightgray btn-sm btn-block win_memo">
                                                            내글관리
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col-xs-6">
                                                    <div class="form-group">
                                                        <a href="http://myroom.oceanmate.co.kr/bbs/myphoto.php" target="_blank" class="btn btn-lightgray btn-sm btn-block win_memo">
                                                            사진등록
                                                        </a>
                                                    </div>
                                                </div> -->
                                        </div>
                                        <div class="col-sm-4"></div>
                                        <div class="col-sm-8">
                                                <div class="col-xs-3">
                                                    <div class="form-group">
                                                        <a href="mupConfirm.me" class="btn btn-green btn-sm btn-block">
                                                            정보수정
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col-xs-3">
                                                    <div class="form-group">
                                                        <button id="deleteMember" class="btn btn-red btn-sm btn-block leave-me">
                                                            탈퇴하기
                                                        </button>
                                                    </div>
                                                </div>
                                        </div>
                                    </div>
                                    
    
                                </div>
    
                            </div>
    
                        </div>
                    <!-- End Main Column -->
                    <!-- Side Column -->
                    <div class="col-md-3">
                    
                    
                        <!-- Recent Posts -->
                        <!-- <button id="matching_onclick" type="button" class="btn btn-primary btn-sm" style="width: 100%;">나에게 맞는 메이트 찾기</button> -->
                        <div id="matching_form" class="section_matching">
                            <div class="matching_content">
                                <div class="col-md-6 col-md-offset-3 col-sm-offset-3">
								<form class="signup-page" id="mform">
									<div class="signup-header">
										<h2 style="display: inline;">나에게 맞는 메이트는?</h2>
										<span class="close"><h1 style="display: inline;">&times;</h1></span>
										<br>
										<br>
										<br>
										<br> 
									</div>
									<div class="row">
										<div class="col-sm-6">
											<label>메이트 *</label>
											<select id="mBcode" 
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
											<label>지역</label> 
											<select id="mLocation" class="form-control margin-bottom-20">
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
											<label>상대 성별</label> 
											<select id="mReqgender" class="form-control margin-bottom-20">
												<option value="">선택하세요</option>
												<option value="무관">무관</option>
												<option value="남성">남성</option>
												<option value="여성">여성</option>
											</select>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-6">
											<label>주거형태</label> 
											<select id="mLivingType"class="form-control margin-bottom-20">
												<option value="">선택하세요</option>
												<option value="단독주택">단독주택</option>
												<option value="빌라">빌라</option>
												<option value="아파트">아파트</option>
												<option value="오피스텔">오피스텔</option>
											</select>
										</div>
										<div class="col-sm-6">
											<label>방갯수</label> 
											<select id="mRoom" class="form-control margin-bottom-20">
												<option value="">선택하세요</option>
												<option value="원룸">원룸</option>
												<option value="투룸">투룸</option>
												<option value="쓰리룸">쓰리룸</option>
												<option value="포룸">포룸</option>
											</select>
										</div>
									</div>
									<!-- <div class="row">
										<div class="col-sm-6">
											<label>반려동물 유무</label> <select
												class="form-control margin-bottom-20">
												<option value="">전체</option>
												<option value="10p">무관</option>
												<option value="11p">반려견 OK</option>
												<option value="11p">반려묘 OK</option>
												<option value="11p">그 외 OK</option>
											</select>
										</div>
									</div> -->



									<div class="row">
										<div class="col-lg-8"></div>
										<div class="col-lg-4 text-right">
											<button class="btn btn-primary" type="button" id="matchingBtn">매칭하기</button>
										</div>
									</div>
									<hr>

									<!-- 매칭하기 누른 후 추천 메이트 목록 보여주기 -->
									<div class="row" >
										<div class="col-md-12" id="matListDiv">

											<!-- Portfolio Item -->
											<%-- <div class="col-md-4 portfolio-item margin-bottom-40 video"  >
													<a href="#">
														<figure>
															<img
																src="${ contextPath }/resources/hmBoardUploadFiles/1.JPG"
																alt="image1" style="width: 400px; height: 200px;">
															<figcaption>
																<h3 class="margin-top-20">Velit esse molestie</h3>
																<br>
																<div class="project-item__stats" style="align-content: right;">
																	<span class="project-item__stats__item">스크랩 9</span>
																	<!-- <span class="project-item__stats__dot"></span> -->
																	<span class="project-item__stats__item">조회 521</span>
																</div>
															</figcaption>
														</figure>
														<h6 class="project-item__cover__title">바람이 솔솔 불어오는
															화이트 인테리어</h6>
														<div>
															<div class="item_money_box">
																<strong class="item_price" style="color: #aa6868;"> 
																	<span>379,000원</span>
																</strong>
															</div>
														</div>
													</a>
											</div>
											<!-- End Portfolio Item -->
											<!-- Portfolio Item -->
											<div class="col-md-4 portfolio-item margin-bottom-40 design">
												<div>
													<a href="#">
														<figure>
															<img
																src="${ contextPath }/resources/hmBoardUploadFiles/2.JPG"
																alt="image2" style="width: 400px; height: 200px;">
															<figcaption>
																<h3 class="margin-top-20">Quam nunc putamus</h3>
																<div class="project-item__stats"
																	style="align-content: right;">
																	<span class="project-item__stats__item">스크랩 9</span>
																	<!-- <span class="project-item__stats__dot"></span> -->
																	<span class="project-item__stats__item">조회 521</span>
																</div>
															</figcaption>
														</figure>

														<h6 class="project-item__cover__title">원목가구로 조화를 이룬
															심플 인테리어</h6>
														<div>
															<div class="item_money_box">
																<strong class="item_price" style="color: #aa6868;"> 
																	<span>379,000원 	</span>
																</strong>
															</div>
														</div>
													</a>
												</div>
											</div>
											<!-- End Portfolio Item -->
											<!-- Portfolio Item -->
											<div class="col-md-4 portfolio-item margin-bottom-40 audio">
												<div>
													<a href="#">
														<figure>
															<img
																src="${ contextPath }/resources/hmBoardUploadFiles/3.JPG"
																alt="image3" style="width: 400px; height: 200px;">
															<figcaption>
																<h3 class="margin-top-20">Placerat facer possim</h3>
																<div class="project-item__stats"
																	style="align-content: right;">
																	<span class="project-item__stats__item">스크랩 9</span>
																	<!-- <span class="project-item__stats__dot"></span> -->
																	<span class="project-item__stats__item">조회 521</span>
																</div>
															</figcaption>
														</figure>
														<h6 class="project-item__cover__title">네추럴 모던 스타일의 취향
															저격</h6>
														<div>
															<div class="item_money_box">
																<p class="item_price_consumer"
																	style="text-decoration: line-through; display: inline-block;">
																	<span>450,000원 </span>
																</p>
																&nbsp;&nbsp; <strong class="item_price"
																	style="color: #aa6868;"> <span>379,000원
																</span>
																</strong>
															</div>
														</div>
													</a>
												</div>
											</div> --%>
					
										</div>
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

						/* window.onclick = function(event) {
							if (event.target == section_matching) {
								section_matching.style.display = "none";
							}
						} */
						
						
						// "나에게 맞는 메이트 찾기" 버튼 눌렀을 때
						$("#matchingBtn").on("click", function(){
							var mBcode = $("#mBcode option:selected").val();
							var mLocation = $("#mLocation option:selected").val();
							var mReqgender = $("#mReqgender option:selected").val();
							var mLivingType = $("#mLivingType option:selected").val();
							var mRoom = $("#mRoom option:selected").val(); 
							console.log(mBcode);
							
							$.ajax({
								url: "matchingList.mc",
								data: {mBcode:mBcode, mLocation:mLocation, mReqgender:mReqgender,
									mLivingType:mLivingType, mRoom:mRoom},
								type: "post",
								success: function(data){
									console.log("ajax 성공");
									$(".section_matching").css('display','block');
									
									$matListDiv = $("#matListDiv");
									$matListDiv.html("");
									console.log(data);
									
									var $mDiv;
									var $atag;
									var $figuretag;
									var $imgtag;
									var $h6tag;
									
									if(data.length > 0){
										console.log("if왔나");
										
										switch (data[0].bcode) {
										case "RMBCODE":
											for(var i in data){
												$mDiv = $("<div>").addClass("col-md-4 portfolio-item margin-bottom-40 design");
												$atag = $("<a>").attr('href','bdetail.rm?rbId='+data[i].rbId);
												$figuretag = $("<figure>");
												$imgtag = $("<img>").attr('src','${ contextPath }/resources/rmboarduploads/2.JPG')
																  .width('400px').height('200px');
												$h6tag = $("<h6>").addClass("project-item__cover__title").text(data[i].rbTitle);
												
												$mDiv.append($atag);
												$atag.append($figuretag); 
												$figuretag.append($imgtag);
												$atag.append($h6tag);
												$matListDiv.append($mDiv);
											}
											break;
											
										case "HMBCODE":
											for(var i in data){
												$mDiv = $("<div>").addClass("col-md-4 portfolio-item margin-bottom-40 design");
												$atag = $("<a>").attr('href','bdetail.hm?hbId='+data[i].hbId);
												$figuretag = $("<figure>");
												$imgtag = $("<img>").attr('src','${ contextPath }/resources/hmBoardUploadFiles/2.JPG')
																  .width('400px').height('200px');
												$h6tag = $("<h6>").addClass("project-item__cover__title").text(data[i].hbTitle);
												
												$mDiv.append($atag);
												$atag.append($figuretag); 
												$figuretag.append($imgtag);
												$atag.append($h6tag);
												$matListDiv.append($mDiv);
											}
											break;
										case "FMBCODE":
											for(var i in data){
												$mDiv = $("<div>").addClass("col-md-4 portfolio-item margin-bottom-40 design");
												$atag = $("<a>").attr('href','bdetail.fm?fbId='+data[i].fbId);
												$figuretag = $("<figure>");
												$imgtag = $("<img>").attr('src','${ contextPath }/resources/fmboarduploads/2.JPG')
																  .width('400px').height('200px');
												$h6tag = $("<h6>").addClass("project-item__cover__title").text(data[i].fbTitle);
												
												$mDiv.append($atag);
												$atag.append($figuretag); 
												$figuretag.append($imgtag);
												$atag.append($h6tag);
												$matListDiv.append($mDiv);
											}
											break;
										default:
											break;
										}
										
									}
									
									
									// 모달창의 x를 누를때  기존값 초기화시키기
									$(".close").on("click", function(){
										$matListDiv.html("");
										$("#mform").each(function() {
											this.reset();	
										});
									});
									
								},
								error: function() {
									alert("필수 항목을 반드시 입력해주세요.");
								}
							});
							
						});
						
					</script>
                        <br><br>
                        <%-- <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Profile</h3>
                            </div>
                            <div class="panel-body">
                                <ul class="posts-list margin-top-10">
                                    <li>
                                        <div class="recent-post">
                                            <div class="basic-outlogin">
                                                <div class="pull-right">
                                                <a href="http://myroom.oceanmate.co.kr/bbs/member_confirm.php?url=member_leave.php" class="leave-me at-tip" data-original-title="<nobr>회원탈퇴</nobr>" data-toggle="tooltip" data-placement="top" data-html="true">
                                                    <span class="text-muted"><i class="fa fa-sign-out fa-lg"></i></span>
                                                </a>
                                            </div>
                                            <div class="profile">
                                                <a href="http://myroom.oceanmate.co.kr/bbs/myphoto.php" target="_blank" class="win_memo" title="사진등록">
                                                    <div class="photo pull-left">
                                                        <img class="img-circle" style="width:80px" src="${ contextPath }/resources/assets/img/profiles/userimg.jpg">
                                                    </div>
                                                </a>
                                                <h4>${ loginUser.nickname }
                                                	<c:if test="${ !empty loginUser }">
	                                                   <input type="text" name="rbWriter"  id="rbWriter" value="${ loginUser.nickname }" readonly class="form-control input-sm" size="10" maxlength="20">
		                                         	</c:if>	
                                                </h4>
                                                <div class="font-12 text-muted" style="letter-spacing:-1px;">실버</div>
                                                <div class="clearfix"></div>
                                            </div>
                                    
                                            <div class="at-tip" data-original-title="1,000점 추가획득시 레벨업합니다." data-toggle="tooltip" data-placement="top" data-html="true" style="margin:10px 0px;">
                                                <div class="div-progress progress progress-striped" style="margin:0px;">
                                                    <div class="progress-bar progress-bar-exp" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                                                        <span class="sr-only">Lv.1</span>
                                                    </div>
                                                </div>
                                                <div class="sr-score pull-right" style="color:#fff; margin-top:-28px;">0 (0%)</div>
                                            </div>
                                    
                                            <div class="text-muted">
                                    
                                                <div class="pull-left">
                                                    <!--
                                                    <a href="http://myroom.oceanmate.co.kr/bbs/response.php" target="_blank" class="win_memo">
                                                        알림				</a>
                                                    -->
                                    
                                                    <a href="javascript:;" onclick="sidebar_open('sidebar-response');"> 
                                                        알림
                                                        <span class="sidebarLabel" style="display:none;">
                                                            <b class="orangered sidebarCount">0</b>
                                                        </span>
                                                    </a>
                                    
                                                    <span class="lightgray">&nbsp;|&nbsp;</span>
                                                    <a href="http://myroom.oceanmate.co.kr/bbs/memo.php" target="_blank" class="win_memo">
                                                        쪽지				</a>
                                                                </div>
                                                <div class="pull-right">
                                                    <a href="http://myroom.oceanmate.co.kr/bbs/scrap.php" target="_blank" class="win_scrap">
                                                        스크랩
                                                    </a>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>
                                    
                                            <div class="login-line">
                                                <div class="pull-left">
                                                    <a href="http://myroom.oceanmate.co.kr/bbs/point.php" target="_blank" class="win_point">
                                                        <i class="fa fa-gift"></i> MP <b class="red">0</b>
                                                    </a>
                                                </div>
                                    
                                                <div class="pull-right" style="letter-spacing:-1px;">
                                                    <!--
                                                    <a href="#" class="asideButton">
                                                    -->
                                                    <a href="javascript:;" onclick="sidebar_open('sidebar-user');">
                                                        <span class="text-muted">마이메뉴</span>
                                                    </a>
                                                    <span class="lightgray">&nbsp;|&nbsp;</span>
                                                    <a href="http://myroom.oceanmate.co.kr/bbs/member_confirm.php?url=register_form.php">
                                                        <span class="text-muted">정보수정</span>
                                                    </a>
                                                </div>
                                    
                                                <div class="clearfix"></div>
                                            </div>
                                    
                                            <a href="http://myroom.oceanmate.co.kr/bbs/logout.php" class="btn btn-navy btn-block en">
                                                <i class="fa fa-power-off"></i>	Logout
                                            </a>
                                    
                                        </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </li>
                                </ul>
                            </div>
                        </div> --%>
                        <!-- 111 -->
                        
                        
                        <!-- End recent Posts -->
                        <!-- 공지사항 -->
                        <!-- <div class="panel panel-danger">
                            이슈 시작
                            <div class="panel-heading">
                                <a href="http://myroom.oceanmate.co.kr/bbs/board.php?bo_table=roomate"
                                    style="color:darkslategray">
                                    <span class="pull-right lightgray font-16 en">+</span>
                                    <span class="div-title-underbar-bold border-navy font-16 en">
                                        <b>공지사항</b>
                                    </span>
                                </a>
                            </div>
                            <div class="widget-box panel-body" style="background-color: white;">
                                <div class="basic-post-list ">

                                    <ul class="post-list" style="list-style: none; padding:0px">
                                        <li class="ellipsis">
                                            <a
                                                href="http://myroom.oceanmate.co.kr/bbs/board.php?bo_table=roomate&amp;wr_id=134">

                                                <span class="pull-right gray font-12">
                                                    &nbsp;7시간전 </span>
                                                <span class="wr-icon wr-new"></span> <span class="subject_title"><b>한글깨짐
                                                        오류 수정안내</b></span>
                                            </a>
                                        </li>
                                        <li class="ellipsis">
                                            <a
                                                href="http://myroom.oceanmate.co.kr/bbs/board.php?bo_table=roomate&amp;wr_id=133">

                                                <span class="pull-right gray font-12">
                                                    &nbsp;22시간전 </span>
                                                <span class="wr-icon wr-new"></span> <span
                                                    class="subject_title"><b>모바일에서의 클릭시 오류 수정안내</b></span>
                                            </a>
                                        </li>
                                        <li class="ellipsis">
                                            <a
                                                href="http://myroom.oceanmate.co.kr/bbs/board.php?bo_table=roomate&amp;wr_id=132">

                                                <span class="pull-right gray font-12">
                                                    &nbsp;1일전 </span>
                                                <span class="wr-icon wr-new"></span> <span class="subject_title">사이트 글쓰기
                                                    장애에 대한 사과공지</span>
                                            </a>
                                        </li>
                                        <li class="ellipsis">
                                            <a
                                                href="http://myroom.oceanmate.co.kr/bbs/board.php?bo_table=roomate&amp;wr_id=131">

                                                <span class="pull-right gray font-12">
                                                    &nbsp;6일전 </span>
                                                <span class="lightgray"><i class="fa fa-caret-right"></i></span> <span
                                                    class="subject_title">광고가
                                                    겹쳐서 사용이 안되시는 회원님
                                                </span>
                                            </a>
                                        </li>

                                    </ul>
                                </div>
                            </div>
                            이슈 끝
                        </div> -->
                        
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

 <!-- 비밀번호 불일치 모달 -->
	<div class="modal fade" id="pwdCheck" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel"> 탈퇴회원 비밀번호 확인 </h4>
				</div>
				<div class="modal-body">
				본인 확인을 위해 가입시 입력하신 비밀번호를 입력해주세요<br>
				<div class="form-group has-feedback" >
					<label><b>회원아이디 : 
					<span id="mb_confirm_id" class="text-primary">${loginUser.email }</span>
					</b></label> 
					<input type="password" name="pwd" id="passwordCheck" required
						class="form-control input-sm" size="15" maxlength="20">
					<span class="fa fa-lock form-control-feedback"></span>
				</div>
				<span id="pwdResult"></span>
				</div>
				<div class="modal-footer">
					<button type="button" id="submitBtn" class="btn btn-primary" >확인</button>
				</div>
			</div>
		</div>
	</div>
<!-- 비밀번호 불일치 모달 끝 -->

<!-- ==== FOOTER START ==== -->
	<c:import url ="../common/footer.jsp"/>
<!-- ==== FOOTER END ==== -->


<script>
$('#deleteMember').click(function() {
		console.log("비밀번호 확인");
		$("#pwdCheck").modal();
		$('#pwdResult').html("");
		$('#passwordCheck').val("");
});

$('#submitBtn').click(function(){
	var passwordCheck = $('#passwordCheck').val();
	var emailCheck = "${loginUser.email}";
	//console.log("머야 왜안나와 " +passwordCheck+" "+emailCheck);
	
	$.ajax({
		url  : "pwdCheck.me",
		data : {pwd: passwordCheck, email :emailCheck},
		success : function(data){
			console.log("전송됨");
			if(data == "success"){
				window.location.replace("mdelete.me");
			}else{
				 $('#pwdResult').html("비밀번호 확인 값이 불일치합니다.").css('color','red');
			}
		}
	});
});
</script>
</body>
</html>