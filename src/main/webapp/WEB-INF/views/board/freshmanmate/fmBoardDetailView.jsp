<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
	/* #ultag li {
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
	    border-bottom: 1px solid #dddddd;
	}
	
	#form label {
	    margin-top: 5px;
	}
	</style>


</head>
<body>

<!-- ==== HEADER START ==== -->
	<c:import url ="../../common/header.jsp"/>
<!-- ==== HEADER END ==== -->



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

                            <h1 style="text-align: center;"><small>${ board.fbTitle }</small></h1>
                         
                            <div class="margin-bottom-10">
                                <hr>
                            </div>
                            <div class="panel panel-default view-head no-attach">
                                <div class="panel-heading" style="border-bottom: none;">
                                    <div class="font-12 text-muted">
                                        <i class="fa fa-user"></i>
                                        <span class="sv_member">${ board.fbWriter }</span> <span class="hidden-xs">
                                            <span class="sp"></span>
                                            <i class="fa fa-tag"></i>
                                            ${ board.fLocation } </span>

                                        <span class="sp"></span>
                                        <i class="fa fa-comment"></i>
                                        <b style="color:red" id="rCount"></b>
                                        <span class="sp"></span>
                                        <i class="fa fa-eye"></i>
                                        ${ board.fbCount }
                                        <span class="pull-right">
                                            <i class="fa fa-clock-o"></i>
                                            ${ board.fbCreateDate }</span>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-brown">
                                <div class="panel-body" style="background-color: white;">
                                    <div style="width:100%;">


                                        <div
                                            style="text-align:center;background-color:#eaeaea;height:30px;width:20%;float:left;padding-top:5px;border:1px solid #dddddd;">
                                            <b>학교인증 이메일 </b>
                                        </div>
                                        <div
                                            style="float:left;width:80%;height:30px;padding-left:20px;padding-top:5px;border:1px solid #dddddd;">
                                            <font color="006699"><b>${ board.schoolemail }</b></font>
                                        </div>
                                        <div style="both:clear;">
                                        </div>

                                        <div
                                            style="text-align:center;background-color:#eaeaea;height:30px;width:20%;float:left;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            <b>지역</b>
                                        </div>
                                        <div
                                            style="float:left;width:30%;height:30px;padding-left:20px;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            ${ board.fLocation } </div>
                                        <div
                                            style="text-align:center;background-color:#eaeaea;height:30px;width:20%;float:left;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            <b>층수</b>
                                        </div>
                                        <div
                                            style="float:left;width:30%;height:30px;padding-left:20px;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            ${ board.fFloor } </div>
                                        <div style="both:clear;">
                                        </div>

                                        <div
                                            style="text-align:center;background-color:#eaeaea;height:30px;width:20%;float:left;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            <b>매물구분</b>
                                        </div>
                                        <div
                                            style="float:left;width:30%;height:30px;padding-left:20px;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            ${ board.fRentType } </div>
                                        <div
                                            style="text-align:center;background-color:#eaeaea;height:30px;width:20%;float:left;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            <b>방개수</b>
                                        </div>
                                        <div
                                            style="float:left;width:30%;height:30px;padding-left:20px;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            ${ board.fRoomCount }
                                        </div>
                                        <div style="both:clear;">
                                        </div>

                                        <div
                                            style="text-align:center;background-color:#eaeaea;height:30px;width:20%;float:left;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            <b>거주지형태</b>
                                        </div>
                                        <div
                                            style="float:left;width:30%;height:30px;padding-left:20px;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                           ${ board.fLivingType }</div>
                                        <div
                                            style="text-align:center;background-color:#eaeaea;height:30px;width:20%;float:left;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            <b>본인 성별</b>
                                        </div>
                                        <div
                                            style="float:left;width:30%;height:30px;padding-left:20px;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            ${ loginUser.gender } </div>
                                        <div style="both:clear;">
                                        </div>

                                        <div
                                            style="text-align:center;background-color:#eaeaea;height:30px;width:20%;float:left;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            <b>연락가능번호</b>
                                        </div>
                                        <div
                                            style="float:left;width:30%;height:30px;padding-left:20px;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            ${ board.contactInfo } </div>
                                        <div
                                            style="text-align:center;background-color:#eaeaea;height:30px;width:20%;float:left;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            <b>상대 성별</b>
                                        </div>
                                        <div
                                            style="float:left;width:30%;height:30px;padding-left:20px;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            ${ board.fReqGender } </div>
                                        <div style="both:clear;">
                                        </div>

                                        <div
                                            style="text-align:center;background-color:#eaeaea;height:30px;width:20%;float:left;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            <b>거래금액</b>
                                        </div>
                                        <div
                                            style="float:left;width:80%;height:30px;padding-left:20px;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            ${ board.fPrice }</div>
                                        <div style="both:clear;">
                                        </div>

                                    </div>

                                    <div class="view-content" style="padding:0px 15px 20px; margin-top:200px">
                                      <br>
                                      ${ board.fbContent }
                                      
                                      <br><br><br><br><br><br>
                                      <c:if test="${ !empty rename0 }">
                                      <br> <img src="${contextPath}/resources/fmboarduploads/${rename0}">
                                    	</c:if>
                                      <c:if test="${ !empty rename1 }">
                                      <br><br><br> <img src="${contextPath}/resources/fmboarduploads/${rename1}">
                                    	</c:if>
                                      <c:if test="${ !empty rename2 }">
                                      <br><br><br> <img src="${contextPath}/resources/fmboarduploads/${rename2}">
                                    	</c:if>
                                    </div>

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
                                            <div class="carousel slide testimonials" id="allCommentdiv">

                                               <%--  <div class=" col-md-12" id="oneCommentdiv">
                                                    <p>
                                                        댓글입력하면 보여주기
                                                    </p>
                                                    <div class="testimonial-info" id="infodiv">
                                                        <img alt="" src="${contextPath}/resources/assets/img/profiles/53.jpg"
                                                            class="img-circle img-responsive">
                                                        <span class="testimonial-author" id="nameNtime">
                                                            닉네임1
                                                            <em>
                                                                2019년 07월 21일 12시 43분 12초
                                                            </em>
                                                        </span>
                                                    </div>
                                                    <br>
                                                </div> --%>
                                                
                                                
<%-- 			댓글의 댓글 부분 
                                                <div class="col-md-1" id="tabSpace"></div>
                                                <div class="testimonials-bg-primary col-md-11" id="oneReplydiv">
                                                    <p>
                                                        댓글의 댓글 입력하면 보여주기
                                                    </p>
                                                    <div class="testimonial-info" id="rInfodiv">
                                                        <img alt="" src="${contextPath}/resources/assets/img/profiles/78.jpg"
                                                            class="img-circle img-responsive">
                                                        <span class="testimonial-author" id="rNameNtime">
                                                            댓글의 댓글 -1
                                                            <em>
                                                                2019년 07월 21일 12시 43분 12초
                                                            </em>
                                                        </span>
                                                    </div>
                                                    <br>
                                                </div>
 --%>

                                               <%--  <div class="col-md-12">
                                                    <p>
                                                        댓글입력하면 보여주기
                                                    </p>
                                                    <div class="testimonial-info">
                                                        <img alt="" src="${contextPath}/resources/assets/img/profiles/99.jpg"
                                                            class="img-circle img-responsive">
                                                        <span class="testimonial-author">
                                                            닉네임2
                                                            <em>
                                                                2019년 09월 12일 8시 12분 34초
                                                            </em>
                                                        </span>
                                                    </div>
                                                    <br>
                                                </div>


                                                <div class="col-md-12">
                                                    <p>
                                                        댓글입력하면 보여주기
                                                    </p>
                                                    <div class="testimonial-info">
                                                        <img alt="" src="${contextPath}/resources/assets/img/profiles/78.jpg"
                                                            class="img-circle img-responsive">
                                                        <span class="testimonial-author">
                                                            닉네임3
                                                            <em>
                                                                2019년 10월 23일 20시 23분 04초
                                                            </em>
                                                        </span>
                                                    </div>
                                                    <br>
                                                </div>
 --%>
                                                <!-- </div> -->
                                            </div>
                                         <!--    <div class="testimonials-arrows pull-right">
                                                <a class="left" href="#testimonials1" data-slide="prev">
                                                    <span class="fa fa-arrow-left"></span>
                                                </a>
                                                <a class="right" href="#testimonials1" data-slide="next">
                                                    <span class="fa fa-arrow-right"></span>
                                                </a>
                                                <div class="clearfix"></div>
                                            </div> -->
                                        </div>
                                        <!-- End Testimonials - default full width -->
                                    </div>
                                    
                                    <div class="margin-bottom-10">
                                        <hr style="margin:0px; height:10px">
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-3"style="text-align: center;">
                                            <label >댓글 입력</label>
                                        </div>
                                        <div class="col-sm-9">
                                            <input type="text" id="rContent" style="width:80%">
                                            &nbsp;&nbsp;&nbsp;
                                            <button class="btn btn-primary btn-sm" id="rSubmit">추가</button>
                                        </div>
                                    </div>
                                    <div class="margin-bottom-10">
                                            <hr style="margin:0px; height:10px;">
                                        </div>
                                </div>
                                
                               <c:url var="bupView" value="bupView.fm">
	                           <c:param name="fbId" value="${ board.fbId }"/>
	                           <%--   <c:param name="page" value="${ page }"/> --%>
	                           </c:url>
                               <c:url var="bdelete" value="bdelete.fm">
	                           <c:param name="fbId" value="${ board.fbId }"/>
	                            <%--  <c:param name="page" value="${ page }"/> --%>
	                           </c:url>
                               <c:url var="blist" value="blist.fm">
	                           <c:param name="fLocation" value="${ board.fLocation }"/>
	                            <%--  <c:param name="page" value="${ page }"/> --%>
	                           </c:url>
                                
                                <div class="print-hide view-btn text-right"
                                    style="background-color: white; padding-right: 15px; padding-bottom: 15px;">
                                    <div class="form-group">
                                        <a href="${ bdelete }" class="btn btn-danger btn-sm" >
                                            <i class="fa fa-times"></i><span class="hidden-xs"> 삭제</span>
                                        </a>
                                        <a href="${ bupView }" class="btn btn-warning btn-sm" >
                                            <i class="fa fa-plus"></i><span class="hidden-xs"> 수정</span>
                                        </a>
                                        
                                        <a href="${ blist }" class="btn btn-success btn-sm">
                                            <i class="fa fa-bars"></i><span class="hidden-xs"> 목록</span>
                                        </a>
                                        
                                        <a href="insertview.fm" class="btn btn-info btn-sm">
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
                                            <i class="fa fa-cloud"></i> 룸메이트</a>
                                    </li>
                                    <li>
                                        <a href="#sample-3b" data-toggle="tab">
                                            <i class="fa fa-home"></i> 하우스메이트</a>
                                    </li>
                                    <li class="active">
                                        <a href="#sample-3c" data-toggle="tab">
                                            <i class="fa fa-comments"></i> 신입생메이트</a>
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
                            <div class="panel-body" style="background-color: white;">
                                <div class="table-responsive">
                                    <table class="table table-hover" style="margin-bottom:0px">

                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>공지사항입니다1</td>
                                                <td>07/19</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>공지사항입니다2</td>
                                                <td>08/24</td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>공지사항입니다3</td>
                                                <td>10/20</td>
                                            </tr>
                                            <tr style="border-bottom: 1px solid #dddddd;">
                                                <td>4</td>
                                                <td>공지사항입니다4</td>
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
                </div>
                <!-- End Side Column -->
            </div>
        </div>

        <div class="margin-bottom-30">
            <hr>
        </div>

    <!-- === END CONTENT === -->


<!-- ==== FOOTER START ==== -->
	<c:import url ="../../common/footer.jsp"/>
<!-- ==== FOOTER END ==== -->

	<script>
	
	$(function(){
   		getReplyList();
   		
   		/* setInterval(function(){
   			getReplyList();
   		}, 10000); */
   	});
	
		$("#rSubmit").on("click",function(){
	   		var rContent = $("#rContent").val();
	   		var refbId = ${board.fbId};
	   		console.log(refbId);
	   		$.ajax({
	   			url: "addReply.fm",
	   			data: {rContent:rContent, refbId: refbId},
	   			type: "post",
	   			success: function(data){
	   				if(data == "success"){
	   					getReplyList();
	   					$("#rContent").val("");
	   				}
	   			}
	   			
	   		});
	   	});
		
		
		function getReplyList(){
	   		var fbId = ${ board.fbId };
	   		var nickname = "${ loginUser.nickname }";
	   		
	   		$.ajax({
	   			url: "rList.fm",
	   			data: {fbId:fbId},
	   			dataType: "json",
	   			success: function(data){
	   				$allCommentdiv = $("#allCommentdiv");
	   				$allCommentdiv.html(""); // div 안의 html 모두 지우기 
	   				
	   				var $oneCommentdiv;
	   				var $rContent;
	   				var $infodiv;
	   				var $img;
	   				var $nameNtime;
	   				
	   				var $rContent;
	   				var $rCreateDate;
	   				
	   				$("#rCount").text(data.length);
	   				
	   				if(data.length >0){
	   					for(var i in data){
	   						$oneCommentdiv = $("<div>").addClass("col-md-12");
	   						$rContent = $("<p>").text(decodeURIComponent(data[i].rContent.replace(/\+/g, " ")));
	   						$infodiv = $("<div>").addClass("testimonial-info");
	   						$img = $("<img>").addClass("img-circle img-responsive").attr('src','${contextPath}/resources/assets/img/profiles/userimg.jpg').attr('width','80px');
	   						$nameNtime =$("<span>").addClass("testimonial-author").text(data[i].rWriter);
	   						$deleteitag=$("<i>").addClass("fa fa-times");
	   						$deletebutton=$("<a>").addClass("btn btn-danger btn-xs").append($deleteitag)
	   										.css('float','right').css('width', '22px')
	   										.attr('href','rdelete.fm?rId='+data[i].rId+"&refbId="+data[i].refbId);
	   						$time = $("<em>").text(data[i].rCreateDate);
	   						
	   						if(nickname == data[i].rWriter ){
		   						$time.append($deletebutton);	
	   						}
	   						$oneCommentdiv.append($rContent);
	   						$oneCommentdiv.append($infodiv.append($img).append($nameNtime.append($time))
	   														.append("<br>"));
	   						$allCommentdiv.append($oneCommentdiv);
	   						
	   						
	   					/* 	
	   					 <div class="carousel slide testimonials" id="allCommentdiv">

                         <div class=" col-md-12" id="oneCommentdiv">
                             <p>
                                 댓글입력하면 보여주기
                             </p>
                             <div class="testimonial-info" id="infodiv">
                                 <img alt="" src="${contextPath}/resources/assets/img/profiles/53.jpg"
                                     class="img-circle img-responsive">
                                 <span class="testimonial-author" id="nameNtime">
                                     닉네임1
                                     <em>
                                         2019년 07월 21일 12시 43분 12초
                                     </em>
                                 </span>
                                 <a href="rdelete.fm?fbid= rid" class="btn btn-danger btn-sm" >
                                 <i class="fa fa-times"></i><span class="hidden-xs"> 삭제</span>
                             </a>
                             </div>
                             <br>
                         </div> */
	   					}
	   				}else{
	   					$oneCommentdiv = $("<div>").addClass("col-md-12");
	   					$rContent = $("<p>").text("등록된 댓글이 없습니다.");
	   					$infodiv = $("<div>").addClass("testimonial-info");
   						$img = $("<img>").addClass("img-circle img-responsive").attr('src','${contextPath}/resources/assets/img/profiles/53.jpg').attr('width','80px');
   						$admin =$("<span>").addClass("testimonial-author").text("관리자");
	   					
   						$oneCommentdiv.append($rContent);
   					/* 	$oneCommentdiv.append($infodiv.append($img).append($admin)); */
   						
   						$allCommentdiv.append($oneCommentdiv);
   						
	   					
	   					
	   				}
	   			}
	   		});
	   		
		}
	</script>

</body>
</html>