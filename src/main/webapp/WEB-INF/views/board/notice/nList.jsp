<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

	#search{
		position: relative;
	    height: 42px;
	    margin: 45px 0 25px;
	    border: 1px solid #e7e8ea;
	    border-radius: 2px;
	    padding-top: 5px;
	}
	#search_text{
		width: 89%;
	    height: 25px;
	    border: 0;
	    color: #000;
	    font-size: 18px;
    }
	
	.rBoard_Form{
	
		/* border:1px solid black; */
	    color: #333333;
    	/* background-color: #f4f4f4; */
   	 	border-color: #d8d8d8;
		border-bottom: 1px solid #d8d8d8;
		border-top-right-radius: 4px;
    	border-top-left-radius: 4px;
    	
	}
</style>

</head>
<body>
	<!-- ==== HEADER START ==== -->
	<c:import url ="../../common/header.jsp"/>
	<!-- ==== HEADER END ==== -->

        <div id="body-bg">
            <div id="content">
                <div id="slideshow" class="bottom-border-shadow">
                <div class="container background-grey bottom-border">
                    <div>
                    <hr>
                </div>
                <div class="margin-bottom-10">
                <div class="container background-white">
                    <div class="row margin-vert-30">
                        <!-- Main Column -->
                        <div class="col-md-9">
                        <h1>공지사항</h1>
                        <hr>
                        
                         
					 <div id="search" style="text-align: center; margin-top: 18px;">
		                 <form action="search.no">
						      <span class="fa-search"></span>
						      <select name="searchCondition" style="display:none;">
						         <option value="title">제목</option>
						         <option value="content">내용</option>
						      </select>
						      
						      <input id="search_text" name="search" id="searchValue" type="search" placeholder="도움말을 검색해 보세요.">
						      <!-- <button type="submit">검색하기</button> -->
		                  </form>
                     </div>
                     
                    
                   <div style="text-align: end;">
		               <form action="notice_insert.no">
	                          	<c:if test="${ !empty sessionScope.loginUser && loginUser.nickname == '관리자닉네임'}">
	                          		<input type="submit" class="btn btn-primary btn-sm" style="margin-bottom: 3px;" value="글쓰기"></input>
	                          	</c:if>
	                          	
						   <%-- <c:if test="${  empty sessionScope.loginUser }">
	                          		<input type="button" class="btn btn-primary btn-sm needLogin" style="margin-bottom: 3px;" value="글쓰기"></input>
	                          	</c:if> --%>
	                   </form>	
                   </div> 							
                      
                        
                    <c:forEach var="n" items="${ list }">
                    
                        <c:url var="ndelete" value="ndelete.no">
						     <c:param name="nId" value="${ n.nId }"/>
						</c:url>
                     	<c:url var="nupView" value="nupView.no">
					         <c:param name="nId" value="${ n.nId }"/>
					         <c:param name="page" value="${ pi.currentPage }"/>
					    </c:url>

                        <div class="rBoard_Form">
                        	<a class="rBoard" style="display:flex; justify-content: space-between; padding: 10px; cursor: pointer;">
                        		<h3>${ n.nTitle }</h3><span class="fa-sort-desc" style="margin-bottom: 10px;"></span>
                        	</a>
                        	
							<div class="rBoard_Content" style="display:none; margin:0px 20px 0px 20px;">
							
								<c:if test="${ n.originalFileName ne null}">
	                            	<div>첨부파일 : &nbsp;
										<a href="${ contextPath }/resources/nuploadFiles/${ n.renameFileName }" download="${ n.originalFileName }">${ n.originalFileName }</a>
									</div>
	                            </c:if>
	                            
								<p>${ n.nContent }</p>
								
								<p style="text-align:center;">
								
									<c:if test="${ !empty sessionScope.loginUser && loginUser.nickname == '관리자닉네임' }">
				                    	<button type="button" class="btn btn-red btn-sm" onclick="location.href='${ nupView }'">수정</button>
				                    	<button type="button" class="btn btn-red btn-sm" onclick="location.href='${ ndelete }'">삭제</button>
								    </c:if>
								</p>
							
							</div>
                        </div>
                    </c:forEach>
                    <br>
                    
					<table style="margin-left: 40%;">
						<tr align="center" height="20" id="buttonTab">
							<td colspan="6">
							
								<!-- [이전] -->
								<c:if test="${ pi.currentPage <= 1 }">
									[이전] &nbsp;
								</c:if>
								
								<c:if test="${ pi.currentPage > 1 }">
									<c:url var="before" value="nList.no">
										<c:param name="page" value="${ pi.currentPage - 1 }"/>
									</c:url>
									<a href="${ before }">[이전]</a> &nbsp;
								</c:if>
								
								<!-- 페이지 -->
								<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
									<c:if test="${ p eq pi.currentPage }">
										<font color="red" size="4"><b>[${ p }]</b></font>
									</c:if>
									
									<c:if test="${ p ne pi.currentPage }">
										<c:url var="pagination" value="nList.no">
											<c:param name="page" value="${ p }"/>
										</c:url>
										<a href="${ pagination }">${ p }</a> &nbsp;
									</c:if>
								</c:forEach>
								
			                                   			<!-- [다음] -->
								<c:if test="${ pi.currentPage >= pi.maxPage }">
									[다음]
								</c:if>
								<c:if test="${ pi.currentPage < pi.maxPage }">
								
								<c:url var="after" value="nList.no">
									<c:param name="page" value="${ pi.currentPage + 1 }"/>
								</c:url> 
								<a href="${ after }">[다음]</a>
								</c:if>
			                                    	</td>
						</tr>
					</table>         
                    
				
                            <%-- <div class="panel panel-default">
                                <div class="panel-heading">
                                   	 게시판
                                </div>
            					
                               	
                                <div class="panel-body" style="background-color: white;">
                                    <div class="table-responsive">
                                        <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline" role="grid">
                                            <table class="table table-striped table-hover dataTable no-footer"
                                                id="FAQ-board" >
                                                <thead>
                                                    <tr role="row">
                                                        <th class="sorting_asc" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                                            colspan="1" aria-sort="ascending"
                                                            aria-label="Number: board number"
                                                            style="width: 50px;">번호</th>
                                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                                            colspan="1" aria-label="Subject: board name"
                                                            style="width: 272px;">제목</th>
                                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                                            colspan="1" aria-label="Writer: who writer this board"
                                                            style="width: 100px;">작성자</th>
                                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                                            colspan="1" aria-label="View Counting: This board view counting"
                                                            style="width: 70px;">조회수</th>
                                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                                            colspan="1" aria-label="Attach File: This board attached file"
                                                            style="width: 90px;">첨부파일</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                
                                                    <c:forEach var="n" items="${ list }">
                                                    <tr class="gradeA even">
	                                                    <c:url var="ndetail" value="ndetail.no">
	                                                    	<c:param name="nId" value="${ n.nId }"/>
	                                                    	<c:param name="page" value="${ pi.currentPage }"/>
	                                                    </c:url>
	                                                        <td class="sorting_1">${ n.nId }</td>
	                                                        <td class="">	
	                                                        <a href="${ ndetail }">${ n.nTitle }</a>
	                                                        </td>
	                                                        <td class=" ">${ n.nWriter }</td>
	                                                        <td class="center ">${ n.nCount }</td>
	                                                        <td class="center ">
	                                                        <c:if test="${ !empty n.originalFileName }">
	                                                        	<i class="fa-book"></i>
	                                                        </c:if>
	                                                        <c:if test="${ empty n.originalFileName }">
	                                                        	<i></i>
	                                                        </c:if>
	                                                        </td>
                                                    </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                            
	                                        <div align="center">
	                                        
                                          	<form action="notice_insert.no">
			                                   <div class="col-md-3">
			                                   	<c:if test="${ !empty sessionScope.loginUser }">
			                                   		<input type="submit" class="btn btn-primary btn-sm" style="margin-bottom: 3px;" value="글쓰기"></input>
			                                   	</c:if>
			                                   	<c:if test="${  empty sessionScope.loginUser }">
			                                   		<input type="button" class="btn btn-primary btn-sm needLogin" style="margin-bottom: 3px;" value="글쓰기"></input>
			                                   	</c:if>
			                                   </div>
			                              	</form>
			                              	
                                            <form action="search.no">
											      <label>검색 조건</label>
											      <select name="searchCondition">
											         <option value="title">제목</option>
											         <option value="content">내용</option>
											      </select>
											      
											      <input name="search" id="searchValue" type="search">
											      <button type="submit">검색하기</button>
                                            </form>
                                            
										    </div>
                 							<br>
                                            
												<table style="margin-left: 40%;">
													<tr align="center" height="20" id="buttonTab">
														<td colspan="6">
														
															<!-- [이전] -->
															<c:if test="${ pi.currentPage <= 1 }">
																[이전] &nbsp;
															</c:if>
															
															<c:if test="${ pi.currentPage > 1 }">
																<c:url var="before" value="nList.no">
																	<c:param name="page" value="${ pi.currentPage - 1 }"/>
																</c:url>
																<a href="${ before }">[이전]</a> &nbsp;
															</c:if>
															
															<!-- 페이지 -->
															<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
																<c:if test="${ p eq pi.currentPage }">
																	<font color="red" size="4"><b>[${ p }]</b></font>
																</c:if>
																
																<c:if test="${ p ne pi.currentPage }">
																	<c:url var="pagination" value="nList.no">
																		<c:param name="page" value="${ p }"/>
																	</c:url>
																	<a href="${ pagination }">${ p }</a> &nbsp;
																</c:if>
															</c:forEach>
															
	                                            			<!-- [다음] -->
															<c:if test="${ pi.currentPage >= pi.maxPage }">
																[다음]
															</c:if>
															<c:if test="${ pi.currentPage < pi.maxPage }">
															
															<c:url var="after" value="nList.no">
																<c:param name="page" value="${ pi.currentPage + 1 }"/>
															</c:url> 
															<a href="${ after }">[다음]</a>
															</c:if>
		                                            	</td>
													</tr>
												</table>
                                        </div>
                                    </div>
                                </div>
                            </div> --%>
                            <!--End Advanced Tables -->
                        </div>
                        <!-- End Main Column -->
                        <!-- Side Column -->
                        <div class="col-md-3">
                            <!-- Recent Posts -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">인기 TOP 게시글</h3>
                                </div>
                                <div class="panel-body" style="height: 250px; overflow: auto;" >
                                    <ul class="posts-list margin-top-10">
                                        <li>
                                            <div class="recent-post">
                                                <a href="">
                                                    <img class="pull-left" src="${contextPath}/resources/assets/img/detailShowingImg/02.jfif" alt="thumb1">
                                                </a>
                                                <a href="#" class="posts-list-title">역삼역 자취생 방방방</a>
                                                <br>
                                                <span class="recent-post-date">
                                                    10 30, 2019
                                                </span>
                                            </div>
                                            <div class="clearfix"></div>
                                        </li>
                                        <li>
                                            <div class="recent-post">
                                                <a href="">
                                                    <img class="pull-left" src="${contextPath}/resources/assets/img/detailShowingImg/04.jfif" alt="thumb2">
                                                </a>
                                                <a href="#" class="posts-list-title">강남역 쉐어하우스를 소개.</a>
                                                <br>
                                                <span class="recent-post-date">
                                                    10 28, 2019
                                                </span>
                                            </div>
                                            <div class="clearfix"></div>
                                        </li>
                                        <li>
                                            <div class="recent-post">
                                                <a href="">
                                                    <img class="pull-left" src="${contextPath}/resources/assets/img/detailShowingImg/07.jfif" alt="thumb3">
                                                </a>
                                                <a href="#" class="posts-list-title">선릉에서 혼자 꾸미면서 살아요</a>
                                                <br>
                                                <span class="recent-post-date">
                                                    10 28, 2019
                                                </span>
                                            </div>
                                            <div class="clearfix"></div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <!-- End recent Posts -->
                            <!-- About -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">오늘의 자취 꿀팁</h3>
                                </div>
                                <div class="panel-body" style="overflow: auto;">
                                    1. 계란한판으로 맛있게 먹는 요리 <br>
                                    2. 인테리어 꾸르팁 <br>
                                    3. 쉐어하우스 잘 고르는 방법 <br>
                                    4. 동물을 키울수 있는 쉐어하우스 찾는 방법  <br>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
            </div>
  <!-- ==== FOOTER START ==== -->
	<c:import url ="../../common/footer.jsp"/>
  <!-- ==== FOOTER END ==== -->
         <script type="text/javascript">

				$('.needLogin').click(function(){
					  alert("로그인이 필요한 서비스입니다.");
				});
				
				$(function(){
					$('.rBoard').click(function(){
					   $('.rBoard').next().hide();
					   $(this).next().toggle(175);
					});
				});
		</script>


    </body>
</html>