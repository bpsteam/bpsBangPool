<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- ==== HEADER START ==== -->
	<c:import url ="../common/header.jsp"/>
<!-- ==== HEADER END ==== -->

       <!-- === BEGIN CONTENT === -->
        <div id="content">
            <div class="container background-white">
                <div class="row margin-vert-30">
                    <!-- Main Column -->
                    <div class="col-md-9">
                        <!-- Blog Post -->
                        <div class="blog-post padding-bottom-20">
                            <!-- Blog Item Header -->
                            <div class="blog-item-header">
                                <!-- Title -->
                                <h2>
                                    <a href="#">
                                        주문 / 결제</a>
                                </h2>
                                <br> 
                                <!-- Date -->
                                <div class="blog-post-date">
                                    <a href="#">22nd Oct, 2019</a>
                                </div>
                                <!-- End Date -->


                            </div>
                            <!-- End Title -->

                            <!-- 내가추가!! -->
                            <h4>주문상품</h4>
                            <blockquote class="primary">
                                <div class="row">
                                    <div class="col-md-2">
                                        <img class="pull-left"
                                            src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1499669180508_Z9OlLq8j.jpg/240/240"
                                            alt="filler image">
                                    </div>
                                    <div class="col-md-10">
                                        <p><em>[브리츠]휴대용 블루투스 스피커(라디오) BA-C1</em></p>
                                        <small>54,900
                                            <cite title="Source Title">원</cite>
                                        </small>
                                    </div>
                                </div>
                            </blockquote>
                            <blockquote class="primary">
                                <div class="row">
                                    <div class="col-md-2">
                                        <img class="pull-left"
                                            src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-157164394038733839.jpg/240/240"
                                            alt="filler image">
                                    </div>
                                    <div class="col-md-10">
                                        <p><em>[벨레][오늘의딜]멜로우 Mellow 우드 블루투스 스키퍼 테이블 W501T + 핸드폰거치대 증정(선착순)</em></p>
                                        <small>329,000
                                            <cite title="Source Title">원</cite>
                                        </small>
                                    </div>
                                </div>
                            </blockquote>



                            <br>
                            <h4>배송지</h4>
                            <div class="panel panel-default">
                               

                                <div class="panel-body">
                                    <form name="fwrite" id="fwrite"
                                        action="http://myroom.oceanmate.co.kr/bbs/write_update.php"
                                        onsubmit="return fwrite_submit(this);" method="post"
                                        enctype="multipart/form-data" autocomplete="off" role="form"
                                        class="form-horizontal">

                                        <div class="form-group has-feedback">
                                            <label class="col-sm-2 control-label" for="wr_name"><strong
                                                    class="sound_only">받는분</strong></label>
                                            <div class="col-sm-3">
                                                <input type="text" name="wr_name" value="" id="wr_name" required=""
                                                    class="form-control input-sm" size="10" maxlength="20">
                                            </div>
                                        </div>

                                        <div class="form-group has-feedback">
                                            <label class="col-sm-2 control-label" for="wr_password"><strong
                                                    class="sound_only">우편번호</strong></label>
                                            <div class="col-sm-3">
                                                <input type="password" name="wr_password" id="wr_password" required=""
                                                    class="form-control input-sm" maxlength="20">
                                            </div>
                                            <div class="col-sm-3" style="padding-left: 0;">
                                                <button class="carted-product__edit-btn" type="button">우편번호 검색</button>
                                            </div>

                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label" for="wr_email">주소</label>
                                            <div class="col-sm-10">
                                                <input type="text" name="wr_email" id="wr_email" value=""
                                                    class="form-control input-sm email" size="50" maxlength="100"
                                                    style="margin-bottom: 5px;">

                                                <input type="text" name="wr_email" id="wr_email" value=""
                                                    class="form-control input-sm email" size="50" maxlength="100">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label" for="wr_homepage">휴대전화</label>
                                            <div class="col-sm-6">
                                                <input type="text" name="wr_homepage" id="wr_homepage" value=""
                                                    class="form-control input-sm" size="50">
                                            </div>
                                        </div>



                                        <div class="form-group">
                                            <label class="col-sm-2 control-label" for="wr_subject"><strong
                                                    class="sound_only">배송메모</strong></label>
                                            <div class="col-sm-10">
                                                <textarea id="wr_content" name="wr_content"
                                                    class="form-control input-sm write-content" maxlength="65536"
                                                    style="width:100%;height:100px"></textarea>
                                            </div>
                                        </div>

                                    </form>
                                </div>
                            </div>

                            <br>
                            <h4>주문자</h4>
                            <div class="panel panel-default">
                                

                                <div class="panel-body">
                                    <form name="fwrite" id="fwrite"
                                        action="http://myroom.oceanmate.co.kr/bbs/write_update.php"
                                        onsubmit="return fwrite_submit(this);" method="post"
                                        enctype="multipart/form-data" autocomplete="off" role="form"
                                        class="form-horizontal">

                                        <div class="form-group has-feedback">
                                            <label class="col-sm-2 control-label" for="wr_name"><strong
                                                    class="sound_only">이름</strong></label>
                                            <div class="col-sm-3">
                                                <input type="text" name="wr_name" value="" id="wr_name" required=""
                                                    class="form-control input-sm" size="10" maxlength="20">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label" for="wr_email">이메일</label>
                                            <div class="col-sm-6">
                                                <input type="text" name="wr_email" id="wr_email" value=""
                                                    class="form-control input-sm email" size="50" maxlength="100">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label" for="wr_email">휴대전화</label>
                                            <div class="col-sm-6">
                                                <input type="text" name="wr_email" id="wr_email" value=""
                                                    class="form-control input-sm email" size="50" maxlength="100">
                                            </div>
                                        </div>

                                    </form>
                                </div>
                            </div>




                        <br><br>
                        <!-- End Blog Item -->
                        <!-- Blog Post -->
                        <div class="blog-post padding-bottom-20">
                            <!-- Blog Item Header -->
                            <hr>
                            <div class="blog-item-header">
                                <!-- Title -->
                                <h2>
                                    최종 결제 금액
                                </h2>
                                <!-- End Title -->
                            </div>
                            <!-- End Blog Item Header -->


                            <!-- Blog Item Body -->
                       
                                    <div class="panel panel-default">
                                        <!-- <div class="panel-heading">
                                            <h3 class="panel-title">Default Panel</h3>
                                        </div> -->
                                    
                                        <div class="panel-body">

                                            <div class="sticky-child commerce-cart__side-bar" style="position: relative;">
                                                <dl class="commerce-cart__summary commerce-cart__side-bar__summary">
                                                    <div class="commerce-cart__summary" style="margin: auto" >
                                                        <dt style="float:left; width:50%;">총 상품금액</dt>
                                                        <dd style="text-align: right;">389,000원</dd>
                                                        <br>
                                                    </div>
                                                    <div class="commerce-cart__summary__row">
                                                        <dt style="float:left; width:50%;">총 배송비</dt>
                                                        <dt style="text-align: right;">+ <span class="number">0</span>원</dt>
                                                        <br>
                                                    </div>
                                                    <div class="commerce-cart__summary__row">
                                                        <dt style="float:left; width:50%;">총 할인금액</dt>
                                                        <dd style="text-align: right; ">- <span class="number">210,000</span>원</dd>
                                                        <br>
                                                    </div>
                                                    <div class="commerce-cart__summary__row commerce-cart__summary__row--total">
                                                        <dt style="float:left; width:50%; vertical-align:text-bottom; ">결제금액</dt>
                                                        <dd style="text-align: right; font-size: 20px; color: black;"><span class="number">179,000</span>원</dd>
                                                    </div>
                                                </dl>
                                                </div>
                                    
                                        </div>
                                    </div>

                                    <div id="do_payment" class="btn btn-primary" style="max-width: 100%;">결제하기</div>

                                   
                                    <!-- Read More -->
                                    <a href="#" class="btn btn-primary">
                                        Read More
                                        <i class="icon-chevron-right readmore-icon"></i>
                                    </a>
                                    <!-- End Read More -->
                             


                        </div>
                        <!-- End Blog Item Body -->
                    </div>
                    <!-- End Blog Item -->


                </div>
                <!-- End Main Column -->

                <!-- Side Column -->
                <div class="col-md-3">
                   <br><br>
                    <!-- Recent Posts -->
                    <div class="recent-posts">
                        <h3>최근 본 상품</h3>
                        <ul class="posts-list margin-top-10">
                            <li>
                                <div class="recent-post">
                                    <a href="">
                                        <img class="pull-left" src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-156885722036292396.jpg/70/70" alt="thumb1">
                                    </a>
                                    <a href="#" class="posts-list-title">[바자르] [단독컬러] 모노 멜란지 침구세트</a>
                                    <br>
                                    <span class="recent-post-date">
                                        July 30, 2013
                                    </span>
                                </div>
                                <div class="clearfix"></div>
                            </li>
                            <li>
                                <div class="recent-post">
                                    <a href="">
                                        <img class="pull-left" src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-156885722036292396.jpg/70/70" alt="thumb1">
                                    </a>
                                    <a href="#" class="posts-list-title">[바자르] [단독컬러] 모노 멜란지 침구세트</a>
                                    <br>
                                    <span class="recent-post-date">
                                        July 30, 2013
                                    </span>
                                </div>
                                <div class="clearfix"></div>
                            </li>
                            <li>
                                <div class="recent-post">
                                    <a href="">
                                        <img class="pull-left" src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-156885722036292396.jpg/70/70" alt="thumb1">
                                    </a>
                                    <a href="#" class="posts-list-title">[바자르] [단독컬러] 모노 멜란지 침구세트</a>
                                    <br>
                                    <span class="recent-post-date">
                                        July 30, 2013
                                    </span>
                                </div>
                                <div class="clearfix"></div>
                            </li>
                           
                        </ul>
                    </div>
                    <!-- End Recent Posts -->
                     <!-- Blog Tags -->
                     <div class="blog-tags">
                            <h3>Tags</h3>
                            <ul class="blog-tags">
                                <li>
                                    <a href="#" class="blog-tag">HTML</a>
                                </li>
                                <li>
                                    <a href="#" class="blog-tag">CSS</a>
                                </li>
                                <li>
                                    <a href="#" class="blog-tag">JavaScript</a>
                                </li>
                                <li>
                                    <a href="#" class="blog-tag">jQuery</a>
                                </li>
                                <li>
                                    <a href="#" class="blog-tag">PHP</a>
                                </li>
                                <li>
                                    <a href="#" class="blog-tag">Ruby</a>
                                </li>
                                <li>
                                    <a href="#" class="blog-tag">CoffeeScript</a>
                                </li>
                                <li>
                                    <a href="#" class="blog-tag">Grunt</a>
                                </li>
                                <li>
                                    <a href="#" class="blog-tag">Bootstrap</a>
                                </li>
                                <li>
                                    <a href="#" class="blog-tag">HTML5</a>
                                </li>
                            </ul>
                        </div>
                        <!-- End Blog Tags -->

                </div>
                <!-- End Side Column -->



            </div>
        </div>
    </div>
    <!-- === END CONTENT === -->


        
<!-- ==== FOOTER START ==== -->
	<c:import url ="../common/footer.jsp"/>
<!-- ==== FOOTER END ==== -->


</body>
</html>