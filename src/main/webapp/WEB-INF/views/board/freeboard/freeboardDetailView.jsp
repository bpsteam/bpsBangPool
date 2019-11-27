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

                            <h1 style="text-align: center;"><small>${ frboard.frbTitle }</small></h1>
                            <div class="margin-bottom-10">
                                <hr>
                            </div>
                            <div class="panel panel-default view-head no-attach">
                                <div class="panel-heading" style="border-bottom: none;">
                                    <div class="font-12 text-muted">
                                        <i class="fa fa-user"></i>
                                        <span class="sv_member">${ frboard.frbWriter }</span> 
                                        <%-- <span class="hidden-xs">
                                            <span class="sp"></span>
                                            <i class="fa fa-tag"></i>
                                            ${ hboard.hLocation } 
                                        </span> --%>
                                        <span class="sp"></span>
                                        <i class="fa fa-comment"></i>
                                        <b style="color:red">4</b>
                                        <span class="sp"></span>
                                        <i class="fa fa-eye"></i>${ frboard.frbCount }
                                        <span class="pull-right">
                                        	<i class="fa fa-clock-o"></i>${ frboard.frbCreateDate }</span>
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
                                            <font color="006699"><b>${ frboard.frbTitle }</b></font>
                                        </div>
                                        <div style="both:clear;">
                                        </div>

                                        <div
                                            style="text-align:center;background-color:#eaeaea;height:30px;width:20%;float:left;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            <b>작성자</b>
                                        </div>
                                        <div
                                            style="float:left;width:30%;height:30px;padding-left:20px;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                       		${ frboard.frbWriter }</div>
                                        <div
                                            style="text-align:center;background-color:#eaeaea;height:30px;width:20%;float:left;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            <b>작성일자</b>
                                        </div>
                                        <div
                                            style="float:left;width:30%;height:30px;padding-left:20px;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            ${ frboard.frbCreateDate } </div>
                                        <div style="both:clear;">
                                        </div>
                                        
                                        <div
                                            style="text-align:center;background-color:#eaeaea;height:30px;width:20%;float:left;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            <b>조회건수</b>
                                        </div>
                                        <div
                                            style="float:left;width:30%;height:30px;padding-left:20px;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            ${ frboard.frbCount }
                                        </div>
                                        <div style="both:clear;">
                                        </div>
                                        
                                        <div style="text-align:center;background-color:#eaeaea;height:30px;width:20%;float:left;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                            <b>첨부파일</b>
                                        </div>
                                        <div style="float:left;width:30%;height:30px;padding-left:20px;padding-top:5px;border:1px solid #dddddd;border-top:0px;">
                                          	  <a href="${ contextPath }/resources/freeBoardUploadFiles/${ frboard.renameFileName }" download="${ frboard.originalFileName }">${ frboard.originalFileName } </a>
                                          	  <c:if test="${ frboard.renameFileName eq null }"> 첨부파일없음 </c:if>
                                         </div>
                                        <div style="both:clear;">
                                        </div>

                                    </div>

                                    <div class="view-content" style="padding:0px 15px 20px; margin-top:200px">
                                       	 ${ frboard.frbContent } <br><br>
                                       	 <c:if test="${ frboard.renameFileName ne null }">
                                       	 	<img src="${ contextPath }/resources/freeBoardUploadFiles/${ frboard.renameFileName }" alt="image1" style="width: 100%; height: 100%;">
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
                                            <div class="carousel slide testimonials" id="replyDiv">

                                                <%--<div class=" col-md-12">
                                                    <p> 댓글입력하면 보여주기</p>
                                                    <div class="testimonial-info">
                                                        <img alt="" src="${contextPath}/resources/assets/img/profiles/53.jpg"
                                                            class="img-circle img-responsive">
                                                        <span class="testimonial-author"> 닉네임1
                                                            <em>
                                                                2019년 07월 21일 12시 43분 12초
                                                            </em>
                                                        </span>
                                                    </div>
                                                    <br>
                                                </div>

                                                 <div class="col-md-1"></div>
                                                <div class="testimonials-bg-primary col-md-11">
                                                    <p>
                                                        댓글의 댓글 입력하면 보여주기
                                                    </p>
                                                    <div class="testimonial-info">
                                                        <img alt="" src="${contextPath}/resources/assets/img/profiles/78.jpg"
                                                            class="img-circle img-responsive">
                                                        <span class="testimonial-author">
                                                            댓글의 댓글 -1
                                                            <em>
                                                                2019년 07월 21일 12시 43분 12초
                                                            </em>
                                                        </span>
                                                    </div>
                                                    <br>
                                                </div>

                                                 --%>

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
                                            <input type="text" id="rContent" style="width:80%">
                                            &nbsp;&nbsp;&nbsp;
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
                                    	<c:url var="deleteboard" value="frbdelete.fr">
                                        	<c:param name="frbId" value="${ frboard.frbId }"/>
                                        </c:url>
                                        <a href="${ deleteboard }" class="btn btn-danger btn-sm" >
                                            <i class="fa fa-times"></i><span class="hidden-xs"> 삭제</span>
                                        </a>
                                        <c:url var="frbUpdateView" value="frbupView.fr">
                                        	<c:param name="frbId" value="${ frboard.frbId }"/>
                                        </c:url>
                                        <a href="${ frbUpdateView }" class="btn btn-warning btn-sm" >
                                            <i class="fa fa-plus"></i><span class="hidden-xs"> 수정</span>
                                        </a>
                                        
                                        <a href="frblist.fr" class="btn btn-success btn-sm">
                                            <i class="fa fa-bars"></i><span class="hidden-xs"> 목록</span>
                                        </a>
                                        
                                        <a href="freeinsertView.fr" class="btn btn-info btn-sm">
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
                                    <li class="active">
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
                                   <c:import url="../../common/recentPosts.jsp"/>
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


