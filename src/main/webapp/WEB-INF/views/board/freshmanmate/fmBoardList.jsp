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
                                                <ul class="nav nav-tabs" id="tabs">
                                                    <li class="active">
                                                        <a href="#all" id="all" data-toggle="tab">전체 </a>
                                                    </li>
                                                    <li>
                                                        <a href="#all" id="서울" data-toggle="tab">서울 </a>
                                                    </li>
                                                    <li>
                                                        <a href="#all" id="인천/부천" data-toggle="tab">인천/부천 </a>
                                                    </li>
                                                    <li>
                                                        <a href="#all" id="수원/경기" data-toggle="tab">수원/경기 </a>
                                                    </li>
                                                    <li>
                                                        <a href="#all" id="대구/경북" data-toggle="tab">대구/경북 </a>
                                                    </li>
                                                    <li>
                                                        <a href="#all" id="부산/경남" data-toggle="tab">부산/경남 </a>
                                                    </li>
                                                    <li>
                                                        <a href="#all" id="충청/강원" data-toggle="tab">충청/강원 </a>
                                                    </li>
                                                    <li>
                                                        <a href="#all" id="광주/전라" data-toggle="tab">광주/전라</a>
                                                    </li>
                                                </ul>
                                                <div class="tab-content">
                                                    <div class="tab-pane fade in active" id="all">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="table-responsive">
                                                                    <table class="table table-hover" >
                                                                        <thead>
                                                                            <tr>
                                                                                <th style="text-align:center">No.</th>
                                                                                <th>분류</th>
                                                                                <th style="width:300px">제목</th>
                                                                                <th>작성자</th>
                                                                                <th style="text-align:center">조회수</th>
                                                                                
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody id="tbody">
                                                                        
                                                                         <c:forEach var = "b" items="${ list }">
                                                                            <tr>
                                                                                <td style="text-align:center">${ b.fbId }</td>
                                                                                <td>${ b.fLocation }</td>
                                                                                 <td align="left">
																		            <c:if test="${ !empty loginUser }">
																		               <c:url var="bdetail" value="bdetail.fm">
																		                  <c:param name="fbId" value="${ b.fbId }"/>
																		                 <%--  <c:param name="page" value="${ pi.currentPage }"/> --%>
																		               </c:url>
																		               <a href="${ bdetail }">${ b.fbTitle }</a>
																		            </c:if>
																		            <c:if test="${ empty loginUser }">
																		               ${ b.fbTitle }      
																		            </c:if>
																		         </td>
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
                            
                                                    
                                                    <!--페이징처리와 버튼-->
                                                    <div class="text-center">
                                                        <ul class="pagination" id="paging">
                                                         <!-- [이전] -->
                                                            <li>
												            <c:if test="${ pi.currentPage <= 1 }">
												              <a> « </a>
												            </c:if>
												            <c:if test="${ pi.currentPage > 1 }">
												               <c:url var="before" value="blist.fm">
												                  <c:param name="page" value="${ pi.currentPage - 1 }"/>
												                  <c:param name="fLocation" value="전체"/>
												               </c:url>
                                                                <a href="${ before }">«</a>
												            </c:if>
                                                            </li>
                                                            
                                                            
                                                             
												            <!-- 페이지 -->
												            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
												               <c:if test="${ p eq pi.currentPage }">
		                                                            <li class="active">
		                                                                <a >${ p }</a>
		                                                            </li>
												               </c:if>
												               
												               <c:if test="${ p ne pi.currentPage }">
												                  <c:url var="pagination" value="blist.fm">
												                     <c:param name="page" value="${ p }"/>
												                  <c:param name="fLocation" value="전체"/>
												                  </c:url>
		                                                            <li>
		                                                                <a href="${ pagination }">${ p }</a>
		                                                            </li>
												               </c:if>
												            </c:forEach>
                                                            
                                                              <!-- [다음] -->
                                                            <li>
													            <c:if test="${ pi.currentPage >= pi.maxPage }">
													               <a>»</a>
													            </c:if>
													            <c:if test="${ pi.currentPage < pi.maxPage }">
													               <c:url var="after" value="blist.fm">
													                  <c:param name="page" value="${ pi.currentPage + 1 }"/>
												                  <c:param name="fLocation" value="전체"/>
													               </c:url> 
                                                               		 <a href="${ after }">»</a>
													            </c:if>
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
                                            <input type="text" name="stx" value="" required id="stx" class="form-control input-sm" maxlength="20" placeholder="검색어">
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


