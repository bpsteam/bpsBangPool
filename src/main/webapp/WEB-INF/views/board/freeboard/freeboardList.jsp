<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방풀 - 자유게시판</title>


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
                                <div class="tab-pane fade in active" id="housemate">
                                        <h1><small>자유게시판</small></h1>
                                        <div class="margin-bottom-10">
                                                <hr>
                                        </div>

							<form action="blist.hm">
								<div class="tabs alternative">
									<ul class="nav nav-tabs" id="tabs">
										<li id="all">
											<a>전체</a>
										</li>
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
																	<th>제목</th>
																	<th>작성자</th>
																	<th>날짜</th>
																	<th>조회수</th>
																</tr>
															</thead>
															<tbody>
																<c:forEach var="b" items="${ list }">
																	<tr>
																		<td>${ b.frbId }</td>
																		<c:url var="hbdetail" value="frbdetail.fr">
																			<c:param name="frbId" value="${ b.frbId }" />
																		</c:url>
																		<td onclick="location.href='${ hbdetail }'" style="width:220px;">
																			<%-- <a href="${ hbdetail }">${ b.hbTitle }</a></td> --%>
																			${ b.frbTitle }
																		</td>
																		<td>${ b.frbWriter }</td>
																		<td>${ b.frbCreateDate }</td>
																		<td>${ b.frbCount }</td>
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
														<c:url var="before" value="frblist.fr">
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
														<li><c:url var="pagi" value="frblist.fr">
																<c:param name="page" value="${ p }" />
															</c:url> <a href="${ pagi }">${ p }</a></li>
													</c:if>
												</c:forEach>

												<!-- [다음] -->
												<li><c:if test="${ pi.currentPage >= pi.maxPage }">
														<a>»</a>
													</c:if> <c:if test="${ pi.currentPage < pi.maxPage }">
														<c:url var="after" value="frblist.fr">
															<c:param name="page" value="${ pi.currentPage + 1 }" />
														</c:url>
														<a href="${ after }">»</a>
													</c:if></li>


											</ul>
											<a href="#" style="float: left" class="btn btn-aqua btn-sm"
												data-toggle="modal" data-target="#searchModal"
												onclick="return false;"><i class="fa fa-search"></i></a>
											<c:if test="${ !empty loginUser }">
												<a href="freeinsertView.fr" type="button" class="btn btn-red"
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
                    <div class="modal fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                        <div class="modal-dialog modal-sm">
                            <div class="modal-content">
                                <div class="modal-body">
                                    <div class="text-center">
                                        <h4 id="myModalLabel" style="font-weight: 500; font-family: 'Roboto', sans-serif; color:unset; line-height:1.1"><i class="fa fa-search fa-lg" ></i> Search</h4>
                                    </div>
                                    <form action="hserach.hm" name="hsearch" method="get" role="form" class="form" style="margin-top:20px;">
                                        <input type="hidden" name="bo_table" value="roomate">
                                        <input type="hidden" name="sca" value="">
                                        <input type="hidden" name="sop" value="and">
                                        <div class="form-group">
                                            <label for="sfl" class="sound_only">검색대상</label>
                                            <select name="searchCondition" id="searchCondition" class="form-control input-sm">
                                                <option value="wr_subject">제목</option>
                                                <option value="wr_content">내용</option>
                                                <option value="titleNcontent">제목+내용</option>
                                                <option value="email">회원아이디</option>
                                                <option value="hbwriter">글쓴이</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="stx" class="sound_only">검색어<strong class="sound_only"> 필수</strong></label>
                                            <input type="text" name="searchValue" required id="searchValue" class="form-control input-sm" maxlength="20" placeholder="검색어">
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
                        <!-- Recent Posts -->
                        <!-- <div class="margin-bottom-10">
                            <hr>
                        </div> -->
                        <div class="panel panel-success">
                            <div class="panel-body" style="background-color: white;">
                                <!-- <a href="#"><b>룸메이트</b></a> <br>
                                <a href="#">하우스메이트</a> <br>
                                <a href="#">신입생메이트</a> -->
                                <ul class="nav nav-pills nav-stacked">
                                        <li class="active">
                                            <a href="#roommate" data-toggle="tab">
                                                <i class="fa fa-cloud"></i>  룸메이트</a>
                                        </li>
                                        <li>
                                            <a href="#housemate" data-toggle="tab">
                                                <i class="fa fa-home"></i>  하우스메이트</a>
                                        </li>
                                        <li>
                                            <a href="#freshmanmate" data-toggle="tab">
                                                <i class="fa fa-comments"></i>  신입생메이트</a>
                                        </li>
                                        
                                    </ul>
                            </div>
                        </div>
                        <div class="margin-bottom-10">
                            <hr>
                        </div>
        
                        <div class="panel panel-aqua">
                            <!-- 이슈 시작-->
                           <div class="panel-heading">
                                <a href="blist.rm" style="color:white">
                                    <span class="pull-right lightgray font-16 en">+</span>
                                    <span class="div-title-underbar-bold border-navy font-16 en" >
                                        <b>공지사항</b>
                                    </span>
                                </a>
                            </div>
                            <div class="widget-box panel-body">
                                <div class="basic-post-list ">
                                	<c:import url ="../../common/noticeTopList.jsp"/>
                                </div>
                            </div>
                            <!-- 이슈 끝-->
                        </div>
                        <!-- End recent Posts -->
                        <!-- 공지사항 -->
                        <%-- <div class="panel panel-green">
                               <!-- 뉴스 시작 -->
                               <div class="panel-heading">
                                   <a href="frblist.fr" style="color:white">
                                       <span class="pull-right lightgray font-16 en">+</span>
                                       <span class="div-title-underbar-bold border-navy font-16 en">
                                           <b>자유게시판</b>
                                       </span>
                                   </a>
                               </div>
                               <div class="widget-box panel-body">
                                   <div class="basic-post-list ">
                                   	<c:import url="../../common/freeTopList.jsp"/>
                               	</div>
                           	</div>
                       	</div> --%>
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
        
        
<!-- ==== FOOTER START ==== -->
	<c:import url ="../../common/footer.jsp"/>
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