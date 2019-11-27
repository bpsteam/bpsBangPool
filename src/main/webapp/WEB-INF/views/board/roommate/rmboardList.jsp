<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            border-bottom: 1px solid #dddddd ;
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

<!-- ==== HEADER START ==== -->
	<c:import url ="../../common/header.jsp"/>
<!-- ==== HEADER END ==== -->


 <!-- === BEGIN CONTENT === -->
        
        
        <div id="content">
        
            <div id="slideshow" class="bottom-border-shadow">
                <div class="container background-grey bottom-border">
        
                    <div class="margin-bottom-10">
                        <hr>
                    </div>
                    <!-- ==== BEGIN ADVERTISEMENT ==== -->
	<c:import url ="../../common/advertisement.jsp"/>
<!-- ==== END ADVERTISEMENT ==== -->
                    <br>
                    <br>
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
                                <div class="tab-pane fade in active" id="roommate">
                                        <h1><small>ROOMMATE</small></h1>
                                        <div class="margin-bottom-10">
                                                <hr>
                                            </div>
                                        <div class="tabs alternative" >
                                                <ul class="nav nav-tabs">
                                                    <li id="all">
                                                   		<c:url var="ploc" value="blist.rm">
                                                   			<c:param name="loc" value=""/>
                                                   		</c:url>
                                                        <a class="ploc" href="${ ploc }">전체</a>
                                                    </li>
                                                    <li id="seoul">
                                                    	<c:url var="ploc" value="blist.rm">
                                                   			<c:param name="loc" value="SEOUL"/>
                                                   		</c:url>
                                                       	<a href="${ ploc }" >서울</a>
                                                    </li>
                                                    <li id="inc">
                                                    	<c:url var="ploc" value="blist.rm">
                                                   			<c:param name="loc" value="INCHEON"/>
                                                   		</c:url>
                                                        <a class="ploc" href="${ ploc }">인천/부천</a>
                                                    </li>
                                                    <li id="su">
                                                    	<c:url var="ploc" value="blist.rm">
                                                   			<c:param name="loc" value="SUWON"/>
                                                   		</c:url>
                                                        <a class="ploc" href="${ ploc }">수원/경기</a>
                                                    </li>
                                                    <li id="dae">
                                                    	<c:url var="ploc" value="blist.rm">
                                                   			<c:param name="loc" value="DAEGU"/>
                                                   		</c:url>
                                                        <a class="ploc" href="${ ploc }">대구/경북</a>
                                                    </li>
                                                    <li id="bu">
                                                    	<c:url var="ploc" value="blist.rm">
                                                   			<c:param name="loc" value="BUSAN"/>
                                                   		</c:url>
                                                        <a class="ploc" href="${ ploc }">부산/경남</a>
                                                    </li>
                                                    <li id="chung">
                                                    	<c:url var="ploc" value="blist.rm">
                                                   			<c:param name="loc" value="CHUNGCHEONG"/>
                                                   		</c:url>
                                                        <a class="ploc" href="${ ploc }">충청/강원</a>
                                                    </li>
                                                    <li id="kwang">
                                                    	<c:url var="ploc" value="blist.rm">
                                                   			<c:param name="loc" value="GWANGJU"/>
                                                   		</c:url>
                                                        <a class="ploc" href="${ ploc }">광주/전라</a>
                                                    </li>
                                                    
                                                    
                                                </ul>
                                                <div class="tab-content">
                                                    <div class="tab-pane fade in active" id="sample-2a">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="table-responsive">
                                                                    <table class="table table-hover">
                                                                        <thead>
                                                                            <tr>
                                                                                <th>No.</th>
                                                                                <th>분류</th>
                                                                                <th>제목</th>
                                                                                <th>글쓴이</th>
                                                                                <th>날짜</th>
                                                                                <th>조회</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                        <c:forEach var="b" items="${ list }">
                                                                        	<tr>
                                                                        		<td>${ b.rbId }</td>
                                                                        		<td>${ b.rLocation }</td>
                                                                        			<c:url var="bdetail" value="bdetail.rm">
                                                                        				<c:param name="rbId" value="${ b.rbId }"></c:param>
                                                                        			</c:url>
                                                                        		<td onClick="location.href='${ bdetail }'">
                                                                        				<%-- <a href="${ bdetail }">${ b.rbTitle }</a></td> --%>
                                                                        				${ b.rbTitle }
                                                                     			</td>
                                                                        		<td>${ b.rbWriter }</td>
                                                                        		<td>${ b.rbCreateDate }</td>
                                                                        		<td>${ b.rbCount }</td>
                                                                        		
                                                                        	</tr>
                                                                        
                                                                        </c:forEach>
                                                                        
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                            
                                                    <div class="tab-pane fade in" id="sample-2b">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="table-responsive">
                                                                    <table class="table table-hover">
                                                                        <thead>
                                                                            <tr>
                                                                                <th>No.</th>
                                                                                <th>분류</th>
                                                                                <th>제목</th>
                                                                                <th>작성자</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                    
                                                    <div class="tab-pane fade in" id="sample-2c">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="table-responsive">
                                                                    <table class="table table-hover">
                                                                        <thead>
                                                                            <tr>
                                                                                <th>No.</th>
                                                                                <th>분류</th>
                                                                                <th>제목</th>
                                                                                <th>작성자</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                            
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                    
                                                    <div class="tab-pane fade in" id="sample-2d">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="table-responsive">
                                                                    <table class="table table-hover">
                                                                        <thead>
                                                                            <tr>
                                                                                <th>No.</th>
                                                                                <th>분류</th>
                                                                                <th>제목</th>
                                                                                <th>작성자</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                            
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                    <!-- 페이징 처리  -->
                                                    <div class="text-center">
                                                        <ul class="pagination">
                                                        	<!-- [이전]-->
                                                        	<li>
	                                                        	<c:if test="${ pi.currentPage <= 1 }">
	                                                        		<a>«</a>
	                                                        	</c:if>
	                                                        	<c:if test="${ pi.currentPage > 1 }">
	                                                        		<c:url var="before" value="blist.rm">
	                                                        			
	                                                        			<!-- 검색창 관련 -->
	                                                        			<c:if test="${ searchValue ne null }">
		                                                        			<c:param name="searchCondition" value="${ searchCondition }"/>
																			<c:param name="searchValue" value="${ searchValue }"/>
																		</c:if>	
	                                                        			<c:param name="page" value="${ pi.currentPage -1 }"/>
	                                                        		</c:url>
	                                                        		<a href="${ before }">«</a>
	                                                        	</c:if>
                                                        	</li>
                                                        	
                                                        	<!-- 페이지 -->
                                                        	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                                                        		<c:if test="${ p eq pi.currentPage }">
                                                        			<li class="active">
                                                        				<a>${ p }</a>
                                                        			</li>
                                                        		</c:if>
                                                        			
                                                        		<c:if test="${ p ne pi.currentPage }">
                                                        			<li>
	                                                        			<c:url var="pg" value="blist.rm">
	                                                        				<!-- 검색창 관련 -->
	                                                        				<c:if test="${ searchValue ne null }">
			                                                        			<c:param name="searchCondition" value="${ searchCondition }"/>
																				<c:param name="searchValue" value="${ searchValue }"/>
																			</c:if>
	                                                        				<c:param name="page" value="${ p }"/>
	                                                        			</c:url>
	                                                        			<a href="${ pg }">${ p }</a>
                                                        			</li>
                                                        		</c:if> 
                                                        	</c:forEach>
                                                        	
                                                        	<!-- [다음] -->
                                                        	<li>
	                                                        	<c:if test="${ pi.currentPage >= pi.maxPage }">
	                                                        		<a>»</a>
	                                                        	</c:if>
	                                                        	<c:if test="${ pi.currentPage < pi.maxPage }">
	                                                        		<c:url var="after" value="blist.rm">
	                                                        			
	                                                        			<!-- 검색창 관련 -->
                                                        				<c:if test="${ searchValue ne null }">
		                                                        			<c:param name="searchCondition" value="${ searchCondition }"/>
																			<c:param name="searchValue" value="${ searchValue }"/>
																		</c:if>
	                                                        			<c:param name="page" value="${ pi.currentPage +1 }"/>
	                                                        		</c:url>
	                                                        		<a href="${ after }">»</a>
	                                                        	</c:if>
                                                        	</li>
                                                        	
                                                        
                                                            <!-- <li>
                                                                <a href="#">«</a>
                                                            </li>
                                                            <li>
                                                                <a href="#">1</a>
                                                            </li>
                                                            <li>
                                                                <a href="#">2</a>
                                                            </li>
                                                            <li class="active">
                                                                <a href="#">3</a>
                                                            </li>
                                                            <li>
                                                                <a href="#">4</a>
                                                            </li>
                                                            <li>
                                                                <a href="#">5</a>
                                                            </li>
                                                            <li>
                                                                <a href="#">»</a>
                                                            </li> -->
                                                        </ul>
                                                        <a href="#" style="float:left" class="btn btn-aqua btn-sm" data-toggle="modal" data-target="#searchModal" onclick="return false;"><i class="fa fa-search"></i></a>
                                                        <a href="binsertview.rm" type="button" class="btn btn-red" style="float: right;">글쓰기</a>
                                                    </div>
                                                </div>
                            
                            
                            
                            
                                            </div>
                                </div>
                                
                            </div>
                        </div>
                        
                    <!-- End Main Column -->


