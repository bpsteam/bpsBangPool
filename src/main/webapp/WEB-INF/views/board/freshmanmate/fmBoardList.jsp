<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신입생 메이트 게시판</title>


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
                                
                                <div class="tab-pane fade in active" id="freshman">
                                        <h1><small>FRESHMAN MATE</small></h1>
                                        <div class="margin-bottom-10">
                                                <hr>
                                            </div>
                                        <div class="tabs alternative" >
                                                <ul class="nav nav-tabs" id="tabs">
                                                    <li class="active" id="jeon">
                                                        <a href="#all" data-toggle="tab">전체 </a>
                                                    </li>
                                                    <li id="seoul">
                                                        <a href="#all"  data-toggle="tab">서울 </a>
                                                    </li>
                                                    <li id="inc">
                                                        <a href="#all"  data-toggle="tab">인천/부천 </a>
                                                    </li>
                                                    <li id="su">
                                                        <a href="#all" data-toggle="tab">수원/경기 </a>
                                                    </li>
                                                    <li id="dae">
                                                        <a href="#all"  data-toggle="tab">대구/경북 </a>
                                                    </li>
                                                    <li id="bu">
                                                        <a href="#all" data-toggle="tab">부산/경남 </a>
                                                    </li>
                                                    <li id="kang">
                                                        <a href="#all"  data-toggle="tab">충청/강원 </a>
                                                    </li>
                                                    <li id="kwang">
                                                        <a href="#all"  data-toggle="tab">광주/전라</a>
                                                    </li>
                                                </ul>
                                                <div class="tab-content">
                                                    <div class="tab-pane fade in active" id="all">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="table-responsive">
                                                                    <table class="table table-hover" >
                                                                        <thead>
                                                                            <tr>
                                                                                <th style="text-align:center">No.</th>
                                                                                <th>분류</th>
                                                                                <th style="width:300px">제목</th>
                                                                                <th>작성자</th>
                                                                                <th style="text-align:center">조회수</th>
                                                                                
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody id="tbody">
                                                                        
                                                                         <c:forEach var = "b" items="${ list }">
                                                                            <tr>
                                                                                <td style="text-align:center">${ b.fbId }</td>
                                                                                <td>${ b.fLocation }</td>
                                                                                 <td align="left">
																		            <c:if test="${ !empty loginUser }">
																		               <c:url var="bdetail" value="bdetail.fm">
																		                  <c:param name="fbId" value="${ b.fbId }"/>
																		                 <%--  <c:param name="page" value="${ pi.currentPage }"/> --%>
																		               </c:url>
																		               <a href="${ bdetail }">${ b.fbTitle }</a>
																		            </c:if>
																		            <c:if test="${ empty loginUser }">
																		               ${ b.fbTitle }      
																		            </c:if>
																		         </td>
                                                                                <td>${ b.fbWriter }</td>
                                                                                <td style="text-align:center">${ b.fbCount }</td> 
                                                                            </tr>
                                                                         </c:forEach>
                                                                        
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                            
                                                    
                                                    <!--페이징처리와 버튼-->
                                                    <div class="text-center">
                                                        <ul class="pagination" id="paging">
                                                         <!-- [이전] -->
                                                            <li>
												            <c:if test="${ pi.currentPage <= 1 }">
												              <a> « </a>
												            </c:if>
												            <c:if test="${ pi.currentPage > 1 }">
												               <c:url var="before" value="blist.fm">
												                  <c:param name="page" value="${ pi.currentPage - 1 }"/>
												                  <c:param name="fLocation" value="전체"/>
												               </c:url>
                                                                <a href="${ before }">«</a>
												            </c:if>
                                                            </li>
                                                            
                                                            
                                                             
												            <!-- 페이지 -->
												            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
												               <c:if test="${ p eq pi.currentPage }">
		                                                            <li class="active">
		                                                                <a >${ p }</a>
		                                                            </li>
												               </c:if>
												               
												               <c:if test="${ p ne pi.currentPage }">
												                  <c:url var="pagination" value="blist.fm">
												                     <c:param name="page" value="${ p }"/>
												                  <c:param name="fLocation" value="전체"/>
												                  </c:url>
		                                                            <li>
		                                                                <a href="${ pagination }">${ p }</a>
		                                                            </li>
												               </c:if>
												            </c:forEach>
                                                            
                                                              <!-- [다음] -->
                                                            <li>
													            <c:if test="${ pi.currentPage >= pi.maxPage }">
													               <a>»</a>
													            </c:if>
													            <c:if test="${ pi.currentPage < pi.maxPage }">
													               <c:url var="after" value="blist.fm">
													                  <c:param name="page" value="${ pi.currentPage + 1 }"/>
												                  <c:param name="fLocation" value="전체"/>
													               </c:url> 
                                                               		 <a href="${ after }">»</a>
													            </c:if>
                                                            </li>
                                                           
                                                        </ul>
                                                        
                                                        
                                                        <a href="#" style="float:left" class="btn btn-aqua btn-sm" data-toggle="modal" data-target="#searchModal" onclick="return false;">
                                                            <i class="fa fa-search" data-toggle="tooltip" data-placement="top" title="검색"></i></a>
                                                        
                                                        <a href="#" style="float:left; margin-left: 3px;" class="btn btn-aqua btn-sm" data-toggle="modal" data-target="#searchModal" onclick="return false;">
                                                            <i class="fa fa-building-o" data-toggle="tooltip" data-placement="top" title="학교검색"></i></a>
                                                        
                                                        <a href="insertview.fm" type="button" class="btn btn-red" style="float: right;">글쓰기</a>
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
                                    <form name="fsearch" action="bsearch.fm" method="get" role="form" class="form" style="margin-top:20px;">
                                        <div class="form-group">
                                            <label for="sfl" class="sound_only">검색대상</label>
                                            <select name="searchMethod" id="searchMethod" class="form-control input-sm">
                                                <option value="fbTitle">제목</option>
                                                <option value="fbContent">내용</option>
                                                <option value="titleNcontent">제목+내용</option>
                                                <option value="email">회원아이디</option>
                                                <option value="fbWriter">글쓴이</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="stx" class="sound_only">검색어<strong class="sound_only"> 필수</strong></label>
                                            <input type="text" name="searchword" required class="form-control input-sm" maxlength="20" placeholder="검색어">
                                        </div>
            
                                        <div class="btn-group btn-group-justified">
                                            <div class="btn-group">
                                                <button type="submit" class="btn btn-danger"><i class="fa fa-check"></i></button>
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
										console.log("if왔나");
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
													$imgtag = $("<img>").attr('src', '${ contextPath }/resources/hmBoardUploadFiles/2.JPG')
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
													$imgtag = $("<img>").attr('src', '${ contextPath }/resources/hmBoardUploadFiles/2.JPG')
																	  .width('400px').height('200px');
												} 
												/* $imgtag = $("<img>").error(function() {
																		$("<img>").attr("src","${ contextPath }/resources/hmBoardUploadFiles/2.JPG");
																	})
																	.attr('src','${ contextPath }/resources/hmBoardUploadFiles/'+data[i].renameFileName)
																	.width('400px').height('200px'); */
												
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
													$imgtag = $("<img>").attr('src', '${ contextPath }/resources/hmBoardUploadFiles/2.JPG')
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
                                        <li >
                                            <a href="blist.rm">
                                                <i class="fa fa-cloud"></i>  룸메이트</a>
                                        </li>
                                        <li>
                                            <a href="blist.hm" >
                                                <i class="fa fa-home"></i>  하우스메이트</a>
                                        </li>
                                        <li class="active">
                                            <a href="#freshman" >
                                                <i class="fa fa-comments"></i>  신입생메이트</a>
                                        </li>
                                        
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
                            <div class="panel-body" style="background-color: white; ">
                                <div class="table-responsive">
                                    <table class="table table-hover ellipsistb" >
        
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td id="ellipsistd" >공지사항입니다1ddddd</td>
                                                <td>07/19</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td id="ellipsistd">공지사항입니다2</td>
                                                <td>08/24</td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td  id="ellipsistd">공지사항입니다3</td>
                                                <td>10/20</td>
                                            </tr>
                                            <tr style="border-bottom: 1px solid #dddddd;">
                                                <td>4</td>
                                                <td  id="ellipsistd">공지사항입니다4</td>
                                                <td>11/15</td>
                                            </tr>
        
                                        </tbody>
                                    </table>
                                </div>
                                
                            </div>
                        </div>
                        <!-- End recent Posts -->
                        <!-- RecentPost -->
                        <div class="panel panel-info">
						
						      <!-- recentPost 최근 본 개시물 Import -->
						      <c:import url="../../common/recentPosts.jsp"/>
						      <!-- recentPost Import -->
                        </div>
                        <!-- End RecentPost -->
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
	<c:import url ="../../common/footer.jsp"/>
