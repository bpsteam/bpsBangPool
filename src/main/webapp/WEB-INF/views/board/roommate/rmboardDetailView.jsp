<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%-- <script src="<c:url value="code.jquery.com/jquery-1.11.1.min.js" />"></script> --%>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
	/* 
	testtest
	
	TEST
	#ultag li {
	    display: inline;
	    padding: 0 30px;
	}
	
	#table th {
	    width: 150px;
	
	}
	//하이
	//바이
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

                            <h1 style="text-align: center;"><small>ROOMMATE 게시판</small></h1>
                            <div class="margin-bottom-10">
                                <hr>
                            </div>
                            <div class="panel panel-default view-head no-attach">
                                <div class="panel-heading" style="border-bottom: none;">
                                    <div class="font-12 text-muted">
                                        <i class="fa fa-user"></i>
                                        <span class="sv_member">${ rboard.rbWriter}</span> 
                                        <span class="hidden-xs">
                                            <span class="sp"></span>
                                            <i class="fa fa-tag"></i> ${ rboard.rLocation} </span>

                                        <span class="sp"></span>
                                        <i class="fa fa-comment"></i>
                                        <!-- 댓글count -->
                                        <!-- <b style="color:red">4</b> -->
                                        <b style="color:red" id="rCount"></b>
                                        <span class="sp"></span>
                                        <i class="fa fa-eye"></i>${ rboard.rbCount}
                                        <span class="pull-right">
                                            <i class="fa fa-clock-o"></i>
                                         ${ rboard.rbCreateDate} </span>
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
                                            <!-- <font color="006699"><b>매너인만</b></font> -->
                                            <font color="006699"><b>${ rboard.rbTitle}</b></font>
                                        </div>
                                        <div style="both:clear;">
                                        </div>

                                        <div
                                            style="text-align:center;background-color:#eaeaea;height:30px;width:20%;float:left;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            <b>작성자</b>
                                        </div>
                                        <div
                                            style="float:left;width:30%;height:30px;padding-left:20px;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            	${ rboard.rbWriter} </div>
                                        <div
                                            style="text-align:center;background-color:#eaeaea;height:30px;width:20%;float:left;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            <b>작성일자</b>
                                        </div>
                                        <div
                                            style="float:left;width:30%;height:30px;padding-left:20px;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            <!-- 19-09-02 </div> -->
                                            ${ rboard.rbCreateDate} </div>
                                        <div style="both:clear;">
                                        </div>

                                        <div
                                            style="text-align:center;background-color:#eaeaea;height:30px;width:20%;float:left;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            <b>게시물구분</b>
                                        </div>
                                        <div
                                            style="float:left;width:30%;height:30px;padding-left:20px;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            	<!-- 세놓아요 </div> -->
                                            	${ rboard.bcode} </div>
                                        <div
                                            style="text-align:center;background-color:#eaeaea;height:30px;width:20%;float:left;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            <b>조회건수</b>
                                        </div>
                                        <div
                                            style="float:left;width:30%;height:30px;padding-left:20px;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            <!-- 128 -->
                                            ${ rboard.rbCount}
                                        </div>
                                        <div style="both:clear;">
                                        </div>

                                        <div
                                            style="text-align:center;background-color:#eaeaea;height:30px;width:20%;float:left;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            <b>게시자 성별</b>
                                        </div>
                                        <!-- 여기 -->
                                        <div
                                            style="float:left;width:30%;height:30px;padding-left:20px;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            	여자 </div>
                                        <div
                                            style="text-align:center;background-color:#eaeaea;height:30px;width:20%;float:left;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            <b>상대 성별</b>
                                        </div>
                                        <div
                                            style="float:left;width:30%;height:30px;padding-left:20px;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            	${ rboard.rReqGender } </div>
                                        <div style="both:clear;">
                                        </div>

                                        <div
                                            style="text-align:center;background-color:#eaeaea;height:30px;width:20%;float:left;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            <b>핸드폰번호</b>
                                        </div>
                                        <div
                                            style="float:left;width:30%;height:30px;padding-left:20px;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            010-000-0000 </div>
                                        <div
                                            style="text-align:center;background-color:#eaeaea;height:30px;width:20%;float:left;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            <b>지역구분</b>
                                        </div>
                                        <div
                                            style="float:left;width:30%;height:30px;padding-left:20px;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            	<!-- 대구/경북 </div> -->
                                            	${ rboard.rLocation} </div>
                                        <div style="both:clear;">
                                        </div>

                                        <%-- <div
                                            style="text-align:center;background-color:#eaeaea;height:30px;width:20%;float:left;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            <b>거주지구분</b>
                                        </div>
                                        <div
                                            style="float:left;width:80%;height:30px;padding-left:20px;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            	<!-- 아파트 </div> -->
                                            	${ rboard.rLivingType} </div>
                                        <div style="both:clear;">
                                        </div> --%>
                                        
                                        <div
                                            style="text-align:center;background-color:#eaeaea;height:30px;width:20%;float:left;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            <b>거주지구분</b>
                                        </div>
                                        <div
                                            style="float:left;width:30%;height:30px;padding-left:20px;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            ${ rboard.rLivingType} </div>
                                        <div
                                            style="text-align:center;background-color:#eaeaea;height:30px;width:20%;float:left;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            <b>첨부파일</b>
                                        </div>
                                        <div
                                            style="float:left;width:30%;height:30px;padding-left:20px;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            	<a href="${ contextPath }/resources/rmboarduploads/${ rboard.renameFileName }" download="${ rboard.originalFileName }">${ rboard.originalFileName }</a>
												<!-- a태그 안에서 다운로드 받을 것이 있을 때 쓰는 속성 download, 얘는 download="fileName" 이라고 해서 fileName을 지정해줄 수 있다. --> </div>
                                        <div style="both:clear;">
                                        </div>
                                        

                                    </div>

                                    <div class="view-content" style="padding:0px 15px 20px; margin-top:200px">
                                    	${ rboard.rbContent} 
                                    	<br><br><br>
                                    	<img src="${ contextPath }/resources/rmboarduploads/${ rboard.renameFileName }">
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
                                            <div class="carousel slide testimonials" id="replyDiv">

                                                <div class=" col-md-12">
                                                    <p>댓글입력하면 보여주기</p>
                                                    <%-- <p>${ reply.rContent }</p> --%>
                                                    <div class="testimonial-info">
                                                        <img alt="" src="${contextPath}/resources/assets/img/profiles/53.jpg"
                                                            class="img-circle img-responsive">
                                                        <!-- <span class="testimonial-author">닉네임1 -->
                                                        <span class="testimonial-author">${ rboard.rbWriter }
                                                            <em>
                                                                2019년 07월 21일 12시 43분 12초
                                                            </em>
                                                        </span>
                                                    </div>
                                                    <br>
                                                </div>

                                                <div class="col-md-1"></div>
                                                <div class="testimonials-bg-primary col-md-11">
                                                    <p>댓글의 댓글 입력하면 보여주기</p>
                                                    <div class="testimonial-info">
                                                        <img alt="" src="${contextPath}/resources/assets/img/profiles/78.jpg"
                                                            class="img-circle img-responsive">
                                                        <span class="testimonial-author">댓글의 댓글 -1
                                                            <em>
                                                                2019년 07월 21일 12시 43분 12초
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

                                                <!-- </div> -->
                                            </div>
                                            <div class="testimonials-arrows pull-right">
                                                <a class="left" href="#testimonials1" data-slide="prev">
                                                    <span class="fa fa-arrow-left"></span>
                                                </a>
                                                <a class="right" href="#testimonials1" data-slide="next">
                                                    <span class="fa fa-arrow-right"></span>
                                                </a>
                                                <div class="clearfix"></div>
                                            </div>
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
                                            <input type="text" id="rContent" style="width:80%">&nbsp;&nbsp;&nbsp;
                                            <button class="btn btn-primary btn-sm" id="rSubmit">추가</button>
                                        </div>
                                    </div>
                                    <div class="margin-bottom-10">
                                            <hr style="margin:0px; height:10px;">
                                        </div>
                                </div>
                                <div class="print-hide view-btn text-right"
                                    style="background-color: white; padding-right: 15px; padding-bottom: 15px;">
                                    <div class="form-group">
                                    
                                    	<c:url var="bdelete" value="bdelete.rm">
                                    		<c:param name="rbId" value="${ rboard.rbId }"></c:param>
                                    	</c:url>
                                        <a href="${ bdelete }" class="btn btn-danger btn-sm" >
                                            <i class="fa fa-times"></i><span class="hidden-xs"> 삭제</span>
                                        </a>
                                        
                                        <c:url var="bupView" value="bupView.rm">
                                    		<c:param name="rbId" value="${ rboard.rbId }"></c:param>
                                    	</c:url>
                                        <a href="${ bupView }" class="btn btn-warning btn-sm" >
                                            <i class="fa fa-plus"></i><span class="hidden-xs"> 수정</span>
                                        </a>
                                        
                                        <a href="blist.rm" class="btn btn-success btn-sm">
                                            <i class="fa fa-bars"></i><span class="hidden-xs"> 목록</span>
                                        </a>
                                        
                                        <a href="binsertview.rm" class="btn btn-info btn-sm">
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

    </div>
    <!-- === END CONTENT === -->
    
    
    <script>
		$(function(){
			getReplyList();
		 	
			setInterval(function(){
				getReplyList();
			}, 10000); 
		});
		
		$("#rSubmit").on("click", function(){
			var rContent = $("#rContent").val();
			var refbId = ${ rboard.rbId };
			var bCode ="${ rboard.bcode }";
			console.log(bCode);
			
			$.ajax({
				url: "addReply.rm",
				data: {rContent:rContent, refbId:refbId, bCode:bCode},
				type: "post",
				success: function(data){
					if(data == "success"){
						
						//alert('성공');
						getReplyList();
						$("#rContent").val("");
					}
				}
			});
		});
		
		function getReplyList(){
			var rbId = ${ rboard.rbId };
			
			
			$.ajax({
				url: "rList.rm",
				data: {rbId:rbId},
				dataType : "json",
				success: function(data){
					$replyDiv = $("#replyDiv");
	   				$replyDiv.html("");
	   				console.log(rbId);
					var $rWriter;
					var $rimg;
					var $rCreateDate;
					var $replyContent;
					
					//$("#rCount").text("댓글 ("+data.length + ")");
					$("#rCount").text(data.length);
					
					console.log(data);
					console.log(data.length);
					if(data.length > 0){
						for(var i in data){
							$firDiv = $("<div>").addClass("col-md-12");
							$replyContent = $("<p>").text(decodeURIComponent(data[i].rContent.replace(/\+/g, " ")));
							$secDiv = $("<div>").addClass("testimonial-info");
							$rimg = $("<img>").addClass("img-circle img-responsive img-sm").attr('src','${contextPath}/resources/assets/img/profiles/53.jpg').width( '10%' ).height('10%');
							$rWriter = $("<span>").addClass("testimonial-author").text(data[i].rWriter);
							$rCreateDate = $("<em>").text(data[i].rCreateDate);
							
							$firDiv.append($replyContent);
							$secDiv.append($rimg);
							$secDiv.append($rWriter);
							$secDiv.append($rCreateDate);
							$firDiv.append($secDiv);
							$replyDiv.append($firDiv);
						}
					}else{
						$firDiv = $("<div>").addClass("col-md-12");
						$replyContent = $("<p>").text("등록된 댓글이 없습니다.");
						
						$firDiv.append($replyContent);
						$replyDiv.append($firDiv);
					}
				}
			});
			
		}
		
		
		/* function getReplyList(){
			var rbId = ${ rboard.rbId };
			
			$.ajax({
				url: "rList.rm",
				data: {rbId:rbId},
				dataType : "json",
				success: function(data){
					$tableBody = $("#rtb tbody");
					$tableBody.html("");
					
					var $tr;
					var $rWriter;
					var $rContent;
					var $rCreateDate;
					
					$("#rCount").text("댓글 ("+data.length + ")");
					
					if(data.length > 0){
						for(var i in data){
							$tr = $("<tr>");
							$rWriter = $("<td width='100'>").text(data[i].rWriter);
							$rContent = $("<td>").text(decodeURIComponent(data[i].rContent.replace(/\+/g, " ")));
							$rCreateDate = $("<td width='100'>").text(data[i].rCreateDate);
							
							$tr.append($rWriter);
							$tr.append($rContent);
							$tr.append($rCreateDate);
							$tableBody.append($tr);
							
						}
					}else{
						$tr = $("<tr>");
						$rContent = $("<td colspan='3'>").text("등록된 댓글이 없습니다.");
						
						$tr.append($rContent);
						$tableBody.append($tr);
					}
				}
			});
			
		} */
		
		
	</script>
    

<!-- ==== FOOTER START ==== -->
	<c:import url ="../../common/footer.jsp"/>
<!-- ==== FOOTER END ==== -->

</body>
</html>