<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- === BEGIN HEADER === -->
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->

<head>
    <!-- Title -->
    <title>중고판매</title>
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


    <style>
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

        .table tbody tr {
            border-bottom: 1px solid #dddddd;
        }

        #form label {
            margin-top: 5px;
        }
    </style>


</head>

<body>
    <c:import url="../../common/header.jsp"/>
        <!-- === BEGIN CONTENT === -->


        <div id="content">

                <div class="margin-bottom-10">
                        <hr>
                    </div>

            <div class="container background-white ">

                <div class="row margin-vert-20" >
                    <!-- Main Column -->
                    <div class="col-sm-9">
                        <div class="tab-content">
                            <div class="margin-bottom-10" style="margin:0px 0px 0px;">
                                <hr style=" margin-top:0px; margin:0px 0px 0px;">
                            </div>

                            <h1 style="text-align: center;"><small>중고 이케요</small></h1>
                            <div class="margin-bottom-10">
                                <hr>
                            </div>
                            <div class="panel panel-default view-head no-attach">
                                <div class="panel-heading" style="border-bottom: none;">
                                    <div class="font-12 text-muted">
                                        <i class="fa fa-user"></i>
                                        <span class="sv_member">${ board.shbWriter }</span> <span class="hidden-xs">
                                            <span class="sp"></span>
                                            <i class="fa fa-tag"></i>
                                            ${ board.shbLocation } </span>

                                        <span class="sp"></span>
                                        <!-- <i class="fa fa-comment"></i>
                                        <b style="color:red">4</b> -->
                                        <span class="sp"></span>
                                        <i class="fa fa-eye"></i>
                                        ${ board.shbCount }
                                        <span class="pull-right">
                                            <i class="fa fa-clock-o"></i>
                                            ${ board.shbCreateDate }</span>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-brown">
                                <div class="panel-body" style="background-color: white;">
                                    <div style="width:100%;">


                                        <div
                                            style="text-align:center;background-color:#eaeaea;height:30px;width:20%;float:left;padding-top:5px;border:1px solid #dddddd;">
                                            <b>게시물 제목</b>
                                        </div>
                                        <div
                                            style="float:left;width:80%;height:30px;padding-left:20px;padding-top:5px;border:1px solid #dddddd;">
                                            <font color="006699"><b>${ board.shbTitle }</b></font>
                                        </div>
                                        <div style="both:clear;">
                                        </div>

                                        <div
                                            style="text-align:center;background-color:#eaeaea;height:30px;width:20%;float:left;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            <b>작성자</b>
                                        </div>
                                        <div
                                            style="float:left;width:30%;height:30px;padding-left:20px;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            ${ board.shbWriter }</div>
                                        <div
                                            style="text-align:center;background-color:#eaeaea;height:30px;width:20%;float:left;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            <b>작성일자</b>
                                        </div>
                                        <div
                                            style="float:left;width:30%;height:30px;padding-left:20px;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            ${ board.shbCreateDate }</div>
                                        <div style="both:clear;">
                                        </div>

                                        <div
                                            style="text-align:center;background-color:#eaeaea;height:30px;width:20%;float:left;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            <b>지역</b>
                                        </div>
                                        <div
                                            style="float:left;width:30%;height:30px;padding-left:20px;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            ${ board.shbLocation }</div>
                                        <div
                                            style="text-align:center;background-color:#eaeaea;height:30px;width:20%;float:left;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            <b>조회건수</b>
                                        </div>
                                        <div
                                            style="float:left;width:30%;height:30px;padding-left:20px;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            ${ board.shbCount }
                                        </div>
                                        <div
                                            style="text-align:center;background-color:#eaeaea;height:30px;width:20%;float:left;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            <b>카테고리</b>
                                        </div>
                                        <div
                                            style="float:left;width:30%;height:30px;padding-left:20px;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            ${ board.shbCategory }</div>
                                        <div style="both:clear;">
                                        </div>
                                        <div
                                            style="text-align:center;background-color:#eaeaea;height:30px;width:20%;float:left;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            <b>가격</b>
                                        </div>
                                        <div
                                            style="float:left;width:30%;height:30px;padding-left:20px;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            ${ board.shbPrice }</div>
                                        <div style="both:clear;">
                                        </div>
                                    </div>

                                    <div class="view-content" style="padding:0px 15px 20px; margin-top:200px">
                                        ${ board.shbContent }<br><br><hr>
                                        <img src="${ contextPath }/resources/buploadFiles/${ board.shbRenameFileName }" alt="image1" style="width: 100%; height: 100%;">
                                    </div>
                                    <hr>

                                    <div class="print-hide view-icon">
                                        <div class="pull-right">
                                            <div class="form-group">
                                                <button onclick="apms_print();" class="btn btn-blue btn-xs"><i
                                                        class="fa fa-print"></i> <span
                                                        class="hidden-xs">프린트</span></button>
                                                <button onclick="apms_shingo('house', '7156');"
                                                    class="btn btn-red btn-xs"><i class="fa fa-bell"></i> <span
                                                        class="hidden-xs">신고</span></button>
                                            </div>
                                        </div>
                                        <div class="pull-left">
                                            <div class="form-group">
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="margin-bottom-10">
                                        <hr style="margin:0px; height:10px">
                                    </div>
                                    <br>
                                    <h3 class="view-comment">Comments</h3>
                                    <br>
                                    <div class="row">
                                        <!-- Testimonials - Default Full Width -->
                                        <div class="col-md-12">
                                            <div class="carousel slide testimonials" id="testimonials1">
                                            <c:forEach var="rp" items="${ reply }">
	                                                <div class=" col-md-12">
	                                                    <p>
	                                                    ${ rp.rContent }
	                                                    </p>
	                                                    <div class="testimonial-info">
	                                                        <i class="fa fa-user"></i>
	                                                        <span class="testimonial-author">
	                                                          ${ rp.rWriter }
	                                                            <em>
	                                                                ${ rp.rCreateDate }
	                                                            <div align="right">
	                                                            <c:if test="${ loginUser.nickname eq rp.rWriter }">
	                                                            	<form action="deleteReply.se">
	                                                            	<input type="hidden" value="${ rp.refbId }" name="shbId">
	                                                            	<input name="rId" value="${ rp.rId }" style="display:none;">
	                                                            	<input type="hidden" value="${ page }" name="page3">
	                                                        		<button class="btn btn-primary btn-sm" align="right">삭제</button>
	                                                        		</form>
	                                                        	</c:if>
	                                                        	</div>
	                                                            </em>
	                                                        </span>
	                                                    </div>
	                                                    <br>
	                                                </div>
	                                       </c:forEach>

                                                </div>
                                            </div>
                                            <!-- <div class="testimonials-arrows pull-right">
                                                <a class="left" href="#testimonials1" data-slide="prev">
                                                    <span class="fa fa-arrow-left"></span>
                                                </a>
                                                <a class="right" href="#testimonials1" data-slide="next">
                                                    <span class="fa fa-arrow-right"></span>
                                                </a>
                                                <div class="clearfix"></div>
                                            </div> -->
                                        <!-- </div> -->
                                        <!-- End Testimonials - default full width -->
                                    </div>
                                    
                                    <div class="margin-bottom-10">
                                        <hr style="margin:0px; height:10px">
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-3"style="text-align: center;">
                                            <label >댓글 입력</label>
                                        </div>
										<form action="addReply.se">
                                        <div class="col-sm-9">
                                        	<input type="hidden" value="${ page }" name="page2">
                                        	<input type="text" value="${ loginUser.nickname }" name="rWriter" style="display: none;">
                                        	<input style="display: none;" name="refbId" value="${ board.shbId }">  	
                                            <input name="rContent" type="text" style="width:80%">
                                            &nbsp;&nbsp;&nbsp;
                                            <button class="btn btn-primary btn-sm">추가</button>
                                        </div>
                                        </form>
                                        <%-- <form action="">
                                        	<input type="hidden" value="${ page }" name="page2">
                                        	<input type="text" value="${ loginUser.nickname }" name="rWriter" style="display: none;">
                                        	<input style="display: none;" name="refbId" value="${ board.shbId }">  	
                                            <input name="rContent" type="text" style="width:80%">
                                            &nbsp;&nbsp;&nbsp;
                                            <button class="btn btn-primary btn-sm">삭제</button>
                                        </form> --%>
                                    </div>
                                    <div class="margin-bottom-10">
                                            <hr style="margin:0px; height:10px;">
                                        </div>
                                </div>
                                <div class="print-hide view-btn text-right"
                                    style="background-color: white; padding-right: 15px; padding-bottom: 15px;">
                                    <div class="form-group">
                                        <c:url var="shbupView" value="shbupView.se">
											<c:param name="shbId" value="${ board.shbId }"/>
											<c:param name="page" value="${ page }"/>
										</c:url>
										<c:url var="shbdelete" value="shbdelete.se">
											<c:param name="shbId" value="${ board.shbId }"/>
										</c:url>
										<%-- <c:url var="shblist" value="shblistView.se">
											<c:param name="page" value="${ page }"/>
										</c:url> --%>
										
										<c:if test="${ loginUser.nickname eq board.shbWriter }">
                                        <a href="${ shbupView }" class="btn btn-warning btn-sm" >
                                            <i class="fa fa-plus"></i><span class="hidden-xs"> 수정</span>
                                        </a>
                                        <a href="${ shbdelete }" class="btn btn-danger btn-sm" >
                                            <i class="fa fa-times"></i><span class="hidden-xs"> 삭제</span>
                                        </a>
                                        </c:if>
                                        <a href="shblistView.se" class="btn btn-success btn-sm">
                                            <i class="fa fa-bars"></i><span class="hidden-xs"> 목록</span>
                                        </a>
                                        
                                        <a href="shbinsertView.se" class="btn btn-info btn-sm">
                                           <i class="fa fa-pencil"></i><span class="hidden-xs"> 글쓰기</span>
                                        </a>

                                    </div>
                                </div>

                            </div>

                        </div>

                    </div>

                    <!-- End Main Column -->
                    <!-- Side Column -->
                    <div class="col-md-3">
                        <!-- Recent Posts -->
                        <!-- <div class="margin-bottom-10">
                            <hr>
                        </div> -->
                        <!-- <div class="panel panel-success">
                            <div class="panel-body" style="background-color: white;">
                                
                                <ul class="nav nav-pills nav-stacked">
                                    <li class="active">
                                        <a href="#sample-3a" data-toggle="tab">
                                            <i class="fa fa-cloud"></i> 룸메이트</a>
                                    </li>
                                    <li>
                                        <a href="#sample-3b" data-toggle="tab">
                                            <i class="fa fa-home"></i> 하우스메이트</a>
                                    </li>
                                    <li>
                                        <a href="#sample-3c" data-toggle="tab">
                                            <i class="fa fa-comments"></i> 신입생메이트</a>
                                    </li>

                                </ul>
                            </div>
                        </div> -->
                        <!-- <div class="margin-bottom-10">
                            <hr>
                        </div> -->

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
                        <div class="margin-bottom-10">
                            <hr>
                        </div>
                        <!-- 공지사항 -->
                        <div class="panel panel-green">
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
                       	</div>
                        <!-- End 공지사항 -->
                    </div>
                </div>
                <!-- End Side Column -->
            </div>
        </div>

        <div class="margin-bottom-30">
            <hr>
        </div>
        
        

    </div>
    <!-- === END CONTENT === -->
    <!-- === BEGIN FOOTER === -->
    <c:import url ="../../common/footer.jsp"/>
    <!-- End Footer -->
    <!-- JS -->
    <script type="text/javascript" src="assets/js/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="assets/js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="assets/js/scripts.js"></script>
    <!-- Isotope - Portfolio Sorting -->
    <script type="text/javascript" src="assets/js/jquery.isotope.js" type="text/javascript"></script>
    <!-- Mobile Menu - Slicknav -->
    <script type="text/javascript" src="assets/js/jquery.slicknav.js" type="text/javascript"></script>
    <!-- Animate on Scroll-->
    <script type="text/javascript" src="assets/js/jquery.visible.js" charset="utf-8"></script>
    <!-- Sticky Div -->
    <script type="text/javascript" src="assets/js/jquery.sticky.js" charset="utf-8"></script>
    <!-- Slimbox2-->
    <script type="text/javascript" src="assets/js/slimbox2.js" charset="utf-8"></script>
    <!-- Modernizr -->
    <script src="assets/js/modernizr.custom.js" type="text/javascript"></script>





    <!-- End JS -->




</body>

</html>
<!-- === END FOOTER === -->