<!-- ==== FOOTER END ==== -->


<!--  SCRIPT  -->
<script>
// 탭 액티브 처리하는 코드
	$(function(){
		var location = "${ location }";
		if(location=="서울"){
		$("#tabs li").removeClass("active");
		$("#seoul").addClass("active");
		}else if(location=="인천/부천"){
		$("#tabs li").removeClass("active");
		$("#inc").addClass("active");
		}else if(location=="수원/경기"){
		$("#tabs li").removeClass("active");
		$("#su").addClass("active");
		}else if(location=="대구/경북"){
		$("#tabs li").removeClass("active");
		$("#dae").addClass("active");
		}else if(location=="부산/경남"){
		$("#tabs li").removeClass("active");
		$("#bu").addClass("active");
		}else if(location=="충청/강원"){
		$("#tabs li").removeClass("active");
		$("#kang").addClass("active");
		}else if(location=="광주/전라"){
		$("#tabs li").removeClass("active");
		$("#kwang").addClass("active");
		}else{
		$("#tabs li").removeClass("active");
		$("#jeon").addClass("active");
		}
	});


// 에이작스로 게시판 리스트 불러오기
	$("#tabs a").on("click",function(){
		var location =$(this).text();
		console.log(location);
		
		// paging 
		var currentPage="${ pi.currentPage }";
		var listCount="${ pi.listCount }";  
		var pageLimit="${ pi.pageLimit }";  
		var maxPage="${ pi.maxPage }";    
		var startPage="${ pi.startPage }";  
		var endPage="${ pi.endPage }";    
		
		var boardLimit="${ pi.boardLimit }";
		
		console.log("ajax전: " +currentPage+" "+listCount+" "+pageLimit+" "+maxPage+" "+startPage+" "+endPage+" "+boardLimit);
		
			$.ajax({
	   			url: "tablist.fm",
	   			data: {fLocation:location, currentPage:currentPage, listCount:listCount,
	   					pageLimit:pageLimit, maxPage:maxPage, startPage:startPage, 
	   					endPage:endPage, boardLimit:boardLimit
	   					},
	   			type: "post",
	   			dataType: "json",
	   			success: function(data){
   					console.log(data);
   					console.log(data.pi);
   				//	console.log("${pi}");
   				//	console.log("list 출력 : " +data);
   					
   					var $tbody;
   					var $tr;
					var $fbid;
					var $flocation;
					var $fbtitle;
					var $atag;
					var $fbWriter;
					var $fbCount;
					
					var loginUser = "${ loginUser }";
   					console.log(loginUser);
   					
	   				
	   				$tbody = $("#tbody");
	   				$tbody.html("");
	   					for(var i in data.list){
   				
	   					/* 	console.log(data.list[i]); */
   						fbId = data.list[i].fbId;
	   						/* console.log(data.list[0].currentPage); */
	   					//	console.log(data);
	   					
		   					$tr = $("<tr>");
		   					$fbid=$("<td text-align:'center'>").text(data.list[i].fbId);
		   					$flocation=$("<td>").text(data.list[i].fLocation);
		   					
		   					$fbtitle = $("<td align='left'>");
		   					if(loginUser != ""){
		   						console.log("왜 여기 타?");
		   						$atag=$("<a>").attr('href','bdetail.fm?fbId='+fbId);
		   						$atag.text(data.list[i].fbTitle);
		   						$fbtitle.append($atag);
		   					}else{
		   						$fbtitle.text(data.list[i].fbTitle);
		   					}
		   					
		   					$fbWriter=$("<td>").text(data.list[i].fbWriter);
		   					$fbCount=$("<td text-align:'center'>").text(data.list[i].fbCount);
		   					
		   					$tr.append($fbid);
		   					$tr.append($flocation);
		   					$tr.append($fbtitle);
		   					$tr.append($fbWriter);
		   					$tr.append($fbCount);
	   					
		   					$tbody.append($tr);
	   					 }
	   					
	   				// 페이징
	   				$pagingul = $("#paging");
	   				$pagingul.html("");
	   				
	   				var tt = data.pi;
	   				console.log("data.list[0] : "+tt);
	   				
	   				startPage=data.pi.startPage;
	   				currentPage=data.pi.currentPage;
	   				listCount=data.pi.listCount;  
	   				pageLimit=data.pi.pageLimit;  
	   				maxPage=data.pi.maxPage;    
	   				endPage=data.pi.endPage;    
	   				
	   				boardLimit=data.pi.boardLimit;
	   				
	   				console.log("ajax : "+currentPage+" "+listCount+" "+pageLimit+" "+maxPage+" "+startPage+" "+endPage+" "+boardLimit);
	   				
	   			
	   				$previousli = $("<li>");
	   				if(currentPage <= 1){
	   					$least=$("<a>").text("«");
	   					$previousli.append($least);
	   				}else{
	   					$previousatag = $("<a>").attr('href','blist.fm?page='+(currentPage-1)+'&fLocation='+location).text("«");
	   					$previousli.append($previousatag);
	   				}
	   				$pagingul.append($previousli);
	   				
	   				$numliactive=$("<li>").addClass("active");
	   				$numli=$("<li>");
	   			   for (var startPage ; startPage<=endPage ; startPage++){
                  	 if(startPage==currentPage){
                  		 $activepagenum = $("<a>").text(startPage);
                  		 $numliactive.append($activepagenum);
                  		 $pagingul.append($numliactive);
                  		 
                  	 }else{
                  		 $pagenum=$("<a>").attr('href','blist.fm?page='+startPage+'&fLocation='+location).text(startPage);
                  		 $numli.append($pagenum);
                  		 $pagingul.append($numli);
                  	 }
                   }
                              
             	  $nextli=$("<li>");
				  if(currentPage>=maxPage){
					  $nextatag=$("<a>").text("»");
					  $nextli.append($nextatag);
				  }else{
					  $maxatag=$("<a>").attr('href','blist.fm?page='+(currentPage+1)+'&fLocation='+location).text("»");
					  $nextli.append($maxatag);
				  }
				  
				  $pagingul.append($nextli);
				  
	   				   /* <!--페이징처리와 버튼-->
                        <div class="text-center">
                            <ul class="pagination" id="paging">
                             <!-- [이전] -->
                                <li>
					            <c:if test="${ pi.currentPage <= 1 }">
					              <a> « </a>
					            </c:if>
					            <c:if test="${ pi.currentPage > 1 }">
					               <c:url var="before" value="blist.fm">
					                  <c:param name="page" value="${ pi.currentPage - 1 }"/>
					                  <c:param name="fLocation" value="전체"/>
					               </c:url>
                                    <a href="${ before }">«</a>
					            </c:if>
                                </li>*/
                                
                  
                                 
					    /*         <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					               <c:if test="${ p eq pi.currentPage }">
                                        <li class="active">
                                            <a >${ p }</a>
                                        </li>
					               </c:if>
					               
					               <c:if test="${ p ne pi.currentPage }">
					                  <c:url var="pagination" value="blist.fm">
					                     <c:param name="page" value="${ p }"/>
					                  <c:param name="fLocation" value="전체"/>
					                  </c:url>
                                        <li>
                                            <a href="${ pagination }">${ p }</a>
                                        </li>
					               </c:if>
					            </c:forEach>*/
                       
				
		            
					 
                             /*   <li>
						            <c:if test="${ pi.currentPage >= pi.maxPage }">
						               <a>»</a>
						            </c:if>
						            <c:if test="${ pi.currentPage < pi.maxPage }">
						               <c:url var="after" value="blist.fm">
						                  <c:param name="page" value="${ pi.currentPage + 1 }"/>
					                  <c:param name="fLocation" value="전체"/>
						               </c:url> 
                                   		 <a href="${ after }">»</a>
						            </c:if>
                                </li>
                               
                            </ul> */
                            
                            
	   				},
	   				error: function(data){
	   					console.log('dpfjekdpfj!!!');
	   					console.log(data);
	   				}
	   			
	   		}); 
	   	});
	
	
	
	
	</script>
</body>
</html>