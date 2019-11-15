<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- contextPath 선언 -->
    <c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
  
      <!-- Meta -->
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <!-- Favicon -->
    <link href="favicon.ico" rel="shortcut icon">
    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="${contextPath}/resources/assets/css/bootstrap.css" rel="stylesheet">
    <!-- Template CSS -->
    <link rel="stylesheet" href="${contextPath}/resources/assets/css/animate.css" rel="stylesheet">
    <link rel="stylesheet" href="${contextPath}/resources/assets/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" href="${contextPath}/resources/assets/css/nexus.css" rel="stylesheet">
    <link rel="stylesheet" href="${contextPath}/resources/assets/css/responsive.css" rel="stylesheet">
    <link rel="stylesheet" href="${contextPath}/resources/assets/css/custom.css" rel="stylesheet">
    <!-- Google Fonts-->
    <link href="http://fonts.googleapis.com/css?family=Roboto+Condensed:400,300" rel="stylesheet" type="text/css">
    <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
    <style>
	    #ultag li {
	        display:inline;
	        padding:0 30px;
	    }
	    #table th{
	        width:150px;
	       
	    }
	    #table td{
	        width:150px;
	    }
	
	    
    </style>
</head>
<body>
	
	 <!-- Phone/Email -->
            <div id="pre-header" class="background-gray-lighter">
                <div class="container no-padding">
                    <div class="row hidden-xs">
                        <div class="col-sm-6 padding-vert-5">
                            <strong>전화번호:</strong>&nbsp;+82-10-6786-4567
                        </div>
                        <div class="col-sm-6 text-right padding-vert-5">
                            <c:if test="${ empty sessionScope.loginUser }">
                            <a href="loginView.me" style="color:black">로그인</a>&nbsp;&nbsp;&nbsp;
                            </c:if>
                            <c:if test="${ !empty sessionScope.loginUser }">
                            <a href="logout.me" style="color:black">로그아웃</a>&nbsp;&nbsp;&nbsp;
                            </c:if>
                            <c:if test="${ empty sessionScope.loginUser }">
                                |&nbsp;&nbsp;&nbsp;<a href="termsNConditions.me" style="color:black">회원가입</a>&nbsp;&nbsp;&nbsp;
                             </c:if>   
                            <c:if test="${ !empty sessionScope.loginUser }">
                                |&nbsp;&nbsp;&nbsp;<a href="mypage.me" style="color:black">회원정보</a>&nbsp;&nbsp;&nbsp;
                             </c:if>   
                                
                                |&nbsp;&nbsp;&nbsp;<a href="#" style="color:black">정보찾기</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Phone/Email -->
            <!-- Header -->
            <div id="header" >
                <div class="container" >
                    <div class="row">
                        <!-- Logo -->
                        <div class="logo" >
                            <a href="home.do" title="" style="top:5px">
                                <img src="${contextPath}/resources/assets/img/BP_logo7.png" alt="Logo" />
                            </a>
                        </div>
                        <!-- End Logo -->
                    </div>
                </div>
            </div>
            <!-- End Header -->
            <!-- Top Menu -->
            <div id="hornav" class="bottom-border-shadow" >
                <div class="container no-padding border-bottom">
                    <div class="row">
                        <div class="col-md-8 no-padding">
                            <div class="visible-lg">
                                <ul id="hornavmenu" class="nav navbar-nav" style="width:800px">
                                    <li>
                                        <a href="javascript:;" data-toggle="collapse" data-target="#menu-all" class="glyphicon glyphicon-list"></a>
                                    </li>
                                    <!-- 
                                        glyphicon glyphicon-th
                                        glyphicon glyphicon-list
                                        glyphicon glyphicon-align-justify
                                    -->
                                    <li>
                                        <span class="glyphicon glyphicon-book "> 룸메이트</span>  <ul>
                                            <li>
                                                <a href="blist.rm?fLocation=전체" >전체</a>
                                            </li>
                                            <li>
                                                <a href="blist.rm?fLocation=서울" >서울</a>
                                            </li>
                                            <li>
                                                <a href="blist.rm?fLocation=인천/부천">인천/부천</a>
                                            </li>                                
                                            <li>                                 
                                                <a href="blist.rm?fLocation=수원/경기">수원/경기</a>
                                            </li>                                
                                            <li>                                 
                                                <a href="blist.rm?fLocation=대구/경북">대구/경북</a>
                                            </li>                                
                                            <li>                                 
                                                <a href="blist.rm?fLocation=부산/경남" >부산/경남</a>
                                            </li>                                
                                            <li>                                 
                                                <a href="blist.rm?fLocation=충청/강원" >충청/강원</a>
                                            </li>                                
                                            <li>                                 
                                                <a href="blist.rm?fLocation=광주/전라">광주/전라</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <span class="glyphicon glyphicon-book "> 하우스메이트</span>
                                        <ul>
                                            <li>
                                                <a href="blist.hm?fLocation=전체" >전체</a>
                                            </li>
                                            <li>
                                                <a href="blist.hm?fLocation=서울" >서울</a>
                                            </li>
                                            <li>
                                                <a href="blist.hm?fLocation=인천/부천">인천/부천</a>
                                            </li>                                
                                            <li>                                 
                                                <a href="blist.hm?fLocation=수원/경기">수원/경기</a>
                                            </li>                                
                                            <li>                                 
                                                <a href="blist.hm?fLocation=대구/경북">대구/경북</a>
                                            </li>                                
                                            <li>                                 
                                                <a href="blist.hm?fLocation=부산/경남" >부산/경남</a>
                                            </li>                                
                                            <li>                                 
                                                <a href="blist.hm?fLocation=충청/강원" >충청/강원</a>
                                            </li>                                
                                            <li>                                 
                                                <a href="blist.hm?fLocation=광주/전라">광주/전라</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <span class="glyphicon glyphicon-book "> 신입생메이트</span>
                                        <ul>
                                            <li>
                                                <a href="blist.fm?fLocation=전체" >전체</a>
                                            </li>
                                            <li>
                                                <a href="blist.fm?fLocation=서울" >서울</a>
                                            </li>
                                            <li>
                                                <a href="blist.fm?fLocation=인천/부천">인천/부천</a>
                                            </li>                                
                                            <li>                                 
                                                <a href="blist.fm?fLocation=수원/경기">수원/경기</a>
                                            </li>                                
                                            <li>                                 
                                                <a href="blist.fm?fLocation=대구/경북">대구/경북</a>
                                            </li>                                
                                            <li>                                 
                                                <a href="blist.fm?fLocation=부산/경남" >부산/경남</a>
                                            </li>                                
                                            <li>                                 
                                                <a href="blist.fm?fLocation=충청/강원" >충청/강원</a>
                                            </li>                                
                                            <li>                                 
                                                <a href="blist.fm?fLocation=광주/전라">광주/전라</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <span class="glyphicon glyphicon-book "> 이케요</span>
                                        <ul>
                                            <li>
                                                <a href="shblistView.se">이케요</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
		                                <span class="glyphicon glyphicon-book"> 커뮤니티</span>
		                            	<ul>
			                                <li>
			                                    <a href="nList.no">공지사항</a>
			                                </li>
			                                <li>
			                                    <a href="bShowing.sb">자랑하기</a>
			                                </li>
			                                <li>
			                                    <a href="frblist.fr">자유게시판</a>
			                                </li>
		                           		 </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-4 no-padding">
                            <ul class="social-icons pull-right">
                                <li class="social-rss">
                                    <a href="#" target="_blank" title="RSS"></a>
                                </li>
                                <li class="social-twitter">
                                        <a href="#"class="fa fa-bell-o"></a>
                                </li>
                                <li class="social-facebook">
                                    <a href="#" class="glyphicon glyphicon-search"></a>
                                </li>
                                <li class="social-googleplus">
                                    <a href="#" target="_blank" title="Google+"></a>
                                </li>
                            </ul> 
                        
                        </div>
                    </div>
                </div>
            </div>


            <!-- 토글 div 추가 -->
           
            <div id="menu-all" class="accordion-body collapse " style="color:rgb(37, 28, 28)">
                    <div  class="bottom-border-shadow">
                        <div class="container background-gray-lighter bottom-border">
                            
                            <!-- <hr class="margin-top-30"> -->
                            <div class="row padding-vert-30" >
                                
                                <div class="col-md-9" style="float:unset; width:fit-content; margin:auto; padding-top:3%">
                                        <div class="panel panel-default" style="vertical-align: middle;">
                                                <div class="panel-heading">
                                                   <!-- <ul style="list-style: none; " id="ultag" style="text-;">
                                                       <li>룸메이트</li>
                                                       <li>하우스메이트</li>
                                                       <li>신입생메이트</li>
                                                       <li>중고물품</li>
                                                       <li>커뮤니티</li>
                                                   </ul> -->
                                                   <table style="width:100%; " id="table">
                                                    <thead>
                                                   <tr style="list-style: none; " >
                                                        <th style="text-align: center;">룸메이트</th>
                                                        <th style="text-align: center;">하우스메이트</th>
                                                        <th style="text-align: center;">신입생메이트</th>
                                                        <th style="text-align: center;">이케요</th>
                                                        <th style="text-align: center;">커뮤니티</th>
                                                   </tr>
                                                </thead>
                                                </table>
                                                </div>
                                            <div class="panel-body">
                                                <!-- <ul style="text-align:center; padding-inline-start:0; "  >
                                                <li style="display: inline-flex; " >
                                                    <ul style="list-style: none; margin-right:20px">
                                                        <li><a href="#">서울</a></li>
                                                        <li><a href="#">인천/부천</a></li>
                                                        <li><a href="#">수원/경기</a></li>
                                                        <li>대구/경북</li>
                                                        <li>부산/경남</li>
                                                        <li>충청/강원</li>
                                                        <li>광주/전라</li>
                                                    </ul>
                                                    <ul style="list-style: none; margin-right:20px">
                                                        <li><a href="#">서울</a></li>
                                                        <li><a href="#">인천/부천</a></li>
                                                        <li><a href="#">수원/경기</a></li>
                                                        <li><a href="#">대구/경북</a></li>
                                                        <li>부산/경남</li>
                                                        <li>충청/강원</li>
                                                        <li>광주/전라</li>
                                                    </ul>   
                                                    <ul style="list-style: none; margin-right:20px">
                                                        <li><a href="#">서울</a></li>
                                                        <li><a href="#">인천/부천</a></li>
                                                        <li><a href="#">수원/경기</a></li>
                                                        <li><a href="#">대구/경북</a></li>
                                                        <li>대구/경북</li>
                                                        <li>부산/경남</li>
                                                        <li>충청/강원</li>
                                                        <li>광주/전라</li>
                                                    </ul>   
                                                    <ul style="list-style: none; margin-right:20px">
                                                        <li><a href="#">서울</a></li>
                                                        <li><a href="#">인천/부천</a></li>
                                                        <li><a href="#">수원/경기</a></li>
                                                        <li><a href="#">대구/경북</a></li>
                                                        <li>대구/경북</li>
                                                        <li>부산/경남</li>
                                                        <li>충청/강원</li>
                                                        <li>광주/전라</li>      
                                                    </ul>   
                                                    <ul style="list-style: none; margin-right:20px">
                                                        <li>회원 자유게시판</li>
                                                        <li>친구만들기</li>
                                                        <li>이쁜집 구경하기</li>
                                                        <li>룸메&하메 상식</li>
                                                        <li>회원 질문/답변</li>
                                                        <li>공지사항&이벤트</li>
                                                    </ul>   
                                                   
                                                </li>
                                                </ul>    -->
                                                <table style="width:100%; " id="table">
                                                <tbody>
                                                <tr  >
                                                        <td style="text-align: center;">
                                                            <ul style="list-style: none; padding:0px">
                                                            	<li><a href="blist.rm?fLocation=전체">전체</a></li>
                                                                <li><a href="blist.rm?fLocation=서울">서울</a></li>
                                                                <li><a href="blist.rm?fLocation=인천/부천">인천/부천</a></li>
                                                                <li><a href="blist.rm?fLocation=수원/경기">수원/경기</a></li>
                                                                <li><a href="blist.rm?fLocation=대구/경북">대구/경북</a></li>
                                                                <li><a href="blist.rm?fLocation=부산/경남">부산/경남</a></li>
                                                                <li><a href="blist.rm?fLocation=충청/강원">충청/강원</a></li>
                                                                <li><a href="blist.rm?fLocation=광주/전라">광주/전라</a></li>
                                                            </ul>
                                                        </td>   
                                                        <td style="text-align: center;">
                                                            <ul style="list-style: none; padding:0px">
                                                            	<li><a href="blist.hm?fLocation=전체">전체</a></li>
                                                                <li><a href="blist.hm?fLocation=서울">서울</a></li>
                                                                <li><a href="blist.hm?fLocation=인천/부천">인천/부천</a></li>
                                                                <li><a href="blist.hm?fLocation=수원/경기">수원/경기</a></li>
                                                                <li><a href="blist.hm?fLocation=대구/경북">대구/경북</a></li>
                                                                <li><a href="blist.hm?fLocation=부산/경남">부산/경남</a></li>
                                                                <li><a href="blist.hm?fLocation=충청/강원">충청/강원</a></li>
                                                                <li><a href="blist.hm?fLocation=광주/전라">광주/전라</a></li>
                                                            </ul>
                                                        </td>   
                                                        <td style="text-align: center;"> 
                                                            <ul style="list-style: none; padding:0px">
                                                            	<li><a href="blist.fm?fLocation=전체">전체</a></li>
                                                                <li><a href="blist.fm?fLocation=서울">서울</a></li>
                                                                <li><a href="blist.fm?fLocation=인천/부천">인천/부천</a></li>
                                                                <li><a href="blist.fm?fLocation=수원/경기">수원/경기</a></li>
                                                                <li><a href="blist.fm?fLocation=대구/경북">대구/경북</a></li>
                                                                <li><a href="blist.fm?fLocation=부산/경남">부산/경남</a></li>
                                                                <li><a href="blist.fm?fLocation=충청/강원">충청/강원</a></li>
                                                                <li><a href="blist.fm?fLocation=광주/전라">광주/전라</a></li>
                                                            </ul>
                                                        </td>   
                                                        <td style="text-align: center;" >   
                                                            <ul style="list-style: none; padding:0px">
                                                                <li><a href="shblistView.se">이케요</a></li>      
                                                            </ul> 
                                                        </td>
                                                        <td style="text-align: center;">  
                                                            <ul style="list-style: none; padding:0px ;"> 
                                                                <li><a href="nList.no">공지사항</a></li>
                                                                <li><a href="bShowing.sb">자랑하기</a></li>
                                                                <li><a href="frblist.fr">자유게시판</a></li>
                                                            </ul>   
                                                           
                                                        </td  >
                                                    </tr>  
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>

                                
                                    <hr class="margin-top-30">
                        </div>

                    </div>
                    </div>
                </div>
            <!-- 토글 끝 -->




</body>
</html>