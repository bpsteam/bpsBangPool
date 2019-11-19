<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	     <!-- Title -->
  <title>방풀-홈</title>

</head>
<body>
<!-- ==== HEADER START ==== -->
	<c:import url ="common/header.jsp"/>
<!-- ==== HEADER END ==== -->

<!-- ==== BEGIN CONTENT ==== -->
    <div id="slideshow" class="bottom-border-shadow">
    	<div class="container no-padding background-white bottom-border" >
        	
<!-- ==== BEGIN ADVERTISEMENT ==== -->
	<c:import url ="common/advertisement.jsp"/>
<!-- ==== END ADVERTISEMENT ==== -->
                </div>
            </div>
            <div id="icons" class="bottom-border-shadow" >
                <div class="container background-grey bottom-border">
                    <div class="row padding-vert-60">
                        <!-- Icons -->
                        <div class="col-md-4 ">
                        <div class="panel panel-aqua">
                            <!-- 이슈 시작-->
                           <div class="panel-heading">
                                <a href="blist.rm" style="color:white">
                                    <span class="pull-right lightgray font-16 en">+</span>
                                    <span class="div-title-underbar-bold border-navy font-16 en" >
                                        <b>룸메이트</b>
                                    </span>
                                </a>
                            </div>
                            <div class="widget-box panel-body">
                                <div class="basic-post-list ">
                                        <c:import url ="common/roommateTopList.jsp"/>                                                     
                                </div>
                            </div>
                            <!-- 이슈 끝-->
                        </div>
                        </div>
                        <!-- 하우스 메이트 -->
                        <div class="col-md-4 ">
                        <div class="panel panel-aqua">
                            <!-- 뉴스 시작 -->
                            <div class="panel-heading">
                                <a href="blist.hm" style="color:white">
                                    <span class="pull-right lightgray font-16 en">+</span>
                                    <span class="div-title-underbar-bold border-navy font-16 en" >
                                        <b>하우스메이트</b>
                                    </span>
                                </a>
                            </div>
                            <div class="widget-box panel-body">
                                <div class="basic-post-list ">
                                    <ul class="post-list" style ="padding-left: 15px; width: 100%;" id="topList2">
                                    </ul>                                                         
                                </div>
                            </div>
                            
                            <script>
						        function topList2(){
									$.ajax({
										url: "topList.hm",
										dataType: "json",
										success: function(data){
											$ul = $("#topList2");
											$ul.html("");
											
											var hbWriter;
											var hbTitle;
											
											
											
											for(var i in data){
												
												$li = $('<li class="ellipsis">');
												$a = $('<a>').attr('href',"bdetail.hm?hbId="+data[i].hbId);
												$span = $('<span class="gray font-12 hahaha">');
												$span2 = $('<span class="subject_title hohoho">');
												
												
												$hbWriter = $("<b>").text(data[i].hbWriter);
												$hbTitle = $("<b>").text(decodeURIComponent(data[i].hbTitle.replace(/\+/g," ")));
												
												$li.append($a);
												$span.append($hbWriter);
												$span2.append($hbTitle);
												$a.append($span);
												$a.append($span2);
												/* $li.append($span);
												$li.append($span2); */
												$ul.append($li);
												
												
												/* var $tr = $('<span class="pull-right gray font-12">');
												var $tr2 = $('<span class="subject_title">');
												var $rbTitle = $("<b>").text(decodeURIComponent(data[i].rbTitle.replace(/\+/g," ")));
												var $rbWriter = $("<b>").text(data[i].rbWriter); */
												
												/* $tr.append($rbTitle); */
												
												/* $tr.append($rbWriter);
												$tr2.append($rbTitle);
												
												$tableBody.append($tr);
												$tableBody.append($tr2); */
											}
										}
									});
								}
								
								$(function(){
									topList2();
									
									setInterval(function(){
										topList2();
									}, 100000);
								});
							</script>
                            
                            <!-- 뉴스 끝 -->
                        </div>
                        </div>
                        <div class="col-md-4 text-center">
                            <!-- <i class="fa-bar-chart fa-4x color-primary animate fadeIn"></i>
                            <h2 class="padding-top-10 animate fadeIn">Placerat facer possim</h2>
                            <p class="animate fadeIn">Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer.</p> -->
                         <c:if test="${ empty sessionScope.loginUser}">
                                    <form class="login-page" action="login.me" method="post" id="loginForm">
                                        <div class="login-header margin-bottom-30">
                                            <h2>LOGIN</h2>
                                        </div>
                                        <div class="input-group margin-bottom-20">
                                            <span class="input-group-addon">
                                                <i class="fa fa-user"></i>
                                            </span>
                                            <input placeholder="Username" class="form-control" type="text" id="email" name="email">
                                        </div>
                                        <div class="input-group margin-bottom-20">
                                            <span class="input-group-addon">
                                                <i class="fa fa-lock"></i>
                                            </span>
                                            <input placeholder="Password" class="form-control" type="password" id="pwd" name="pwd">
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label class="checkbox">
                                                    <input type="checkbox">Stay signed in</label>
                                            </div>
                                            <div class="col-md-6">
                                                <button class="btn btn-primary pull-right" id="login" type="button">Login</button>
                                            </div>
                                        </div>
                                        <!-- <hr>
                                        <h4>Forget your Password ?</h4>
                                        <p>
                                            <a href="#">Click here</a>to reset your password.</p> -->
                                    </form>
                          <% System.out.println("sessionScope empty"); %>
                          </c:if>
                          <c:if test="${ !empty sessionScope.loginUser }">
                          <% System.out.println("sessionScope not empty"); %>

						<form class="login-page">
							<div class="photo pull-left">
								<a href="http://myroom.oceanmate.co.kr/bbs/myphoto.php"
									target="_blank" class="win_memo" title="사진등록"> 
									<!-- fa fa-code fa-4x -->
									 <img class="img-circle" style="width:80px" src="${ contextPath }/resources/assets/img/profiles/userimg.jpg">
								</a>
							</div>
							<div class="login-header margin-bottom-10">
								<h4>${ loginUser.name }님<br> 환영합니다.</h4>
							</div>
							<br>
							<div class="input-group margin-bottom-20 ">
								<span class="input-group-addon"> <i class="fa fa-user"></i>
								</span> <input value="${ loginUser.email }" readonly
									class="form-control" type="text" name="email">
							</div>
							<div class="input-group margin-bottom-20">
								<span class="input-group-addon"> <i class="fa fa-lock"></i>
								</span> <input value="${ loginUser.pwd }" readonly class="form-control"
									type="password" name="pwd">
							</div>
							<div class="row">
							

								<a href="mypage.me" class="btn btn-green btn-sm"><i
									class="fa fa-user"></i> MyPage</a> <a href="logout.me"
									class="btn btn-blue btn-sm"><i class="fa fa-power-off"></i>
									Logout </a>

							</div>
						</form>

						<%--  <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">${ loginUser.name }님 환영합니다.</h3>
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
                                                        <img src="http://myroom.oceanmate.co.kr/thema/Basic/widget/basic-outlogin/img/photo.png">
                                                    </div>
                                                </a>
                                                <h3>${ loginUser.nickname }</h3>
                                                <div class="font-12 text-muted" style="letter-spacing:-1px;">
                                                    ${ loginUser.mlCode }
                                                  	</div>
                                                <div class="clearfix"></div>
                                            </div>
											<br>
                                            <div class="at-tip" data-original-title="1,000점 추가획득시 레벨업합니다." data-toggle="tooltip" data-placement="top" data-html="true" style="margin:10px 0px;">
                                                <div class="div-progress progress progress-striped" style="margin:0px;">
                                                    <div class="progress-bar progress-bar-exp" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                                                        <span class="sr-only">
                                                            Lv.1					</span>
                                                    </div>
                                                </div>
                                                <div class="sr-score pull-right" style="color:#fff; margin-top:-28px;">0 (0%)</div>
                                            </div>
                                    
                                        
                                    	<br>
                                            <a href="mypage.me" class="btn btn-green btn-sm"><i class="fa fa-user"></i> MyPage</a>
                                            <a href="#" class="btn btn-blue btn-sm"><i class="fa fa-power-off"></i>	Logout </a>
                                    
                                        </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        
                         --%>
                        
                        
                        
                        
					      </c:if>
					      
					    
                        </div> 
                        <!-- End Icons -->
                    </div>
                </div>
            </div>
            <div id="content" class="bottom-border-shadow">
                <div class="container background-white bottom-border">
                    <div class="row margin-vert-30">
                        <!-- Main Text -->
                        <div class="col-md-6" >
                        <div class="panel panel-primary">
                    
                                <!-- 신입생 메이트 시작 -->
                                <div class="div-title-underbar panel-heading">
                                    <a href="blist.rm" style="color:white">
                                        <span class="pull-right lightgray font-16 en">+</span>
                                        <span class="div-title-underbar-bold border-navy font-16 en ">
                                            <b>신입생메이트</b>
                                        </span>
                                    </a>
                                </div>
                                <div class="widget-box panel-body">
                                    <div class="basic-post-list">
                    
                                        <ul class="post-list" id="topList3">
                                            <!-- <li class="ellipsis">
                                                <a href="http://myroom.oceanmate.co.kr/bbs/board.php?bo_table=roomate&amp;wr_id=109#c_123">
                    
                                                    <span class="pull-right gray font-12">
                                                        <span class="name">
                                                            	순종 </span>
                                                        &nbsp;10.06 </span>
                                                    <span class="lightgray"><i class="fa fa-comment"></i></span> <span
                                                        class="subject_title"><b>라인ho1413연락요망</b></span>
                                                </a>
                                            </li> -->
                                        </ul>
                                    </div>
                                </div>
                                
                                <script>
						        function topList3(){
									$.ajax({
										url: "topList.fm",
										dataType: "json",
										success: function(data){
											$ul = $("#topList3");
											$ul.html("");
											
											var fbWriter;
											var fbTitle;
											
											
											
											for(var i in data){
												
												$li = $('<li class="ellipsis">');
												$a = $('<a>').attr('href',"bdetail2.fm?fbId="+data[i].fbId);
												$span = $('<span class="gray font-12 hahaha">');
												$span2 = $('<span class="subject_title hohoho">');
												
												
												$fbWriter = $("<b>").text(data[i].fbWriter);
												$fbTitle = $("<b>").text(decodeURIComponent(data[i].fbTitle.replace(/\+/g," ")));
												
												$li.append($a);
												$span.append($fbWriter);
												$span2.append($fbTitle);
												$a.append($span);
												$a.append($span2);
												/* $li.append($span);
												$li.append($span2); */
												$ul.append($li);
												
												
												/* var $tr = $('<span class="pull-right gray font-12">');
												var $tr2 = $('<span class="subject_title">');
												var $rbTitle = $("<b>").text(decodeURIComponent(data[i].rbTitle.replace(/\+/g," ")));
												var $rbWriter = $("<b>").text(data[i].rbWriter); */
												
												/* $tr.append($rbTitle); */
												
												/* $tr.append($rbWriter);
												$tr2.append($rbTitle);
												
												$tableBody.append($tr);
												$tableBody.append($tr2); */
											}
										}
									});
								}
								
								$(function(){
									topList3();
									
									setInterval(function(){
										topList3();
									}, 100000);
								});
							</script>
                                <!-- 댓글 끝 -->
                    
                        </div>
                    </div>
                        <!-- End Main Text -->
                        <div class="col-md-6">
                            <h3 class="padding-vert-10">공지사항</h3>
                            <p>가장 최근에 올라온 공지사항을 보여줍니다</p>
                            <ul class="tick animate fadeInRight" id="topList4">
                                
                            </ul>
                        </div>
                        <script>
						        function topList4(){
									$.ajax({
										url: "topList.no",
										dataType: "json",
										success: function(data){
											$ul = $("#topList4");
											$ul.html("");
											
											var nTitle;
											
											for(var i in data){
												
												$li = $('<li class="ellipsis">');
												$a = $('<a>').attr('href',"ndetail2.no?nId="+data[i].nId);
												$span = $('<span class="gray font-12 hahaha">');
												$span2 = $('<span class="subject_title hohoho">');
												
												
												$nTitle = $("<b>").text(decodeURIComponent(data[i].nTitle.replace(/\+/g," ")));
												
												$li.append($a);
												$span2.append($nTitle);
												$a.append($span);
												$a.append($span2);
												/* $li.append($span);
												$li.append($span2); */
												$ul.append($li);
												
												
												/* var $tr = $('<span class="pull-right gray font-12">');
												var $tr2 = $('<span class="subject_title">');
												var $rbTitle = $("<b>").text(decodeURIComponent(data[i].rbTitle.replace(/\+/g," ")));
												var $rbWriter = $("<b>").text(data[i].rbWriter); */
												
												/* $tr.append($rbTitle); */
												
												/* $tr.append($rbWriter);
												$tr2.append($rbTitle);
												
												$tableBody.append($tr);
												$tableBody.append($tr2); */
											}
										}
									});
								}
								
								$(function(){
									topList4();
									
									setInterval(function(){
										topList4();
									}, 100000);
								});
							</script>
                     
                </div>
            </div>
            <!-- Portfolio -->
            
            <div id="portfolio" class="bottom-border-shadow">
                <div class="container background-white  bottom-border" style="height: 400px;">
                    <div class="row margin-vert-30">
                        <div class="col-md-12">
                            <h2>이케요</h2>
                            <br><br>
                            <!-- Filter Buttons -->
                        </div>
                    	<div class="row col-md-12 portfolio-group" style="position: relative; width: 1039.97px; height: 265.844px;">
                   			<div id="topList5">
                    		</div>
                       </div>
                	</div>
            	</div>
            </div>
            </div>
            
            <script>
		        function topList5(){
					$.ajax({
						url: "topList.se",
						dataType: "json",
						success: function(data){
							$div = $("#topList5");
							$div.html("");
							
							/* var fbWriter;
							var fbTitle; */
							for(var i in data){
								
								$div2 = $('<div class="col-md-2 portfolio-item margin-bottom-40 audio dadada">').css('overflow','unset');
								$div3 = $('<div>');
								$a = $('<a>').attr('href',"shbdetail2.se?shbId="+data[i].shbId);
								$span = $('<figure>');
								$span2 = $('<img alt="image1" src="resources/buploadFiles/'+data[i].shbRenameFileName+'" style="width:100%; height:100%;">');
								
								
								/* $fbWriter = $("<b>").text(data[i].fbWriter);
								$fbTitle = $("<b>").text(decodeURIComponent(data[i].fbTitle.replace(/\+/g," "))); */
								
								$a.append($span);
								/* $span.append($fbWriter);
								$span2.append($fbTitle); */
								$span.append($span2);
								$div3.append($a);
								/* $li.append($span);
								$li.append($span2); */
								$div2.append($div3);
								$div.append($div2);
								
								/* var $tr = $('<span class="pull-right gray font-12">');
								var $tr2 = $('<span class="subject_title">');
								var $rbTitle = $("<b>").text(decodeURIComponent(data[i].rbTitle.replace(/\+/g," ")));
								var $rbWriter = $("<b>").text(data[i].rbWriter); */
								
								/* $tr.append($rbTitle); */
								
								/* $tr.append($rbWriter);
								$tr2.append($rbTitle);
								
								$tableBody.append($tr);
								$tableBody.append($tr2); */
							}
						}
					});
				}
				
				$(function(){
					topList5();
					
					setInterval(function(){
						topList5();
					}, 100000);
				});
			</script>
            <!-- End Portfolio -->

            <!-- 추가 portfolio-->
            <div id="content" class="bottom-border-shadow">
            	<div class="container background-white  bottom-border" style="height: 400px;">
                    <div class="row margin-vert-30">
                        <div class="col-md-12">
                            <h2>자랑하기</h2>
                            <br><br>
                            <!-- Filter Buttons -->
                        </div>
                    	<div class="row col-md-12 portfolio-group" style="position: relative; width: 1039.97px; height: 265.844px;">
                   			<div id="topList6">
                    		</div>
                       </div>
                	</div>
            	</div>
            </div>
            <!-- portfolio 끝 -->
            <script>
		        function topList6(){
					$.ajax({
						url: "topList.sb",
						dataType: "json",
						success: function(data){
							$div = $("#topList6");
							$div.html("");
							
							/* var fbWriter; */
							var sbTitle;
							console.log(data);
							for(var i in data){
								
								$div2 = $('<div class="col-md-2 portfolio-item margin-bottom-40 audio dadada">').css('overflow','unset');
								$div3 = $('<div>');
								$a = $('<a>').attr('href',"ddetailShowing2.sb?sbid="+data[i].sbid);
								$span = $('<figure>');
								$span2 = $('<img alt="image1" src="resources/showinguploadFiles/'+data[i].renameFileName+'" style="width:100%; height:100%;">' );
								/* $span3 = $('<figcaption>'); */
								
								/* $div = $('<li class="portfolio-item col-sm-4 col-xs-6 margin-bottom-40">');
								$a = $('<a>').attr('href',"shbdetail2.se?shbId="+data[i].shbId);
								$span = $('<figure class="animate fadeInLeft">');
								$span2 = $('<img alt="image1" style="width: 400px; height: 200px;" src="resources/buploadFiles/'+data[i].shbRenameFileName+'">'); */
								
								
								/* $fbWriter = $("<b>").text(data[i].fbWriter); */
								$sbTitle = $("<b>").text(decodeURIComponent(data[i].sbtitle.replace(/\+/g," ")));
								
								/* $span.append($fbWriter); */
								/* $span3.append($sbTitle); */
								$a.append($span);
								$span.append($span2);
								/* $span2.append($span3); */
								/* $li.append($span);
								$li.append($span2); */
								$div3.append($a);
								$div2.append($div3);
								$div.append($div2);
								
								
								/* var $tr = $('<span class="pull-right gray font-12">');
								var $tr2 = $('<span class="subject_title">');
								var $rbTitle = $("<b>").text(decodeURIComponent(data[i].rbTitle.replace(/\+/g," ")));
								var $rbWriter = $("<b>").text(data[i].rbWriter); */
								
								/* $tr.append($rbTitle); */
								
								/* $tr.append($rbWriter);
								$tr2.append($rbTitle);
								
								$tableBody.append($tr);
								$tableBody.append($tr2); */
							}
						}
					});
				}
				
				$(function(){
					topList6();
					
					setInterval(function(){
						topList6();
					}, 100000);
				});
			</script>



            <!-- 추가 판넬 -->
           
                    <div class="container background-grey bottom-border">
                        <div class="row padding-vert-60">
                            <!-- Icons -->
                            <div class="col-md-6 ">
                            <div class="panel panel-green">
                                <!-- 이슈 시작-->
                                <div class="panel-heading" >
                                    <a href="http://myroom.oceanmate.co.kr/bbs/board.php?bo_table=friend" style="color:white">
                                        <span class="pull-right lightgray font-16 en">+</span>
                                        <span class="div-title-underbar-bold border-navy font-16 en">
                                            <b>친구만들기</b>
                                        </span>
                                    </a>
                                </div>
                                <div class="widget-box panel-body">
                                    <div class="basic-post-list ">
                                
                                        <ul class="post-list">
                                            <li class="ellipsis">
                                                <a href="http://myroom.oceanmate.co.kr/bbs/board.php?bo_table=friend&amp;wr_id=1136">
                                
                                                    <span class="pull-right gray font-12">
                                                        &nbsp;09.22 </span>
                                                    <span class="lightgray"><i class="fa fa-caret-right"></i></span> <span class="subject_title"><b>서울
                                                            33살남자구 여자룸메구해요</b></span>
                                                </a>
                                            </li>
                                            <li class="ellipsis">
                                                <a href="http://myroom.oceanmate.co.kr/bbs/board.php?bo_table=friend&amp;wr_id=1135">
                                
                                                    <span class="pull-right gray font-12">
                                                        &nbsp;09.15 </span>
                                                    <span class="lightgray"><i class="fa fa-caret-right"></i></span> <span class="subject_title">룸메이트
                                                        구합니다</span>
                                                </a>
                                            </li>
                                            <li class="ellipsis">
                                                <a href="http://myroom.oceanmate.co.kr/bbs/board.php?bo_table=friend&amp;wr_id=1134">
                                
                                                    <span class="pull-right gray font-12">
                                                        &nbsp;09.14 </span>
                                                    <span class="lightgray"><i class="fa fa-caret-right"></i></span> <span
                                                        class="subject_title">친구 모십니다</span>
                                                </a>
                                            </li>
                                            <li class="ellipsis">
                                                <a href="http://myroom.oceanmate.co.kr/bbs/board.php?bo_table=friend&amp;wr_id=1131">
                                
                                                    <span class="pull-right gray font-12">
                                                        &nbsp;07.17 </span>
                                                    <span class="lightgray"><i class="fa fa-caret-right"></i></span> <span class="subject_title">안산
                                                        여성룸메이트 구해요</span>
                                                </a>
                                            </li>
                                            <li class="ellipsis">
                                                <a href="http://myroom.oceanmate.co.kr/bbs/board.php?bo_table=friend&amp;wr_id=1130">
                                
                                                    <span class="pull-right gray font-12">
                                                        &nbsp;07.08 </span>
                                                    <span class="lightgray"><i class="fa fa-caret-right"></i></span> <span class="subject_title">친구
                                                        구함</span>
                                                </a>
                                            </li>
                                            <li class="ellipsis">
                                                <a href="http://myroom.oceanmate.co.kr/bbs/board.php?bo_table=friend&amp;wr_id=1129">
                                
                                                    <span class="pull-right gray font-12">
                                                        &nbsp;06.28 </span>
                                                    <span class="lightgray"><i class="fa fa-caret-right"></i></span> <span
                                                        class="subject_title">베라기프트살사람</span>
                                                </a>
                                            </li>
                                            <li class="ellipsis">
                                                <a href="http://myroom.oceanmate.co.kr/bbs/board.php?bo_table=friend&amp;wr_id=1126">
                                
                                                    <span class="pull-right gray font-12">
                                                        &nbsp;06.13 </span>
                                                    <span class="lightgray"><i class="fa fa-caret-right"></i></span> <span
                                                        class="subject_title">같이친구할여자</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- 이슈 끝-->
                            </div>
                            </div>
                            <div class="col-md-6 ">
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
                            
                                            <ul class="post-list" id="topList8">
                                                <!-- <li class="ellipsis">
                                                    <a href="http://myroom.oceanmate.co.kr/bbs/board.php?bo_table=free&amp;wr_id=1620">
                            
                                                        <span class="pull-right gray font-12">
                                                            &nbsp;01.11 </span>
                                                        <span class="lightgray"><i class="fa fa-caret-right"></i></span> <span
                                                            class="subject_title"><b>강동구오피스텔</b></span>
                                                    </a>
                                                </li> -->
                                            </ul>
                                    </div>
                                </div>
                                
                                <script>
							        function topList8(){
										$.ajax({
											url: "topList.fr",
											dataType: "json",
											success: function(data){
												$ul = $("#topList8");
												$ul.html("");
												
												var frbWriter;
												var frbTitle;
												
												
												
												for(var i in data){
													
													$li = $('<li class="ellipsis">');
													$a = $('<a>').attr('href',"frbdetail.fr?frbId="+data[i].frbId);
													$span = $('<span class="pull-right gray font-12">');
													$span2 = $('<span class="subject_title">');
													
													
													$frbWriter = $("<b>").text(data[i].frbWriter);
													$frbTitle = $("<b>").text(decodeURIComponent(data[i].frbTitle.replace(/\+/g," ")));
													
													$li.append($a);
													$span.append($frbWriter);
													$span2.append($frbTitle);
													$a.append($span);
													$a.append($span2);
													/* $li.append($span);
													$li.append($span2); */
													$ul.append($li);
													
													
													/* var $tr = $('<span class="pull-right gray font-12">');
													var $tr2 = $('<span class="subject_title">');
													var $rbTitle = $("<b>").text(decodeURIComponent(data[i].rbTitle.replace(/\+/g," ")));
													var $rbWriter = $("<b>").text(data[i].rbWriter); */
													
													/* $tr.append($rbTitle); */
													
													/* $tr.append($rbWriter);
													$tr2.append($rbTitle);
													
													$tableBody.append($tr);
													$tableBody.append($tr2); */
												}
											}
										});
									}
									
									$(function(){
										topList8();
										
										setInterval(function(){
											topList8();
										}, 100000);
									});
								</script>
                                <!-- 뉴스 끝 -->
                            </div>
                            </div>
                           
                            <!-- End Icons -->
                        </div>
                    </div>
            <!-- 판넬 끝 -->

            
            <!-- carousels 추가하기 -->
            <div id="content" class="bottom-border-shadow">
                
                <div class="container background-white  bottom-border">
                    <div class="row margin-vert-30">
                        <div class="col-md-12">
                                <hr class="margin-top-30">
                                <div id="carousel-example-2" class="carousel slide alternative" data-ride="carousel">
                                    <!-- Indicators -->
                                    <ol class="carousel-indicators">
                                        <li data-target="#carousel-example-2" data-slide-to="0" class="active"></li>
                                        <li data-target="#carousel-example-2" data-slide-to="1"></li>
                                    </ol>
                                    <!-- Wrapper for slides -->
                                    <div class="carousel-inner">
                                        <div class="item active">
                                            <div class="row">
                                                <div class="col-md-3"><img src="${contextPath}/resources/assets/img/sample/sample3.jpg" style="max-width:100%;"></div>
                                                <div class="col-md-3"><img src="${contextPath}/resources/assets/img/sample/sample2.jpg" style="max-width:100%;"></div>
                                                <div class="col-md-3"><img src="${contextPath}/resources/assets/img/sample/sample3.jpg" style="max-width:100%;"></div>
                                                <div class="col-md-3"><img src="${contextPath}/resources/assets/img/sample/sample2.jpg" style="max-width:100%;"></div>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="row">
                                                <div class="col-md-3"><img src="${contextPath}/resources/assets/img/sample/sample2.jpg" style="max-width:100%;"></div>
                                                <div class="col-md-3"><img src="${contextPath}/resources/assets/img/sample/sample3.jpg" style="max-width:100%;"></div>
                                                <div class="col-md-3"><img src="${contextPath}/resources/assets/img/sample/sample2.jpg" style="max-width:100%;"></div>
                                                <div class="col-md-3"><img src="${contextPath}/resources/assets/img/sample/sample3.jpg" style="max-width:100%;"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Controls -->
                                    <a class="left carousel-control" href="#carousel-example-2" data-slide="prev">
                                        <span class="glyphicon glyphicon-chevron-left"></span>
                                    </a>
                                    <a class="right carousel-control" href="#carousel-example-2" data-slide="next">
                                        <span class="glyphicon glyphicon-chevron-right"></span>
                                    </a>
                                </div>
                                <hr class="margin-top-30">
                            </div>
                        </div>
                    </div>
	</div>
    
<!-- carousels 마지막 끝-->



<!-- ==== END CONTENT ==== -->



 <!-- 비밀번호 불일치 모달 -->
	<div class="modal fade" id="pwdNotMatch" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">비밀번호 불일치</h4>
				</div>
				<div class="modal-body">
				가입시 입력하신 비밀번호와 일치하지 않습니다.<br>
				비밀번호를 다시 확인해주세요.
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
<!-- 비밀번호 불일치 모달 끝 -->

<!-- ==== FOOTER START ==== -->
	<c:import url ="common/footer.jsp"/>
<!-- ==== FOOTER END ==== -->


<script>
	$('#login').click(function(){
		/* event.preventDefault(); */
		var email = $('#email').val();
		var pwd = $('#pwd').val();
	
		$.ajax({
				url: "pwdCheck.me",
				data: {email:email,pwd:pwd},
				type: "post",
				dataType: "json",
				success: function(data){
					console.log(data);
					/* if (data == "success") {
						console.log("비밀번호 일치");
						$("#login").submit();
					} else {
						$("#pwdNotMatch").modal();
						console.log("비밀번호 불일치");
					} */
				},error: function(data){
					console.log("에러 : "+ data);
				}
		});
	});
</script>
</body>
</html>