<!-- 검색 모달창 시작 -->
                    <div class="modal fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                        <div class="modal-dialog modal-sm">
                            <div class="modal-content">
                                <div class="modal-body">
                                    <div class="text-center">
                                        <h4 id="myModalLabel" style="font-weight: 500; font-family: 'Roboto', sans-serif; color:unset; line-height:1.1"><i class="fa fa-search fa-lg" ></i> Search</h4>
                                    </div>
                                    <form name="fsearch" action="bsearch.rm" method="get" role="form" class="form" style="margin-top:20px;">
                                        <input type="hidden" name="bo_table" value="roomate">
                                        <input type="hidden" name="sca" value="">
                                        <input type="hidden" name="sop" value="and">
                                        <div class="form-group">
                                            <label for="sfl" class="sound_only">검색대상</label>
                                            <!-- <select name="sfl" id="sfl" class="form-control input-sm"> -->
                                            <select id="searchCondition" name="searchCondition" class="form-control input-sm">
                                                <option value="stitle">제목</option>
                                                <option value="scontent">내용</option>
                                                <!-- <option value="wr_subject||wr_content">제목+내용</option> -->
                                                <!-- <option value="mb_id,1">회원아이디</option> -->
                                                <!-- <option value="wr_name,1">글쓴이</option> -->
                                                <option value="swriter">글쓴이</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="stx" class="sound_only">검색어<strong class="sound_only"> 필수</strong></label>
                                            <input id="searchValue" type="text" name="searchValue" required="" id="stx" class="form-control input-sm" maxlength="20" placeholder="검색어">
                                        </div>
            
                                        <div class="btn-group btn-group-justified">
                                            <div class="btn-group">
                                                <button type="submit" class="btn btn-danger" onclick="searchBoard();"><i class="fa fa-check"></i></button>
                                            </div>
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-aqua" data-dismiss="modal"><i class="fa fa-times"></i></button>
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
                        <button id="matching_onclick" type="button" class="btn btn-primary btn-sm" style="width: 100%;">나에게 맞는 메이트 찾기</button>
                        <div id="matching_form" class="section_matching">
                            <div class="matching_content">
                                <div class="col-md-6 col-md-offset-3 col-sm-offset-3">
								<form class="signup-page" id="mform">
									<div class="signup-header">
										<h2 style="display: inline;">나에게 맞는 메이트는?</h2>
										<span class="close"><h1 style="display: inline;">&times;</h1></span>
										<br><br><br><br> 
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
										switch (data[0].bcode) {
										case "RMBCODE":
											for(var i in data){
												$mDiv = $("<div>").addClass("col-md-4 portfolio-item margin-bottom-40 design");
												$atag = $("<a>").attr('href','bdetail.rm?rbId='+data[i].rbId);
												$figuretag = $("<figure>");
												if(data[i].renameFileName != null){
													$imgtag = $("<img>").attr('src','${ contextPath }/resources/rmboarduploads/'+data[i].renameFileName)
													  .width('400px').height('200px');
												} else {
													$imgtag = $("<img>").attr('src', '${ contextPath }/resources/assets/img/matching1.JPG')
																	  .width('400px').height('200px');
												}
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
												if(data[i].renameFileName != null){
													$imgtag = $("<img>").attr('src','${ contextPath }/resources/hmBoardUploadFiles/'+data[i].renameFileName)
													  .width('400px').height('200px');
												} else {
													$imgtag = $("<img>").attr('src', '${ contextPath }/resources/assets/img/matching1.JPG')
																	  .width('400px').height('200px');
												}
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
												if(data[i].renameFileName != null){
													$imgtag = $("<img>").attr('src','${ contextPath }/resources/fmboarduploads/'+data[i].renameFileName)
													  .width('400px').height('200px');
												} else {
													$imgtag = $("<img>").attr('src', '${ contextPath }/resources/assets/img/matching1.JPG')
																	  .width('400px').height('200px');
												}
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
                                        <li class="active">
                                            <a href="#roommate" >
                                                <i class="fa fa-cloud"></i>  룸메이트</a>
                                        </li>
                                        <li>
                                            <a href="blist.hm" >
                                                <i class="fa fa-home"></i>  하우스메이트</a>
                                        </li>
                                        <li>
                                            <a href="blist.fm?fLocation=전체" >
                                                <i class="fa fa-comments"></i>  신입생메이트</a>
                                        </li>
                                        
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
        
<script>
// 탭 액티브 처리
	$(function(){
		var location= "${ loc }";
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
		case "SUWON" : 
			$("#tabs li").removeClass("active");
			$("#su").addClass("active");
			break;
		case "DAEGU" : 
			$("#tabs li").removeClass("active");
			$("#dae").addClass("active");
			break;
		case "BUSAN" : 
			$("#tabs li").removeClass("active");
			$("#bu").addClass("active");
			break;
		case "CHUNGCHEONG" : 
			$("#tabs li").removeClass("active");
			$("#chung").addClass("active");
			break;
		case "GWANGJU" : 
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
        
        
<!-- ==== FOOTER START ==== -->
	<c:import url ="../../common/footer.jsp"/>
<!-- ==== FOOTER END ==== -->

	<script type="text/javascript">
	
		
			
		/* $('.ploc').click(function(){
			
			var active = $('.active');
			active.removeClass('active');
			this.addClass('active');
		})	; */
		
		/* <button onclick="searchBoard();">검색하기</button>
		<script type="text/javascript"> */
		function searchBoard(){
			var searchCondition = $("#searchCondition").val(); // searchCondition:  작성자, 제목, 내용
			var searchValue = $("#searchValue").val(); 		   // searchValue : 검색한 내용
			
			location.href="bsearch.rm?searchCondition="+searchCondition+"&searchValue="+searchValue;
		} 

	</script>

</body>
</html>