<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


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
                                
                                <div class="tab-pane fade in active" id="freshman">
                                        <h1><small>FRESHMAN MATE</small></h1>
                                        <div class="margin-bottom-10">
                                                <hr>
                                            </div>
                                        <div class="tabs alternative" >
                                                <ul class="nav nav-tabs">
                                                    <li class="active">
                                                        <a href="#sample-6a" data-toggle="tab">전체</a>
                                                    </li>
                                                    <li>
                                                        <a href="#sample-6a" data-toggle="tab">서울</a>
                                                    </li>
                                                    <li>
                                                        <a href="#sample-6b" data-toggle="tab">인천/부천</a>
                                                    </li>
                                                    <li>
                                                        <a href="#sample-6c" data-toggle="tab">수원/경기</a>
                                                    </li>
                                                    <li>
                                                        <a href="#sample-6d" data-toggle="tab">대구/경북</a>
                                                    </li>
                                                    <li>
                                                        <a href="#sample-6d" data-toggle="tab">부산/경남</a>
                                                    </li>
                                                    <li>
                                                        <a href="#sample-6d" data-toggle="tab">충청/강원</a>
                                                    </li>
                                                    <li>
                                                        <a href="#sample-6d" data-toggle="tab">광주/전라</a>
                                                    </li>
                                                </ul>
                                                <div class="tab-content">
                                                    <div class="tab-pane fade in active" id="sample-6a">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="table-responsive">
                                                                    <table class="table table-hover">
                                                                        <thead>
                                                                            <tr>
                                                                                <th style="text-align:center">No.</th>
                                                                                <th>분류</th>
                                                                                <th>제목</th>
                                                                                <th>작성자</th>
                                                                                <th style="text-align:center">조회수</th>
                                                                                
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                        <c:forEach var = "b" items="${ list }">
                                                                            <tr>
                                                                                <td style="text-align:center">${ b.fbId }</td>
                                                                                <td>${ b.fLocation }</td>
                                                                                <td style="width:300px">${ b.fbTitle }</td>
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
                            
                                                    <div class="tab-pane fade in" id="sample-6b">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="table-responsive">
                                                                    <table class="table table-hover">
                                                                        <thead>
                                                                            <tr>
                                                                                <th>No.</th>
                                                                                <th>분류</th>
                                                                                <th>제목</th>
                                                                                <th>작성자</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <tr>
                                                                                <td>1</td>
                                                                                <td>서울</td>
                                                                                <td>룸메이트하우스메이트 게시판 글 재목 칸 입니다.</td>
                                                                                <td>user1</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>2</td>
                                                                                <td>인천/부천</td>
                                                                                <td>룸메이트하우스메이트 게시판 글 재목 칸 입니다.</td>
                                                                                <td>user2</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>3</td>
                                                                                <td>부산/경남</td>
                                                                                <td>룸메이트하우스메이트 게시판 글 재목 칸 입니다.</td>
                                                                                <td>user3</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>1</td>
                                                                                <td>수원/경기</td>
                                                                                <td>룸메이트하우스메이트 게시판 글 재목 칸 입니다.</td>
                                                                                <td>user4</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>2</td>
                                                                                <td>서울</td>
                                                                                <td>룸메이트하우스메이트 게시판 글 재목 칸 입니다.</td>
                                                                                <td>user5</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>3</td>
                                                                                <td>부산/경남</td>
                                                                                <td>룸메이트하우스메이트 게시판 글 재목 칸 입니다.</td>
                                                                                <td>user6</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>1</td>
                                                                                <td>대구/경북</td>
                                                                                <td>룸메이트하우스메이트 게시판 글 재목 칸 입니다.</td>
                                                                                <td>user7</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>2</td>
                                                                                <td>충청/강원</td>
                                                                                <td>룸메이트하우스메이트 게시판 글 재목 칸 입니다.</td>
                                                                                <td>user8</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>3</td>
                                                                                <td>수원/경기</td>
                                                                                <td>룸메이트하우스메이트 게시판 글 재목 칸 입니다.</td>
                                                                                <td>user9</td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="tab-pane fade in" id="sample-6c">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="table-responsive">
                                                                    <table class="table table-hover">
                                                                        <thead>
                                                                            <tr>
                                                                                <th>No.</th>
                                                                                <th>분류</th>
                                                                                <th>제목</th>
                                                                                <th>작성자</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <tr>
                                                                                <td>1</td>
                                                                                <td>서울</td>
                                                                                <td>룸메이트하우스메이트 게시판 글 재목 칸 입니다.</td>
                                                                                <td>user1</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>2</td>
                                                                                <td>인천/부천</td>
                                                                                <td>룸메이트하우스메이트 게시판 글 재목 칸 입니다.</td>
                                                                                <td>user2</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>3</td>
                                                                                <td>부산/경남</td>
                                                                                <td>룸메이트하우스메이트 게시판 글 재목 칸 입니다.</td>
                                                                                <td>user3</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>1</td>
                                                                                <td>수원/경기</td>
                                                                                <td>룸메이트하우스메이트 게시판 글 재목 칸 입니다.</td>
                                                                                <td>user4</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>2</td>
                                                                                <td>서울</td>
                                                                                <td>룸메이트하우스메이트 게시판 글 재목 칸 입니다.</td>
                                                                                <td>user5</td>
                                                                            </tr>
                            
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="tab-pane fade in" id="sample-6d">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="table-responsive">
                                                                    <table class="table table-hover">
                                                                        <thead>
                                                                            <tr>
                                                                                <th>No.</th>
                                                                                <th>분류</th>
                                                                                <th>제목</th>
                                                                                <th>작성자</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <tr>
                                                                                <td>1</td>
                                                                                <td>서울</td>
                                                                                <td>룸메이트하우스메이트 게시판 글 재목 칸 입니다.</td>
                                                                                <td>user1</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>2</td>
                                                                                <td>인천/부천</td>
                                                                                <td>룸메이트하우스메이트 게시판 글 재목 칸 입니다.</td>
                                                                                <td>user2</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>3</td>
                                                                                <td>부산/경남</td>
                                                                                <td>룸메이트하우스메이트 게시판 글 재목 칸 입니다.</td>
                                                                                <td>user3</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>1</td>
                                                                                <td>수원/경기</td>
                                                                                <td>룸메이트하우스메이트 게시판 글 재목 칸 입니다.</td>
                                                                                <td>user4</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>2</td>
                                                                                <td>서울</td>
                                                                                <td>룸메이트하우스메이트 게시판 글 재목 칸 입니다.</td>
                                                                                <td>user5</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>3</td>
                                                                                <td>부산/경남</td>
                                                                                <td>룸메이트하우스메이트 게시판 글 재목 칸 입니다.</td>
                                                                                <td>user6</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>1</td>
                                                                                <td>대구/경북</td>
                                                                                <td>룸메이트하우스메이트 게시판 글 재목 칸 입니다.</td>
                                                                                <td>user7</td>
                                                                            </tr>
                            
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                    <!--페이징처리와 버튼-->
                                                    <div class="text-center">
                                                        <ul class="pagination">
                                                            <li>
                                                                <a href="#">«</a>
                                                            </li>
                                                            <li>
                                                                <a href="#">1</a>
                                                            </li>
                                                            <li>
                                                                <a href="#">2</a>
                                                            </li>
                                                            <li class="active">
                                                                <a href="#">3</a>
                                                            </li>
                                                            <li>
                                                                <a href="#">4</a>
                                                            </li>
                                                            <li>
                                                                <a href="#">5</a>
                                                            </li>
                                                            <li>
                                                                <a href="#">»</a>
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
                                    <form name="fsearch" method="get" role="form" class="form" style="margin-top:20px;">
                                        <input type="hidden" name="bo_table" value="roomate">
                                        <input type="hidden" name="sca" value="">
                                        <input type="hidden" name="sop" value="and">
                                        <div class="form-group">
                                            <label for="sfl" class="sound_only">검색대상</label>
                                            <select name="sfl" id="sfl" class="form-control input-sm">
                                                <option value="wr_subject">제목</option>
                                                <option value="wr_content">내용</option>
                                                <option value="wr_subject||wr_content">제목+내용</option>
                                                <option value="mb_id,1">회원아이디</option>
                                                <option value="mb_id,0">회원아이디(코)</option>
                                                <option value="wr_name,1">글쓴이</option>
                                                <option value="wr_name,0">글쓴이(코)</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="stx" class="sound_only">검색어<strong class="sound_only"> 필수</strong></label>
                                            <input type="text" name="stx" value="" required="" id="stx" class="form-control input-sm" maxlength="20" placeholder="검색어">
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
                                            <a href="#sample-3a" data-toggle="tab">
                                                <i class="fa fa-cloud"></i>  룸메이트</a>
                                        </li>
                                        <li>
                                            <a href="#sample-3b" data-toggle="tab">
                                                <i class="fa fa-home"></i>  하우스메이트</a>
                                        </li>
                                        <li class="active">
                                            <a href="#freshman" data-toggle="tab">
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
                        <!-- 공지사항 -->
                        <div class="panel panel-info">
                            <!-- 이슈 시작-->
                            <div class="panel-heading">
                                <h3 class="panel-title">최신 게시글</h3>
                            </div>
                            <div class="widget-box panel-body" style="background-color: white;">
                                <div class="table-responsive">
                                    <table class="table table-hover" style="margin-bottom:0px">
        
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>최신글입니다1</td>
                                                <td>07/19</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>최신글입니다2</td>
                                                <td>08/24</td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>최신글입니다3</td>
                                                <td>10/20</td>
                                            </tr>
                                            <tr style="border-bottom: 1px solid #dddddd;">
                                                <td>4</td>
                                                <td>최신글입니다4</td>
                                                <td>11/15</td>
                                            </tr>
        
                                        </tbody>
                                    </table>
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
	<c:import url ="../../common/footer.jsp"/>
<!-- ==== FOOTER END ==== -->

</body>
</html>