<!-- ==== FOOTER START ==== -->
	<c:import url ="../../common/footer.jsp"/>
<!-- ==== FOOTER END ==== -->


	<script>
	$(function(){
		getReplyList();
		setInterval(function(){
			getReplyList();
		},10000	);
	});
	
	function getReplyList(){
   		var hbId = ${ frboard.frbId };
   		
   		$.ajax({
   			url: "frList.fr",
   			data: {hbId:hbId},
   			dataType: "json",
   			success: function(data){
   				$replyDiv = $("#replyDiv");
   				$replyDiv.html("");
   				
   				var $replyContent;
   				var $rCreateDate;
   				var $rimg;
   				var $rWriter;
   				
   				//$("#rCount").text("댓글( " + data.length + ")");
   				
   				if(data.length >0){
   					for (var i in data) {
   						$rDiv = $("<div>").addClass("col-md-12");
   						$replyContent = $("<p>").text(decodeURIComponent(data[i].rContent.replace(/\+/g, " ")));
   						$rrDiv = $("<div>").addClass("testimonial-info");
   						$rimg = $("<img>").addClass("img-circle img-responsive img-sm").attr('src','${contextPath}/resources/assets/img/profiles/53.jpg').width( '10%' ).height('10%');
   						$rWriter = $("<span>").addClass("testimonial-author").text(data[i].rWriter);
   						$rCreateDate = $("<em>").text(data[i].rCreateDate);
   						
   						$rDiv.append($replyContent);
   						$rrDiv.append($rimg);
   						$rrDiv.append($rWriter);
   						$rrDiv.append($rCreateDate);
   						$rDiv.append($rrDiv);
   						$replyDiv.append($rDiv);
   					}
   				} else {
   					$rDiv = $("<div>").addClass("col-md-12");
   					$replyContent = $("<p>").text("등록된 댓글이 없습니다.");
   					
   					$rDiv.append($replyContent);
   					$replyDiv.append($rDiv);
   				}
   			}
   		})
   	}
	
	$("#rSubmit").on("click",function(){
   		var rContent = $("#rContent").val();
   		var refbId = ${frboard.frbId};
   		var bCode = "${frboard.bcode}";
   		console.log(bCode);
   		$.ajax({
   			url: "addReply.fr",
   			data: {rContent:rContent, refbId: refbId, bCode:bCode},
   			type: "post",
   			success: function(data){
   				if(data == "success"){
   					getReplyList();
   					$("#rContent").val("");
   				}
   			}
   			
   		});
   	});
	
	</script>


</body>
</html>