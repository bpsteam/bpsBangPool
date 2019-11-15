<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${contextPath}/resources/js/jquery-3.4.1.min.js"></script>
</head>
<body>

<!-- ==== HEADER START ==== -->
	<c:import url ="../common/header.jsp"/>
<!-- ==== HEADER END ==== -->

<!-- === BEGIN CONTENT === -->
            <div id="content">
                <div class="container background-white">
                    <div class="row margin-vert-30">
                        <!-- Register Box -->
                        <div class="col-md-6 col-md-offset-3 col-sm-offset-3">
                        
                        
                             <form class="signup-page" action="minsert.me" method="post" id="joinForm">
                                <div class="signup-header">
                                    <h2>회원 가입</h2>
                                    <p>이미 회원이신가요?
                                        <a href="loginView.me">여기</a>를 눌러 로그인하세요!</p>
                                </div>
                                
                                <label>회원ID(E-Mail)
                                    <span class="color-red">*</span>
                                </label>
                                <input class="form-control margin-bottom-0" type="text" name="email" id="email">
                                  <span class="guide ok margin-bottom-0" style="color:blue">이 아이디는 사용 가능합니다.</span>
                 				 <span class="guide error margin-bottom-0" style="color:red">이 아이디는 사용할 수 없습니다.</span>
                 				 <input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value="0">
                 				 
                 				 
                                <div class="row margin-top-20" id="topmarginid">
                                    <div class="col-sm-6">
                                        <label>비밀번호
                                            <span class="color-red">*</span>
                                        </label>
                                        <input class="form-control margin-bottom-0" type="password" name="pwd" id="pwd">
                                    </div>
                                    <div class="col-sm-6">
                                        <label>비밀번호 확인
                                            <span class="color-red">*</span>
                                        </label>
                                        <input class="form-control margin-bottom-0" type="password" name="pwd2" id="pwd2">
                                    </div>
                                    <div class="col-sm-12">
                                    <span id="pwdResult"></span>
                                    </div>
                                </div>
                                
                                <label class="margin-top-20" id="topmarginpwd">이름
                                    <span class="color-red">*</span>
                                </label>
                                <input class="form-control margin-bottom-20" type="text" name="name">
                                
                                <label>닉네임
                                    <span class="color-red">*</span>
                                </label>
                                <input class="form-control margin-bottom-0" type="text" name="nickname" id="nickname">
                                  <span class="nickguide ok margin-bottom-0" style="color:blue">사용 가능한 닉네임입니다.</span>
                 				 <span class="nickguide error margin-bottom-0" style="color:red">사용 불가능한 닉네임입니다.</span>
                 				 <input type="hidden" name="nicknameDuplicateCheck" id="nicknameDuplicateCheck" value="0">
                 				 
                               <div class="margin-top-20" id="topmarginnick" ></div>
                                <label >성별
                                     <span class="color-red">*</span> 
                                </label>
                                <!-- <input class="form-control margin-bottom-20" type="text"> -->
                                <select class="form-control margin-bottom-20" name="gender">
                                	<option value="남성">남성</option>
                                	<option value="여성">여성</option>
                                </select>
                                
                                <label>생년월일
                                    <!-- <span class="color-red">*</span> -->
                                </label>
                              <!--   <input class="form-control margin-bottom-20" type="text" name="birth"> -->
                              <div class="row">
                             	 <div class="col-sm-3">
	                                <select class="form-control margin-bottom-20" style="width:80px" name="year" >
	                                <% for(int i=1970; i<2001; i++) {%>
	                                	<option value="<%=i %>"><%=i %>년</option>
	                                <%} %>
	                                </select>
	                          	 </div>
	                     	 	<div class="col-sm-3">
	                                <select class="form-control margin-bottom-20" style="width:80px" name="month">
	                                <% for(int i=1; i<13; i++) {%>
	                                	<option value="<%=i %>"><%=i %>월</option>
	                                <%} %>
	                                </select>
	                               </div>
	         			
	         					 <div class="col-sm-3">
	                                <select class="form-control margin-bottom-20" style="width:80px" name="date">
	                                <% for(int i=1; i<32; i++) {%>
	                                	<option value="<%=i %>"><%=i %>일</option>
	                                <%} %>
	                                </select>
                                </div>
                                
                               </div> 
                                <label>전화번호
                                   <!--  <span class="color-red">*</span> -->
                                </label>
                                <input class="form-control margin-bottom-20" placeholder="-없이 입력" type="tel" name="phone">
                                <label>주소
                                    <!-- <span class="color-red">*</span> -->
                                </label><br>
                               <!--  <input class="form-control margin-bottom-20" type="text" name="address"> -->
                                <input type="search" class="form-control postcodify_postcode5" id="post" name="post" placeholder="zipCode"
				                  style="width:50%;float:left">
				               
				                <button class="btn btn-sm btn-primary" type="button" id="postcodify_search_button" style="height:35px;float:left;margin-left:10px" >검색</button>
								<br><br>
				                <input type="text" class="form-control margin-bottom-20 postcodify_address" name="address1" id="address1" placeholder="address1">
				                <input type="text" class="form-control margin-bottom-20 postcodify_extra_info" name="address2" id="address2" placeholder="address2">
				                                
                                <img src="../noAuto.PNG"><br>
                                <label>자동등록 방지 확인
                                     <span class="color-red">*</span> 
                                </label>
                                <input class="form-control margin-bottom-20" type="text">
                                <hr>
                                <div class="row">
                                    <div class="col-lg-8">
                                        <!-- <label class="checkbox">
                                            <input type="checkbox">I read the
                                            <a href="#">Terms and Conditions</a>
                                        </label> -->
                                    </div>
                                    <div class="col-lg-4 text-right">
                                        <button type="submit" class="btn btn-primary" >Register</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- End Register Box -->
                    </div>
                </div>
            </div>
            <!-- === END CONTENT === -->


