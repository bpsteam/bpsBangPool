<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<style>
	
		.panel-default > .panel-heading {
		    color: #EEE;
		    background-color: #444;
		    border-color: #555;
		}
		
		.view-line {
		    height: 1px;
		    margin-top: 14px;
		    border-bottom: 1px dotted #aaa;
		    margin-bottom: 15px;
		}
		.view-comment {
		    font-family: Roboto, sans-serif;
		    margin: 0 0 10px;
		    padding: 0 0 5px;
		    text-transform: capitalize;
		    overflow: hidden;
		    font-size: 20px;
		    font-weight: 500;
		    border-bottom-color: #333;
		    border-bottom-width: 1px;
		    display: inline-block;
		}
		
		.comment-box {
		    border: 1px solid #555;
		    padding: 5px 10px 0;
		    margin-bottom: 10px;
		}
		
		.comment-content{
			display:flex;
			
		}
		.comment-cell.comment-submit {
		    width: 80px;
		    height: 100%;
		    background: #F90;
		    border-left: 0;
		    cursor: pointer;
		}
		#reply_edit_textarea{
			display:none;
		}
		
		#left_time{
			color:red;
		}
		
	</style>

</head>
<body>

	

	<!-- ==== HEADER START ==== -->
	<c:import url="../../common/header.jsp" />
	<!-- ==== HEADER END ==== -->
	<div id="content">
	
			<div class="margin-bottom-20">
				<hr>
			</div>
			
			<div class="container background-white ">
				<div class="row margin-vert-30">
					<div class="panel panel-default" style="margin-top:10px;">
					<div class="panel-heading">
						<h3 class="panel-title font-16">
							<span class="pull-right" style="font-weight:bold;">
								<i class="fa fa-comment"></i>
								<!-- 댓글이 있으면 -->
								<b class="orange">40</b>				&nbsp;&nbsp;
								<i class="fa fa-eye"></i>
								<!-- 조회수 -->
								431			</span>
							<i class="fa fa-gift"></i> 나눔 제품
						</h3>
					</div>
					
					
					<h1 class="text-center">${ share.srbTitle }</h1>
					
					<div class="panel-body">
						<div class="row">
							<div class="col-sm-5">
								<img itemprop="image" src="https://quasarzone.co.kr/skin/board/nanum/img/jijang.jpg" class="reimg" data-toggle="modal" data-target="#eventModal" style="cursor: pointer;">
								<!-- 이미지 확대-->
								<div class="modal fade" id="eventModal" tabindex="-1" role="dialog" aria-labelledby="myEventModalLabel" aria-hidden="false">
									<div class="modal-dialog modal-sm">
										<div class="modal-content">
											<div class="modal-body">
												<img src="https://quasarzone.co.kr/skin/board/nanum/img/jijang.jpg">
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-7 font-14">
												<div class="col-sm-12 font-16">
									<strike class="gray">${ share.srItemName }</strike>
								</div>
								<div class="col-sm-12">
									<strike class="gray">배송방법: ${ share.srDelivery }</strike>
								</div>
								<div class="col-sm-12">
									시작일시: ${ srStartDate }<br>
									종료일시: ${ srEndDate }<br>
									남은시간: <span id="left_time" class="gray"></span><br>
									당첨방법: ${ share.srEvent }<br>
									당첨인원: 총 ${ share.srEventLimit }명 ${ chance }%<br>
									현재참가: 총 ${ share.srEventEnterCount }명
								</div>
							</div>
						</div>
						<div class="view-line"></div>
						<p class="pull-center">
								<button id="end_event" type="button" class="btn btn-danger" onclick="alert('나눔이 종료되었습니다.');" style="display:none; margin: auto;">나눔종료!</button>
								<button id="join_event" type="button" class="btn btn-color" onclick="alert('댓글로 참여해주세요.');" style="display:none; margin: auto;">나눔진행중</button>
						</p>
						<div class="view-line"></div>
						
						  <div class="view-padding">
						    <div class="view-content">
								${ share.srbContent }
						    </div>
						  </div>
						  
					
				    <div class="view-comment font-18 en" style="margin-top:50px;">
						<i class="fa fa-commenting"></i> 댓글 : <span class="orange">104</span> 개
				    </div>
				    <c:if test="${ loginUser != null }">
				    
				    <div class="comment-box">
					      <div class="comment-box">
	
					        <div class="clearfix"></div>
					
					        <div class="form-group comment-content">
						        
					          <form action="reply_event_insert.sr">
						        <div class="comment-cell" style="width:80%">
						            <textarea id="reply_content" tabindex="13" id="wr_content" name="rContent" maxlength="10000" rows="5"
						              class="form-control input-sm is_cm_color" title="내용"></textarea>
						            <input name="nickname" type="hidden" value=${ loginUser.nickname }>
						            <input name="srbId" type="hidden" value=${ share.srbId }>
						            <input name="email" type="hidden" value=${ loginUser.email }>
						        </div>
								<div style="display: table-cell;width: 80px;">
									<input type="button" id="reply_insert" value="등록" name="rContent" style="background-color: #F90; border: 1px solid #555; text-align: center; vertical-align: middle; cursor: pointer; line-height: 65px;" tabindex="14">
										
									<input type="submit" id="reply_event_insert" value="등록+신청" style="background-color: #e9541b; border: 1px solid #555; text-align: center; vertical-align: middle; cursor: pointer; line-height: 35px;" tabindex="14">
								</div>
							  </form>
					        </div>
					      </div>
				    </div>
				    </c:if>
				    
				    <c:if test="${ loginUser == null }">
				    	<div>로그인시 댓글 이벤트 참여 가능합니다!!!</div>
				    	<br>
				    </c:if>
				    
				    <input id="winner" type="hidden" value="${ share.srWinner }">
				    
				    <!-- 댓글 목록 -->
				      <div id="viewcomment">
					  </div>
					  
					</div>
					
				</div>
			</div>
		</div>
	</div>


	<!-- ==== FOOTER START ==== -->
	<c:import url="../../common/footer.jsp" />
	<!-- ==== FOOTER END ==== -->
	
	<script>
		
	    $(function(){
	    	
	        getReplyList();
	        
	        countDate();
	        
			setInterval(function(){
				countDate();
			},1000);
	        
	  	});
	    
	    function already(){
	    	if("${ already }" != ""){
	    		alert("이미 참여하였습니다.")
	    	}
	    }
	    
	    function countDate(){
	        
	    	var today = new Date();
	    	
	        var startDate = "${ share.srStartDate }";
	        var startTime = "${ share.srStartHour }";
	        
	        var endDate = "${ share.srEndDate }";
	        var endTime = "${ share.srEndHour }";
	        
	        var sd = startDate.split("-");
	        var ed = endDate.split("-");
	        
	        var start = new Date(sd[0],sd[1]-1,sd[2],startTime,0,0);
	        var end = new Date(ed[0],ed[1]-1,ed[2],endTime,59,0);
	        
	        var left = end-today;
	        
	        var winner = $('#winner').val();
	        
	        if(left <= 0){
	        	if( winner == ""){
					var srbId = ${ share.srbId };
	        		$.ajax({
	        			url:"share_winner.sr",
	        			data : { srbId:srbId },
	        			success:function(data){
	        				
	        			}
	        		});
	        		
	        	}
	        	$('#left_time').text('마감');
	        	$('#join_event').text('나눔종료!');
	        	$('#end_event').css('display','block');
	        }else{
	        	$('#left_time').text(msToTime(left));
	        	$('#join_event').text('나눔진행중');
	        	$('#join_event').css('display','block');
	        }
	        
	    }
	    
	    function msToTime(ms) {
			
	    	var seconds = Math.floor(((ms/1000) % 60));
	    	var minutes = Math.floor(((ms/(1000*60)) % 60));
	    	var hours = Math.floor(((ms/(1000*60*60)) % 24));
			var day = Math.floor(((ms/(1000*60*60*60)) % 365));
			
			return day+'일 '+hours+'시 '+minutes+'분 '+seconds+'초'

	    }
	    
		$('#reply_insert').click(function(){
				
				var rContent = $('#reply_content').val();
				var nickname = "${ loginUser.nickname }";
				var refbId = ${ share.srbId };
				console.log(nickname);
				$.ajax({
					url : "reply_insert.sr",
					data : {rContent:rContent , refbId:refbId, rWriter:nickname },
					type:"post",
					success:function(data){
						if(data == "success"){
							getReplyList();
							$('#reply_content').val("");
						}
					}
				});
		}); 
	    
	    
	    function getReplyList(){
	    	
	    	var refbId = ${ share.srbId }
	    	
	    	$.ajax({
	    		url: "reply_list.sr",
	    		data : { refbId:refbId },
	    		dataType:"json",
	    		success:function(data){
	    			$body = $("#viewcomment");
	    			$body.html("");
	    			
	    			var $reply_body;
	    			var $media_body;
	    			var $nickname;
	    			var $createDate;
	    			var $media_content;
	    			var $reply_edit;
	    			var $reply_edit_textarea;
	    			
	    			if(data.length >0){
	    				
	    				for(var i in data){
	    					
	    					$reply_body = $('<div class="reply_body">');
	    					$media_body = $('<div class="media-body">');
	    					$nickname   = $('<b>').text(decodeURIComponent(data[i].rWriter.replace(/\+/g, " ")));
	    					$createDate = $('<i class="fa fa-clock-o">').text(data[i].rCreateDate);
	    					$media_content =$('<div class="media-content">').text(decodeURIComponent(data[i].rContent.replace(/\+/g, " ")));
	    					$reply_edit = $('<span class="reply_edit">');
	    					$reply_edit_textarea =$('<textarea id="reply_edit_textarea">').text(decodeURIComponent(data[i].rContent.replace(/\+/g, " ")));
	    					
	    					$media_content.append($reply_edit);
	    					$media_content.append($reply_edit_textarea);
	    					
	    					$media_body.append($nickname);
	    					$media_body.append($createDate);
	    					$media_body.append($media_content);
	    					
	    					$reply_body.append($media_body);
	    					$body.append($reply_body);
	    					
	    				}
	    				
	    			}
	    			
	    		}
	    		
	    	});
	    	
	    }
	    
	    
		
	</script>

</body>
</html>