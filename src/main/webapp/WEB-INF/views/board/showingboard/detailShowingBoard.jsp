<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix ="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<style>
    /* 크롬창 파란 태두리 없에는 css코드 */
    input:focus {
        outline: none;
    }
</style>
<html lang="ko">
    <body>
        <!-- ==== HEADER START ==== -->
    	<c:import url ="../../common/header.jsp"/>
    	<!-- ==== HEADER END ==== -->
            <!-- === BEGIN CONTENT === -->
            <div id="content">
                <div class="container background-white">
                    <div class="row margin-vert-30">
                        <div class="col-md-12">
                            <!-- 게시글 제목 -->
                            <h2>${ showing.sbtitle }</h2>
                            <div class="row">
                                <div class="col-md-6 animate fadeIn">
                                    <div>
                                       <c:set var="fileSplit" value="${fn:split(showing.renameFileName,',')}"></c:set>
                                       <img src="${contextPath}/resources/showinguploadFiles/${ fileSplit[0] }" style="border-radius: 0.5em;" alt="about-me" class="margin-top-10" id="mainImg">
                                       	<div id="carousel-example-2" class="carousel slide alternative" data-ride="carousel">
									      <div class="row">
									       	<c:forEach var="picture" items="${ fileSplit }">
									        	<div class="col-md-4" style="padding:10px; border-radius: 0.5em;"><img src="${contextPath}/resources/showinguploadFiles/${ picture }" style="max-width:100%; border-radius: 0.5em;" onclick="selectImg(this)"></div>
									        </c:forEach>
									      </div>
										</div>
		                                       
                                    </div>
                                    <div style="display: flex; padding-top:20px;">
                                        <p><img src="resources/assets/img/thumbs/thumbs-up.png" style="width: 20px; height: 20px; cursor: pointer; margin-left: 5px;" alt="thumbs-up">&nbsp;&nbsp;<span>1</span></p>    
                                        <p><img src="resources/assets/img/thumbs/thumb-down.png" style="width: 20px; height: 20px; cursor: pointer; margin-left: 5px;" alt="thumb-down">&nbsp;&nbsp;<span>2</span></p>
                                        <p><img id="heartButton" src="resources/assets/img/thumbs/heart.png" style="width: 20px; height: 20px; cursor: pointer; margin-left: 5px;" alt="thumb-down" onclick="heartButton(this)"></p>
                                        <p><i style="font-size:24px; color:black; cursor:pointer; margin-left: 10px;" class="fa" onclick="location.href='updateView.sb?sbId=${showing.sbid}&page=${page}'">&#xf040;</i></p>
                                        <div class="col-md-9" ><img onclick="$('.more').css('display', 'block')"  src="resources/assets/img/thumbs/more.png" class="pull-right" style="width: 20px; height: 20px; cursor: pointer; margin-left: 5px; " alt="more" onclick="more()">
                                            <br>
                                            <div class="pull-right more" style="display: none; cursor:pointer;">신고하기</div><br>
                                            <div class="pull-right more" style="display: none; cursor:pointer;" onclick="location.href='deleteShowing.sb?sbId=${ showing.sbid }'" >게시글 삭제하기</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 margin-bottom-10 animate fadeInRight">
                                    <h3 class="padding-top-10 pull-left">${ showing.sbwriter }</h3>
                                    <div class="clearfix"></div>
                                    <h4><em>${ showing.sbtitle }</em></h4>
                                    <span>${ showing.sbcontent }</span>
                                </div>
                            </div>
                            <hr>
                                <!-- 로그인 한 회원 -->
                                <div style="display: flex;">
                                    <p style="font-size: 15px;">${ loginUser.name }</p>
                                    <input type="text" id="comment" onfocus="this.value=''" style=" width: 80%; border-right:0px; border-top:0px; border-left:0px; border-bottom-color: lightgray; margin-left: 15px;" value="댓글을 넣어주세요." onkeyup="comment(this);"/>
                                </div>
                                <!-- start reply board -->
                                <div id="Reply" ><!-- 댓글이 들어갑니다. --></div>
                                <!-- end reply board -->
                            </div>
                            <br>
                            <!-- end row -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- === END CONTENT === -->
            <!-- === BEGIN FOOTER === -->
            <c:import url ="../../common/footer.jsp"/>
            <!-- === END FOOTER === -->
    </body>
    <script>
    	// setinterval reload reply board
	    $(function(){
	        getReplyList();
	        setInterval(function(){
	           getReplyList();
	        }, 10000);
	     });
		// insert reply baord ajax    
        function comment(t){
			// enterkey javascrpt
            if(window.event.keyCode == 13){
            	var refBid = ${showing.sbid};
            	var rContent = t.value;
            	$.ajax({
            		url: "addReply.sb",
            		data: {rContent:rContent, refbId:refBid},
            		type: "post",
            		success: function(data){
            			console.log(data);
            			if(data == "success"){
            				getReplyList();
            			}
            		}
            	});
            	t.value = "";
            }
        }
        // selectList reply ajax
        function getReplyList(){
        	var sbId = ${ showing.sbid };
        	$.ajax({
        		url: "rList.sb",
        		data: {sbId:sbId},
        		dataType: "json",
        		success: function(data){
        			$replyBoard = $("#Reply");
        			$replyBoard.html("");
        			var $div1;
        			var $div2;
        			var $div3;
        			var $span1;
        			var $span2;
        			var $p;
        			var $img;
        			console.log(data);
        			if(data.length > 0){
        				console.log("안뇽~");
        				for (var i in data){
        					$div1 =  $("<div style='padding-top: 10px;  background-color: #f4f4f4; margin-top: 10px; border-radius: 0.5em;'>");
        					$div2 =  $("<div style='display: flex; padding-left:10px;'>");
        					$span1 = $("<span>").text(decodeURIComponent(data[i].rWriter));
        					$span2 = $("<span style='padding-left: 15px;'>").text(data[i].rCreateDate);
        					$div3 =  $("<p style='font-size: 14px; border-radius: 0.5em; '>").text(decodeURIComponent(data[i].rContent.replace(/\+/g, " "))); 
        					
        					$div1.append($div2);
        					$div1.append($span1);
        					$div1.append($span2);
        					$div1.append($div3);
        					$replyBoard.append($div1);
        				}
        			}
        		}
        	})
        }
        var heartPath = null;
        function heartButton(t){                
            console.log($(t).attr("class"));
            if($(t).attr("class") == "empty"){
            	$(t).attr("class","full");
                $(t).attr("src", "resources/assets/img/thumbs/heartRed.png") ;
            }
            else if($(t).attr("class") == "full"){
            	$(t).attr("class","empty");
                $(t).attr("src" , "resources/assets/img/thumbs/heart.png") ;
            }
        }
        // default main pic
        function selectImg(t){
            console.log(t);
            document.getElementById("mainImg").src = t.src;
        }
        
    </script>
</html>
