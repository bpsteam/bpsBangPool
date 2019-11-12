<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
    <!--<![endif]-->
    <head>
        <!-- Title -->
        <title>중고 이케요</title>

        <style>
            h6{color:black}

            li {
                list-style: none;
            }

            .goods_pick_list .pick_list_box .pick_list {
                /* display: inline-block; */
                float: left;
                padding: 0;
            }

            .goods_pick_list .pick_list_box .pick_list li {
                float: left;
                text-align: center;
                width: 124px;
                margin: 0;
                padding: 0;
                height: 48px;
                line-height: 48px;
                background: #fff;
                position: relative;
                border: 1px solid #d2d2d2;
                /* border-bottom: 2px solid #919191; */
                margin-right: -1px;
            }
            
            #buttonTab{border-left: hidden; border-right: hidden;}

        </style>

        <!-- Meta -->
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="description" content="">
        <meta name="author" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <!-- Favicon -->
        <link href="favicon.ico" rel="shortcut icon">
        <!-- Bootstrap Core CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.css" rel="stylesheet">
        <!-- Template CSS -->
        <link rel="stylesheet" href="assets/css/animate.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/font-awesome.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/nexus.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/responsive.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/custom.css" rel="stylesheet">
        <!-- Google Fonts-->
        <link href="http://fonts.googleapis.com/css?family=Roboto+Condensed:400,300" rel="stylesheet" type="text/css">
    </head>
    <body>
    
    <!-- ==== HEADER START ==== -->
	<c:import url ="../common/header.jsp"/>
	<!-- ==== HEADER END ==== -->
    <!-- === BEGIN CONTENT === -->
            <div id="content">
                <div class="container background-white">
                    <div class="row margin-vert-30" style="margin-bottom: -10px;">
                        <div class="col-md-12">
                            <h3>중고 이케요</h3><br>
                            <!-- Filter Buttons -->
                            <div class="goods_pick_list"> <!-- <span class="pick_list_num">상품 <strong>232</strong> 개</span> -->
                                


                                <div class="pick_list_box">                
                                  <ul class="pick_list" style="width: 1000px; border-bottom: 2px solid #919191;">
                                    <li class="">
                                       <a href="shblistView.se">전체</a>
                                    </li>
                                    <li class="">
                                      <a href="sofa.se">소파</a>
                                    </li>
                                    <li class="">
                                      <a href="makeup.se">화장대</a>
                                    </li>
                                    <li class="">
                                      <a href="desk.se">책상</a>
                                    </li>
                                    <li class="">
                                      <a href="table.se">식탁</a>
                                    </li>
                                    <li class="">
                                      <a href="display.se">장식장</a>
                                    </li>
                                  </ul>
                  
                                  <div class="choice_num_view">                 
                                  </div>
                                </div>
                            </div>



                            <!-- <div class="portfolio-filter-container margin-top-20">
                                <ul class="portfolio-filter">
                                    <li class="portfolio-filter-label label label-primary">
                                        &nbsp;&nbsp;&nbsp;정렬&nbsp;&nbsp;&nbsp;
                                    </li>
                                    <li>
                                        <a href="#" class="portfolio-selected btn btn-default" data-filter="*">침대</a>
                                    </li>
                                    <li>
                                        <a href="#" class="btn btn-default" data-filter=".code">소파</a>
                                    </li>
                                    <li>
                                        <a href="#" class="btn btn-default" data-filter=".design">거실장</a>
                                    </li>
                                    <li>
                                        <a href="#" class="btn btn-default" data-filter=".audio">책상</a>
                                    </li>
                                    <li>
                                        <a href="#" class="btn btn-default" data-filter=".video">화장대</a>
                                    </li>
                                </ul>
                            </div> -->
                            <!-- End Filter Buttons -->
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 portfolio-group no-padding">
                            <!-- Portfolio Item -->
                            <c:forEach var="shb" items="${ list }">
                                <div class="col-md-4 portfolio-item margin-bottom-40 video">
								<c:url var="shbDetail" value="shbdetail.se">
									<c:param name="shbId" value="${ shb.shbId }"/>
									<c:param name="page" value="${ pi.currentPage }"/>
								</c:url>
                                    <a href="${ shbDetail }">
                                        <figure>
                                            <img src="${ contextPath }/resources/buploadFiles/${ shb.shbRenameFileName }" alt="image1" style="width: 400px; height: 200px;">
                                            <figcaption>
                                                <h3 class="margin-top-20">${ shb.shbTitle }</h3><br>
                                                <div class="project-item__stats" style="align-content: right;">
                                                    <span class="project-item__stats__item">${ shb.shbPrice } 원</span><br>
                                                    <span class="project-item__stats__dot"></span>
                                                    <span class="project-item__stats__item">조회수 ${ shb.shbCount }</span>
                                                </div>
                                            </figcaption>
                                        </figure>
                                        <h6 style="display: none;">${ shb.shbId }</h6>
                                        <h6 class="project-item__cover__title">${ shb.shbTitle }</h6>
                                        <div>
                                            <div class="item_money_box">
                                                <strong class="item_price" style="color: #aa6868;">
                                                	<span>${ shb.shbPrice }</span>
                                                </strong>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </c:forEach>
                            </div>
                            <!-- End Portfolio Item -->
                    </div>
                    <div align="center">
                    <table>
                        <tr align="center" height="20" id="buttonTab">
							<td colspan="6">
							
								<!-- [이전] -->
								<c:if test="${ pi.currentPage <= 1 }">
									[이전] &nbsp;
								</c:if>
								<c:if test="${ pi.currentPage > Tdj1 }">
									<c:url var="before" value="shblistView.se">
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
										<c:url var="pagination" value="shblistView.se">
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
									<c:url var="after" value="shblistView.se">
										<c:param name="page" value="${ pi.currentPage + 1 }"/>
									</c:url> 
									<a href="${ after }">[다음]</a>
								</c:if>
							</td>
						</tr>
					</table>
                    </div>
                    <div align="right">
                    <button class="btn btn-primary" onclick="location.href='shbinsertView.se';">글쓰기</button>
                    </div>
                    <br><br>
                </div>
            </div>
            <!-- === END CONTENT === -->
            <!-- ==== FOOTER START ==== -->
			<c:import url ="../common/footer.jsp"/>
			<!-- ==== FOOTER END ==== -->
    </body>
</html>