<!--  SCRIPT  -->
<script>

// 탭 액티브처리하는 코드 진행중
	$(function(){
		var location = "${ location }";
		console.log("나와? " + location);
		
		if(location != ""){
			var val = $("#tabs a").text().split(" ");
			console.log("location is not null");
			for(var i in val){
				if(val[i]==location){
					console.log(val[i]);
					var idval=val[i];
					document.getelementById(idval);
					
				}
			}
			//$("#tabs li").attr('class','active');
		}else{
			console.log("location is null");
		}
	});



	$("#tabs a").on("click",function(){
		var location =$(this).text();
		console.log(location);
		
		// paging 
		var currentPage="${ pi.currentPage }";
		var listCount="${ pi.listCount }";  
		var pageLimit="${ pi.pageLimit }";  
		var maxPage="${ pi.maxPage }";    
		var startPage="${ pi.startPage }";  
		var endPage="${ pi.endPage }";    
		
		var boardLimit="${ pi.boardLimit }";
		
		console.log("ajax전: " +currentPage+" "+listCount+" "+pageLimit+" "+maxPage+" "+startPage+" "+endPage+" "+boardLimit);
		
			$.ajax({
	   			url: "tablist.fm",
	   			data: {fLocation:location, currentPage:currentPage, listCount:listCount,
	   					pageLimit:pageLimit, maxPage:maxPage, startPage:startPage, 
	   					endPage:endPage, boardLimit:boardLimit
	   					},
	   			type: "post",
	   			dataType: "json",
	   			success: function(data){
   					console.log(data);
   				//	console.log("${pi}");
   				//	console.log("list 출력 : " +data);
   					
   					var $tbody;
   					var $tr;
					var $fbid;
					var $flocation;
					var $fbtitle;
					var $atag;
					var $fbWriter;
					var $fbCount;
					
					var loginUser = "${ loginUser }";
   					console.log(loginUser);
   					
	   				
	   				$tbody = $("#tbody");
	   				$tbody.html("");
	   					for(var i in data.list){
   				
	   					/* 	console.log(data.list[i]); */
   						fbId = data.list[i].fbId;
	   						/* console.log(data.list[0].currentPage); */
	   					//	console.log(data);
	   					
		   					$tr = $("<tr>");
		   					$fbid=$("<td text-align:'center'>").text(data.list[i].fbId);
		   					$flocation=$("<td>").text(data.list[i].fLocation);
		   					
		   					$fbtitle = $("<td align='left'>");
		   					if(loginUser != ""){
		   						console.log("왜 여기 타?");
		   						$atag=$("<a>").attr('href','bdetail.fm?fbId='+fbId);
		   						$atag.text(data.list[i].fbTitle);
		   						$fbtitle.append($atag);
		   					}else{
		   						$fbtitle.text(data.list[i].fbTitle);
		   					}
		   					
		   					$fbWriter=$("<td>").text(data.list[i].fbWriter);
		   					$fbCount=$("<td text-align:'center'>").text(data.list[i].fbCount);
		   					
		   					$tr.append($fbid);
		   					$tr.append($flocation);
		   					$tr.append($fbtitle);
		   					$tr.append($fbWriter);
		   					$tr.append($fbCount);
	   					
		   					$tbody.append($tr);
	   					 }
	   					
	   				// 페이징
	   				$pagingul = $("#paging");
	   				$pagingul.html("");
	   				
	   				var tt = data.list[0];
	   				console.log("data.list[0] : "+tt);
	   				
	   				startPage=data.list[0].startPage;
	   				currentPage=data.list[0].currentPage;
	   				listCount=data.list[0].listCount;  
	   				pageLimit=data.list[0].pageLimit;  
	   				maxPage=data.list[0].maxPage;    
	   				endPage=data.list[0].endPage;    
	   				
	   				boardLimit=data.list[0].boardLimit;
	   				
	   				console.log("ajax : "+currentPage+" "+listCount+" "+pageLimit+" "+maxPage+" "+startPage+" "+endPage+" "+boardLimit);
	   				
	   			
	   				$previousli = $("<li>");
	   				if(currentPage <= 1){
	   					$least=$("<a>").text("«");
	   					$previousli.append($least);
	   				}else{
	   					$previousatag = $("<a>").attr('href','blist.fm?page='+(currentPage-1)+'&fLocation='+location).text("«");
	   					$previousli.append($previousatag);
	   				}
	   				$pagingul.append($previousli);
	   				
	   				$numliactive=$("<li>").addClass("active");
	   				$numli=$("<li>");
	   			   for (var startPage ; startPage<=endPage ; startPage++){
                  	 if(startPage==currentPage){
                  		 $activepagenum = $("<a>").text(startPage);
                  		 $numliactive.append($activepagenum);
                  		 $pagingul.append($numliactive);
                  		 
                  	 }else{
                  		 $pagenum=$("<a>").attr('href','blist.fm?page='+startPage+'&fLocation='+location).text(startPage);
                  		 $numli.append($pagenum);
                  		 $pagingul.append($numli);
                  	 }
                   }
                              
             	  $nextli=$("<li>");
				  if(currentPage>=maxPage){
					  $nextatag=$("<a>").text("»");
					  $nextli.append($nextatag);
				  }else{
					  $maxatag=$("<a>").attr('href','blist.fm?page='+(currentPage+1)+'&fLocation='+location).text("»");
					  $nextli.append($maxatag);
				  }
				  
				  $pagingul.append($nextli);
				  
	   				   /* <!--페이징처리와 버튼-->
                        <div class="text-center">
                            <ul class="pagination" id="paging">
                             <!-- [이전] -->
                                <li>
					            <c:if test="${ pi.currentPage <= 1 }">
					              <a> « </a>
					            </c:if>
					            <c:if test="${ pi.currentPage > 1 }">
					               <c:url var="before" value="blist.fm">
					                  <c:param name="page" value="${ pi.currentPage - 1 }"/>
					                  <c:param name="fLocation" value="전체"/>
					               </c:url>
                                    <a href="${ before }">«</a>
					            </c:if>
                                </li>*/
                                
                  
                                 
					    /*         <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					               <c:if test="${ p eq pi.currentPage }">
                                        <li class="active">
                                            <a >${ p }</a>
                                        </li>
					               </c:if>
					               
					               <c:if test="${ p ne pi.currentPage }">
					                  <c:url var="pagination" value="blist.fm">
					                     <c:param name="page" value="${ p }"/>
					                  <c:param name="fLocation" value="전체"/>
					                  </c:url>
                                        <li>
                                            <a href="${ pagination }">${ p }</a>
                                        </li>
					               </c:if>
					            </c:forEach>*/
                       
				
		            
					 
                             /*   <li>
						            <c:if test="${ pi.currentPage >= pi.maxPage }">
						               <a>»</a>
						            </c:if>
						            <c:if test="${ pi.currentPage < pi.maxPage }">
						               <c:url var="after" value="blist.fm">
						                  <c:param name="page" value="${ pi.currentPage + 1 }"/>
					                  <c:param name="fLocation" value="전체"/>
						               </c:url> 
                                   		 <a href="${ after }">»</a>
						            </c:if>
                                </li>
                               
                            </ul> */
                            
                            
	   				},
	   				error: function(data){
	   					console.log('dpfjekdpfj!!!');
	   					console.log(data);
	   				}
	   			
	   		}); 
	   	});
	
	
	
	
	</script>
</body>
</html>