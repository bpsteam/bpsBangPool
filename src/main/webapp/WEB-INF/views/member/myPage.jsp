<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
                                <div class="at-title">
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
                                <div class="tab-content" style="border-top: 1px;">
                                    <div class="tab-pane fade in active" id="sample-2a">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="table-responsive">
                                                    <div class="panel panel-default view-author">
                                                        <div class="panel-heading">
                                                            <h3 class="panel-title">My Profile</h3>
                                                        </div>
                                                        <div class="panel-body" style="background-color:white;">
                                                            <!-- <div class="pull-left text-center auth-photo">
                                                                <div class="img-photo">
                                                                    <i class="fa fa-user"></i>				</div>
                                                                <div class="btn-group" style="margin-top:-30px;white-space:nowrap;">
                                                                    <button type="button" class="btn btn-color btn-sm" onclick="apms_like('ch93ksw', 'like', 'it_like'); return false;" title="Like">
                                                                        <i class="fa fa-thumbs-up"></i> <span id="it_like">0</span>
                                                                    </button>
                                                                    <button type="button" class="btn btn-color btn-sm" onclick="apms_like('ch93ksw', 'follow', 'it_follow'); return false;" title="Follow">
                                                                        <i class="fa fa-users"></i> <span id="it_follow">0</span>
                                                                    </button>
                                                                </div>
                                                            </div> -->
                                                            
                                                            <!-- 여기 -->
                                                            <!-- <div class="panel-body">
																<div class="pull-left text-center auth-photo">
																	<div class="img-photo">
																		<i class="fa fa-user" >
																			<img src="/img/456.jpg">
																		</i>				
																	</div>
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
																		<span class="pull-right font-12">Lv.1</span>
																		<b><a href="javascript:;" onclick="showSideView(this, 'khajsfirepunch', '중중식', '', '');"><span class="member"><span class="lv-icon lv-1">1</span> 중중식</span></a></b> &nbsp;<span class="text-muted en font-12">실버</span>
																	</div>
																	<div class="div-progress progress progress-striped no-margin">
																		<div class="progress-bar progress-bar-exp" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
																			<span class="sr-only">0 (0%)</span>
																		</div>
																	</div>
																	<p style="margin-top:6px;">
																		등록된 서명이 없습니다.				</p>
																</div>
																<div class="clearfix"></div>
															</div> -->
                                                            
                                                            <!-- 끝 -->
                                                            
                                                            <!-- 잠시 주석  -->
                                                            <div class="auth-info">
                                                                <div class="en font-14" style="margin-bottom:6px;">
                                                                    <span class="pull-right font-12">Lv.1</span>
                                                                    <b><a href="javascript:;" onclick="showSideView(this, 'ch93ksw', 'wbgg', '', '');"><span class="member"><span class="lv-icon lv-1">1</span> 
                                                                    ${ loginUser.nickname }</span></a></b> &nbsp;<span class="text-muted en font-12">실버</span>
                                                                </div>
                                                                
                                                                <div class="progress progress-striped active">
							                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 90%;">
							                                            <span class="sr-only">90% Complete (Sucess)</span>
							                                        </div>
							                                    </div>
							
																<!-- <div class="progress progress-striped active">
							                                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 30%;">
							                                            <span class="sr-only">30% Complete (info)</span>
							                                        </div>
							                                    </div> -->
							
																<div class="progress progress-striped active">
							                                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 20%;">
							                                            <span class="sr-only">20%Complete (warning)</span>
							                                        </div>
							                                    </div>
							
																<div class="progress progress-striped active">
							                                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 10%;">
							                                            <span class="sr-only">10% Complete (danger)</span>
							                                        </div>
							                                    </div>
							                                    
                                                                <!-- 기존 -->
                                                                <!-- <div class="div-progress progress progress-striped no-margin">
                                                                    <div class="progress-bar progress-bar-exp" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                                                                        <span class="sr-only">0 (0%)</span>
                                                                    </div>
                                                                </div> -->
                                                                <p style="margin-top:6px;">
                                                                    등록된 서명이 없습니다.				</p>
                                                            </div>
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
                                                        <span class="pull-right">미등록</span>
                                                        연락처
                                                    </li>
                                                    <li class="list-group-item">
                                                        <span class="pull-right">여기에 이메일 들어간다?</span>
                                                        E-Mail
                                                    </li>
                                                    <li class="list-group-item">
                                                        <span class="pull-right">2019-10-24 16:04:29</span>
                                                        최종접속일
                                                    </li>
                                                    <li class="list-group-item">
                                                        <span class="pull-right">2019-10-23 19:56:59</span>
                                                        회원가입일
                                                    </li>
                                                                    </ul>
                                                            </div>
                                        </div>
                                        <div class="col-sm-5">
                                            <div class="row">
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
                                                <div class="col-xs-6">
                                                    <div class="form-group">
                                                        <a href="http://myroom.oceanmate.co.kr/bbs/member_confirm.php?url=register_form.php" class="btn btn-lightgray btn-sm btn-block">
                                                            정보수정
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col-xs-6">
                                                    <div class="form-group">
                                                        <a href="http://myroom.oceanmate.co.kr/bbs/member_confirm.php?url=member_leave.php" class="btn btn-lightgray btn-sm btn-block leave-me">
                                                            탈퇴하기
                                                        </a>
                                                    </div>
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
                        <button id="matching_onclick" type="button" class="btn btn-primary btn-sm" style="width: 100%;">나에게 맞는 방 찾기</button>
                        <div id="matching_form" class="section_matching">
                            <div class="matching_content">
                                <div class="col-md-6 col-md-offset-3 col-sm-offset-3">
                                    <form class="signup-page">
                                        <div class="signup-header">
                                                <h2 style="display: inline;">어떠한 조건이 좋으냐?</h2>
                                                <span class="close"><h1  style="display: inline;">&times;</h1></span>
                                            <br><br><br><br>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <label>지역</label>
                                                    <select class="form-control margin-bottom-20">
                                                        <option value="">전체</option>
                                                        <option value="서울">서울특별시</option>
                                                        <option value="인천">인천광역시</option>
                                                        <option value="대전">대전광역시</option>
                                                        <option value="대구">대구광역시</option>
                                                        <option value="광주">광주광역시</option>
                                                        <option value="울산">울산광역시</option>
                                                        <option value="부산">부산광역시</option>
                                                        <option value="경기도">경기도</option>
                                                        <option value="강원도">강원도</option>
                                                        <option value="충북">충청북도</option>
                                                        <option value="충남">충청남도</option>
                                                        <option value="경북">경상북도</option>
                                                        <option value="경남">경상남도</option>
                                                        <option value="전북">전라북도</option>
                                                        <option value="전남">전라남도</option>
                                                        <option value="제주도">귤</option>
                                                    </select>
                                                </div>
                                                <div class="col-sm-6">
                                                    <label>성별</label>
                                                        <select class="form-control margin-bottom-20">
                                                            <option value="">전체</option>
                                                            <option value="남">남</option>
                                                            <option value="여">여</option>
                                                        </select>
                                                </div>
                                            </div>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <label>평수</label>
                                                <select class="form-control margin-bottom-20">
                                                    <option value="">전체</option>
                                                    <option value="10p">10평미만</option>
                                                    <option value="11p">11~20평</option>
                                                    <option value="11p">21~30평</option>
                                                    <option value="11p">그 외</option>
                                                </select>
                                            </div>
                                            <div class="col-sm-6">
                                                <label>주거종류</label>
                                                <select class="form-control margin-bottom-20">
                                                    <option value="">전체</option>
                                                    <option value="아파트">아파트</option>
                                                    <option value="빌라">빌라</option>
                                                    <option value="원룸">원룸</option>
                                                    <option value="투룸">투룸</option>
                                                    <option value="오피스텔">오피스텔</option>
                                                </select>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-lg-8">
                                            </div>
                                            <div class="col-lg-4 text-right">
                                                <button class="btn btn-primary" type="submit">매칭하기</button>
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

                            matching_btn.onclick = function () {
                                section_matching.style.display = "block";
                            }

                            span.onclick = function() {
                                section_matching.style.display = "none";
                            }

                            window.onclick = function (event) {
                                if (event.target == section_matching) {
                                    section_matching.style.display = "none";
                                }
                            }
                        </script>
                        <br><br>
                        <div class="panel panel-default">
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
                                                        <img src="http://myroom.oceanmate.co.kr/thema/Basic/widget/basic-outlogin/img/photo.png">
                                                    </div>
                                                </a>
                                                <h4>${ loginUser.nickname }
                                                	<%-- <c:if test="${ !empty loginUser }">
	                                                   <input type="text" name="rbWriter"  id="rbWriter" value="${ loginUser.nickname }" readonly class="form-control input-sm" size="10" maxlength="20">
		                                         	</c:if>	 --%>
                                                </h4>
                                                <div class="font-12 text-muted" style="letter-spacing:-1px;">실버</div>
                                                <div class="clearfix"></div>
                                            </div>
                                    
                                            <div class="at-tip" data-original-title="1,000점 추가획득시 레벨업합니다." data-toggle="tooltip" data-placement="top" data-html="true" style="margin:10px 0px;">
                                                <div class="div-progress progress progress-striped" style="margin:0px;">
                                                    <div class="progress-bar progress-bar-exp" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                                                        <span class="sr-only">
                                                            Lv.1					</span>
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
                        </div>
                        <!-- End recent Posts -->
                        <!-- 공지사항 -->
                        <div class="panel panel-danger">
                            <!-- 이슈 시작-->
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
                            <!-- 이슈 끝-->
                        </div>
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
	<c:import url ="../common/footer.jsp"/>
<!-- ==== FOOTER END ==== -->

</body>
</html>