<!-- ==== FOOTER START ==== -->
	<c:import url ="../common/footer.jsp"/>
<!-- ==== FOOTER END ==== -->


 <!-- jQuery와 Postcodify를 로딩한다. -->
 <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
 <script>
    // 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
    $(function(){
       $("#postcodify_search_button").postcodifyPopUp();
   		$(".guide").hide();
   		$(".nickguide").hide();
    });
    
    $("#nickname").on("keyup", function(){
			var nickname = $(this).val().trim();
			console.log(nickname);
			if(nickname.length < 2){
				$("#nicknameDuplicateCheck").val(0);
				$("#topmarginnick").attr('class','row margin-top-20');
				return;
			}
			
			$.ajax({
				url  : "dupnick.me",
				data : {nickname:nickname},
				success : function(data){
					console.log(data);
					if(data == "true"){
						$(".nickguide.error").hide();
						$(".nickguide.ok").show();
						$("#nicknameDuplicateCheck").val(1);
						$("#topmarginnick").attr('class','row margin-top-10');
					}else{
						$(".nickguide.error").show();
						$(".nickguide.ok").hide();
						$("#nicknameDuplicateCheck").val(0);
						$("#topmarginnick").attr('class','row margin-top-10');

					}
				}
			});
		});	
    $("#email").on("keyup", function(){
			var email = $(this).val().trim();
			
			if(email.length < 4){
				$(".guide").hide();
				$("#idDuplicateCheck").val(0);
				$("#topmarginid").attr('class','row margin-top-20');
				return;
			}
			
			$.ajax({
				url  : "dupid.me",
				data : {email:email},
				success : function(data){
					console.log(data);
					if(data == "true"){
						$(".guide.error").hide();
						$(".guide.ok").show();
						$("#idDuplicateCheck").val(1);
						$("#topmarginid").attr('class','row margin-top-10');
					}else{
						$(".guide.error").show();
						$(".guide.ok").hide();
						$("#idDuplicateCheck").val(0);
						$("#topmarginid").attr('class','row margin-top-10');

					}
				}
			});
		});	
		
		function validate(){
			if($('#idDuplicateCheck').val()==0){
				alert("사용 가능한 아이디를 입력해주세요.");
				$('#userId').focus();
				return false;
			}else{
				$('#joinForm').submit();
			}
		}
		
		
		   /* 비밀번호 확인 */
	    $('#pwd2').change(function(){
		    $('#pwd').change(function(){
		        if($('#pwd2').val()==$(this).val()){
		            $('#pwdResult').html("비밀번호 확인 값이 일치합니다.").css('color','green');
					$("#topmarginpwd").attr('class',' margin-top-10');

		        }else{
		            $('#pwdResult').html("비밀번호 확인 값이 불일치합니다.").css('color','red');
		            $('#pwd2').select();
					$("#topmarginpwd").attr('class',' margin-top-10');

		        }
		    });
	        if($('#pwd').val()==$(this).val()){
	            $('#pwdResult').html("비밀번호 확인 값이 일치합니다.").css('color','green');
				$("#topmarginpwd").attr('class',' margin-top-10');

	        }else{
	            $('#pwdResult').html("비밀번호 확인 값이 불일치합니다.").css('color','red');
	            $('#pwd2').select();
				$("#topmarginpwd").attr('class',' margin-top-10');

	        }
	    });
    
 </script>
 
 
</body>
</html>