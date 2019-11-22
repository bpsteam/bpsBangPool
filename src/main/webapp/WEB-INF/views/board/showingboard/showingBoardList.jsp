<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix ="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
    <body>
        <!-- ==== HEADER START ==== -->
    	<c:import url ="../../common/header.jsp"/>
    	<!-- ==== HEADER END ==== -->
            <!-- === BEGIN CONTENT === -->
            <div id="content">
                <div class="container background-white">
                    <div class="row margin-vert-30">
                        <div class="col-md-12">
                            <h2><b>자랑하기 게시판</b></h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 portfolio-group no-padding">
                            <!-- Start showing board -->
                            <c:forEach var="sb" items="${ list }">
                            	<c:if test="${ !empty loginUser }">
									<div class="col-md-4 portfolio-item margin-bottom-40 video">
			                            <div>
			                                <a onclick="href='ddetailShowing.sb?sbId='+${ sb.sbid }+'&page='+${pi.currentPage}"> 
			                                    <figure style="border-radius:0.5em">
			                                    	<input name="sbId" value="${ sb.sbid }" style="display:none"/>
			                                    	<c:set var="fileSplit" value="${fn:split(sb.renameFileName,',')}"></c:set>
                                       				<img src="${contextPath}/resources/showinguploadFiles/${ fileSplit[0] }" style="border-radius: 0.5em;" alt="imagee" style="border-radius:0.2em" id="mainImg">
			                                        <figcaption>
			                                            <h3 class="margin-top-20">${ sb.sbtitle }</h3>
			                                            <span>${ sb.sbcontent }</span>
			                                        </figcaption>
			                                    </figure>
			                                </a>
			                            </div>
			                            <span class="pull-center" style="padding-top:10px;"><b>${ sb.sbtitle }</b></span><br>
			                            <span>
				                            <span class="pull-left" style="padding-left:10px; color:#33747a;">${ sb.sbwriter }</span>
				                            <span class="pull-right" style="padding-right:10px;">${ sb.sbcount }</span>
				                            <i class="glyphicon glyphicon-eye-open pull-right" style="padding-top:4px; padding-right:4px;"></i>
			                            </span>
		                            </div>
                            	</c:if>
                            </c:forEach>
                            <!-- End showing board -->
                        </div>
                      	<button class="btn btn-primary btn-lg pull-right" onclick="location.href='binsertShowing.sb'">글쓰기</button>
                    </div>
                    <!-- start paging part -->
                    <div class="text-center">
                        <ul class="pagination">
                            <li>
                            <!-- [이전] -->
								<c:if test="${ pi.currentPage <= 1 }">
									<a style="cursor:pointer">&laquo;</a>
								</c:if>
								<c:if test="${ pi.currentPage > 1 }">
									<c:url var="before" value="bShowing.sb">
										<c:param name="page" value="${ pi.currentPage - 1 }"/>
									</c:url>
									<a href="${ before }">&laquo;</a>
								</c:if>
							</li>
							<!-- page -->
							<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
								<c:if test="${ p eq pi.currentPage }">
									<li class="active"><a>${ p }</a><li>
								</c:if>
								<c:if test="${ p ne pi.currentPage }">
									<c:url var="pagination" value="bShowing.sb">
										<c:param name="page" value="${ p }"/>
									</c:url>
									<li><a href="${ pagination }">${ p }</a></li>
								</c:if>
							</c:forEach>
                           	<li>
							<!-- [다음] -->                          
							   	<c:if test="${ pi.currentPage >= pi.maxPage }">
								<a  style="cursor:pointer">&raquo;</a>
								</c:if>
								<c:if test="${ pi.currentPage < pi.maxPage }">
									<c:url var="after" value="bShowing.sb">
										<c:param name="page" value="${ pi.currentPage + 1 }"/>
									</c:url> 
									<li><a href="${ after }">&raquo;</a></li>
								</c:if>
							</li>
                        </ul>
                     </div>
                     <!-- end paging part -->
                </div>
            </div>
			<!-- end sbBoard id method get -->
            <!-- === END CONTENT === -->
            <!-- === BEGIN FOOTER === -->
            <c:import url ="../../common/footer.jsp"/>
            <!-- === END FOOTER === -->
    </body>
</html>
