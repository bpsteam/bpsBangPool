<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		
		tr{
			padding-top: 10px;
		    background-color: #f4f4f4;
		    margin-top: 10px;
		    border-radius: 0.5em;
		}
		
		td{
			style="word-break:break-all";
		}
		
		#rWriter_form{
			width: 13%;
		}
		
		#rContent_form{
			padding: 10px;
		}
		
	    #reply_list{
	    	width : 100%;
		    padding-top: 10px;
		    background-color: #f4f4f4;
		    margin-top: 10px;
		    border-radius: 0.5em;
		}
		
		#rContent_form{
		    border-radius: 0.2em;
		}
		
		#rContent_insert{
		    padding-left: 10px;
		    display: flex;
		    padding-top: 5px;
		    border-radius: 0.2em;
		}
		
		#rDelete{
			padding-right:10px; 
		}
		
		#rUpdate{
			padding-right:10px; 
		}
		
		textarea {
			width:100%;
			height:400px;
		    border: none;
		    background-color: transparent;
		    resize: none;
		    outline: none;
		}
	</style>
</head>
<body>

	<!-- ==== HEADER START ==== -->
	<c:import url ="../../common/header.jsp"/>
	<!-- ==== HEADER END ==== -->
	
<div id="content">
                <div class="container background-white">
                    <div class="row margin-vert-30">
                        <div class="col-md-12">
                            <div class="col-md-8 " style="font-size: 20px; height: 50px;"><span>${ notice.nTitle }</span></div>
                            <div  style="display: flex; background-color: #f5f5f5;border-color: #ddd;width:100%; margin:auto; padding:10px;">
								<div style="padding-right:4%;"><i class="fa-male"><span>${ notice.nWriter }</span></i></div>
                            	<div style="padding-right:3%;"><i class="fa-eye">&nbsp;<span>${ notice.nCount }</span></i></div>
                            	<div style="padding-right:3%;"><i class="fa-comment"><span id="reply_count"></span></i></div>
                            	<div style="padding-left:63%;"><i class="fa-clock-o"><span>${ notice.nCreateDate }</span></i></div>
                        	</div>
                        	
                            <c:if test="${ notice.originalFileName ne null}">
                            <div>첨부파일 : &nbsp;
								<a href="${ contextPath }/resources/nuploadFiles/${ notice.renameFileName }" download="${ notice.originalFileName }">${ notice.originalFileName }</a>
							</div>
                            </c:if>
							<br>
							                         
                            <div class="col-md-12 " >
                            <% pageContext.setAttribute("newLineChar", "\n"); %>
                            <textarea>${ fn:replace(notice.nContent, newLineChar, "<br>")}</textarea>
                           <%--  <textarea><c:out value="${ notice.nContent }"/></textarea> --%>
                            </div>
                        </div>
                        
	                    <div class="col-md-12" style="text-align: center;">
	                    
	                     	  <c:url var="nupView" value="nupView.no">
						         <c:param name="nId" value="${ notice.nId }"/>
						         <c:param name="page" value="${ page }"/>
						      </c:url>
						      
						      <c:url var="ndelete" value="ndelete.no">
						         <c:param name="nId" value="${ notice.nId }"/>
						      </c:url>
						      
						      <c:url var="nList" value="nList.no">
						         <c:param name="page" value="${ page }"/>
						      </c:url>
	                    	
	                    </div>
                    </div>
                    
                      <!-- 댓글창 -->
                      <div style="display: flex; justify-content: space-between; padding-top:10px;">
                            <p style="font:bold;">Comments</p>
                            <div>
                            <c:if test="${ loginUser.nickname eq notice.nWriter }">
		                    	<button type="button" class="btn btn-red btn-sm" onclick="location.href='${ nupView }'">수정</button>
		                    	<button type="button" class="btn btn-red btn-sm" onclick="location.href='${ ndelete }'">삭제</button>
						    </c:if>
	                    	<button type="button" class="btn btn-red btn-sm" onclick="location.href='${ nList }'" >목록</button>
                            </div>
                        </div>
                      <div>
                            <!-- 로그인 한 회원 -->
                            <div style="display: flex;">
                            
                      			<c:if test="${ !empty sessionScope.loginUser }">
                                	<span style="font-size: 15px;">${ loginUser.nickname }</span>
                                </c:if>
                                <c:if test="${  empty sessionScope.loginUser }">
                                	<span style="font-size: 15px;">로그인 필요</span>
                                </c:if>
                                
                      			<c:if test="${ !empty sessionScope.loginUser }">
                                <input id="reply_enter_input" type="text" id="comment" onfocus="this.value=''" style=" width: 80%; border-right:0px; border-top:0px; border-left:0px; border-bottom-color: lightgray; margin-left: 15px;" value="댓글을 넣어주세요.">
                                <button id="reply_input" type="button" class="btn btn-primary" style="margin-left: 10px;">등록</button>
                                </c:if>
                                <c:if test="${  empty sessionScope.loginUser }">
                                <input id="reply_login_need" type="text" id="comment" onfocus="this.value=''" style=" width: 80%; border-right:0px; border-top:0px; border-left:0px; border-bottom-color: lightgray; margin-left: 15px;" value="로그인을 해주세요.">
                                </c:if>
							
                            </div>
                            
                            <div id="replyDiv">
							</div>

							
                        </div>
                        <br>  
                </div>
                
                <input id="nickname" type="hidden" value="${ loginUser.nickname }">
                <input id="nWriter" type="hidden" value="${ notice.nWriter }">
                
            </div>
  <!-- ==== FOOTER START ==== -->
	<c:import url ="../../common/footer.jsp"/>
  <!-- ==== FOOTER END ==== -->
        <script type="text/javascript">
        	
	        $(function(){
		          getReplyList();
	        });

			$('#reply_login_need').click(function(){
   				  alert("로그인이 필요한 서비스입니다.");
				 $(':focus').blur();  
			});

 			$('#reply_enter_input').keydown(function(key){
				if(key.keyCode == 13){
					
					var rContent = $('#reply_enter_input').val();
					var nickname = $('#nickname').val();
					var refBid = ${ notice.nId };
					console.log(nickname);
					$.ajax({
						url : "reply_input.no",
						data : {rContent:rContent , refBid:refBid, rWriter:nickname },
						type:"post",
						success:function(data){
							if(data == "success"){
								getReplyList();
								$('#reply_enter_input').val("");
							}
						}
					});
				}
			}); 
			
			$('#reply_input').click(function(){

					var rContent = $('#reply_enter_input').val();
					var nickname = $('#nickname').val();
					var refBid = ${ notice.nId };
					console.log(nickname);
					$.ajax({
						url : "reply_input.no",
						data : {rContent:rContent , refBid:refBid, rWriter:nickname },
						type:"post",
						success:function(data){
							if(data == "success"){
								getReplyList();
								$('#reply_enter_input').val("");
							}
						}
					});
			});

			function getReplyList(){
				
				var refBid = ${ notice.nId };
				
				$.ajax({
					url : "reply_list.no",
					data : { refBid:refBid },
					dataType:"json",
				    success:function(data){
				    	
				    	$body = $("#replyDiv");
				    	
				    	$body.html("");
				    	
				    	var $tr;
				    	var $rWriter;
				    	var $rCreateDate;
				    	var $rContent;
				    	
				    	var $rUpdate;
				    	var $rDelete;

				      $("#reply_count").text(data.length);
				      
			               if(data.length >0){
			            	   
			            	   for(var i in data){
			            		   $table = $('<table id="reply_list">');
							       $tableBody = $("<tbody>");
	  	   						   $tr = $('<tr>');
	  	   						   $tr2 = $('<tr>');
	  	   						   $td = $('<td>');
					               $rWriter = $('<td id="rWriter_form">').text(decodeURIComponent(data[i].rWriter.replace(/\+/g, " ")));
						           $rContent = $('<td id="rContent_form">').text(decodeURIComponent(data[i].rContent.replace(/\+/g, " ")));
						           $rCreateDate = $('<td id="rCreateDate_form">').text(data[i].rCreateDate);
						           
						           $rUpdate = $('<td class="pull-right">');
						           $rDelete = $('<td class="pull-right">');
						           
						           
						           $rUpdateA = $('<a id="rUpdate">').text("수정").attr('href',"rUpdateA.no?rId="+data[i].rId+"&nId="+ ${ notice.nId } +"&page="+"${ page }");
						           $rDeleteA = $('<a id="rDelete">').text("삭제").attr('href',"rDeleteA.no?rId="+data[i].rId+"&nId="+ ${ notice.nId } +"&page="+"${ page }");
						        	   
						           $rUpdate.append($rUpdateA);
						           $rUpdate.append($rDeleteA);
						           
								   $tr.append($rWriter);
								   $tr.append($rCreateDate);
								   $tr2.append($rContent);
								   
								   if( $('#nickname').val() == $('#nWriter').val() ){
									   $tr2.append($rUpdate);
									   $tr2.append($rDelete);
								   }else{
					            	   
					            	   $table = $('<table id="reply_list">');
								       $tableBody = $("<tbody>");
								       $rContent = $("<td id='rContent_form' colspan='3'>").text('등록된 댓글이 없습니다.');
		  	   						   $tr = $('<tr>');
		  	   						   $td = $('<td>');
		  	   						   
					            	   $tr.append($rContent);
		  	   						   $tableBody.append($tr);
		  	   						   $table.append($tableBody);
									   $body.append($table);
					               }
								   
								   $tableBody.append($tr);
								   $tableBody.append($tr2);
								   $table.append($tableBody);
								   $body.append($table);
			            	   }
			               }
					    }
				});
			}
			
		</script>

</body>
</html>