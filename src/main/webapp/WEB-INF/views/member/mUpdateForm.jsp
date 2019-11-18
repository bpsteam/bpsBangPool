<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 수정 페이지</title>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script src="${contextPath}/resources/js/jquery-3.4.1.min.js"></script>
</head>
<body>

<!-- ==== HEADER START ==== -->
	<c:import url ="../common/header.jsp"/>
<!-- ==== HEADER END ==== -->

 <!-- === BEGIN CONTENT === -->
        
        
        <div id="content">
            
            <div class="margin-bottom-20">
                <hr>
            </div>
            
            
            <div class="container background-white ">
        
                <div class="row margin-vert-30">
				<!-- Main Column -->
				<div class="col-sm-12">
					<div class="tab-content">
						<div class="at-title">
							<div class="at-container" style="display:inline">
								<div class="page-title col-md-9" style="font-size:30px">
									<strong> <i class="fa fa-file-text"></i> Register Form
									</strong>
								</div>
								<div class="page-desc hidden-xs col-md-3" style="text-align: right">회원가입 신청서 작성</div>
								<div class="clearfix"></div>
							</div>
						</div>
						<div class="margin-bottom-10">
							<hr>
						</div>

						<div class="panel panel-default">
							<div class="panel-heading">
								<strong><i class="fa fa-star fa-lg"></i> 사이트 이용정보 입력</strong>
							</div>
							<div class="panel-body">

								<div class="form-group col-sm-12">
									<label class="col-sm-2 control-label" for="reg_mb_id">
									<b>아이디</b><strong class="sound_only">*</strong></label>
									<div class="col-sm-5" style="position:relative">
										<input type="text" name="mb_id" value="${ loginUser.email }"
											id="reg_mb_id" readonly class="form-control input-sm"
											 maxlength="20"> 
									<span class="text-muted">	영문자, 숫자, _ 만 입력 가능. 최소 3자이상 입력하세요.</span>
									</div>
								</div>
				
								<div class="form-group has-feedback col-sm-12">
									<label class="col-sm-2 control-label" for="reg_mb_password"><b>비밀번호</b><strong
										class="sound_only">*</strong></label>
									<div class="col-sm-3">
										<input type="password" name="pwd" id="pwd"
											class="form-control input-sm" maxlength="20">
									</div>
									<label class="col-sm-2 control-label" for="reg_mb_password_re"><b>비밀번호
											확인</b><strong class="sound_only">*</strong></label>
									<div class="col-sm-3">
										<input type="password" name="pwd2"
											id="pwd2" class="form-control input-sm"
											maxlength="20"> 
									</div>
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading">
								<strong><i class="fa fa-user fa-lg"></i> 개인정보 입력</strong>
							</div>
							<div class="panel-body">

								<div class="form-group has-feedback col-sm-12">
									<label class="col-sm-2 control-label" for="reg_mb_name"><b>이름</b><strong
										class="sound_only">*</strong></label>
									<div class="col-sm-3">
										<input type="text" id="reg_mb_name" name="mb_name" value="${ loginUser.name }"
											readonly class="form-control input-sm" size="10">
									</div>
								</div>



								<div class="form-group has-feedback col-sm-12">
									<label class="col-sm-2 control-label" for="reg_mb_email"><b>E-mail</b><strong
										class="sound_only">*</strong></label>
									<div class="col-sm-5">
										<input type="hidden" name="old_email"
											value="ajs15010120@gmail.com"> <input type="text"
											name="mb_email" value="${ loginUser.email }"
											id="reg_mb_email" required
											class="form-control input-sm email" size="70" maxlength="100">
									</div>
								</div>



								<div class="form-group has-feedback col-sm-12">
									<label class="col-sm-2 control-label" for="reg_mb_hp"><b>휴대폰번호</b></label>
									<div class="col-sm-3">
										<input type="tel" name="phone" value="${ loginUser.phone }"
											id="reg_mb_hp" class="form-control input-sm" maxlength="20">
									</div>
								</div>


							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading">
								<strong><i class="fa fa-cog fa-lg"></i> 기타 개인설정</strong>
							</div>
							<div class="panel-body">



								<div class="form-group has-feedback col-sm-12">
									<label class="col-sm-2 control-label" for="reg_mb_email"><b>주소</b></label>
									<div class="col-sm-5">
										 <input type="search" class="form-control postcodify_postcode5" id="post" name="post" placeholder="zipCode"
				                  style="width:50%;float:left">
				               
				                <button class="btn btn-sm btn-blue btn-sm" type="button" id="postcodify_search_button" style="float:left;margin-left:10px" >검색</button>
								<br><br>
				                <input type="text" class="form-control margin-bottom-20 postcodify_address" name="address1" id="address1" placeholder="address1">
				                <input type="text" class="form-control margin-bottom-20 postcodify_extra_info" name="address2" id="address2" placeholder="address2">
				                   
									</div>
								</div>



								<div class="form-group has-feedback col-sm-12">
									<label class="col-sm-2 control-label" for="reg_mb_hp"><b>성별</b></label>
									<div class="col-sm-3">
										 <select class="form-control margin-bottom-20" name="gender">
                                	<option value="남성">남성</option>
                                	<option value="여성">여성</option>
                                </select>
									</div>
								</div>
								<div class="form-group has-feedback col-sm-12">
									<label class="col-sm-2 control-label" for="reg_mb_hp"><b>생년월일</b></label>
									<div class="col-sm-2">
	                                <select class="form-control margin-bottom-20" name="year" >
	                                <% for(int i=1970; i<2001; i++) {%>
	                                	<option value="<%=i %>"><%=i %>년</option>
	                                <%} %>
	                                </select>
	                          	 </div>
	                     	 	<div class="col-sm-2">
	                                <select class="form-control margin-bottom-20" name="month">
	                                <% for(int i=1; i<13; i++) {%>
	                                	<option value="<%=i %>"><%=i %>월</option>
	                                <%} %>
	                                </select>
	                               </div>
	         			
	         					 <div class="col-sm-2">
	                                <select class="form-control margin-bottom-20" name="date">
	                                <% for(int i=1; i<32; i++) {%>
	                                	<option value="<%=i %>"><%=i %>일</option>
	                                <%} %>
	                                </select>
                                </div>
								</div>
								
								
							</div>
						</div>


					</div>
				</div>
				<!-- End Main Column -->

				<div class="text-center" style="margin: 30px 0px;">
					<button type="submit" id="btn_submit" class="btn btn-success"
						accesskey="s">정보수정</button>
					<a href="http://myroom.oceanmate.co.kr" class="btn btn-danger"
						role="button">취소</a>
				</div>



			</div>
            </div>
        
            <div class="margin-bottom-30">
                <hr>
            </div>
        
        </div>
        <!-- === END CONTENT === -->
         <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
        
        <script>
        
        // 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
        $(function(){
           $("#postcodify_search_button").postcodifyPopUp();
        });
        
        
			var flen = 0;
			function add_file(delete_code) {
				var upload_count = 3;
				if (upload_count && flen >= upload_count) {
					alert("이 게시판은 " + upload_count
							+ "개 까지만 파일 업로드가 가능합니다.");
					return;
				}
	
				var objTbl;
				var objNum;
				var objRow;
				var objCell;
				var objContent;
				if (document.getElementById)
					objTbl = document.getElementById("variableFiles");
				else
					objTbl = document.all["variableFiles"];
	
				objNum = objTbl.rows.length;
				objRow = objTbl.insertRow(objNum);
				objCell = objRow.insertCell(0);
	
				objContent = "<div class='row'>";
				objContent += "<div class='col-sm-7'><div class='form-group'><div class='input-group input-group-sm'><span class='input-group-addon'>파일 "
						+ (objNum+1)
						+ "</span>	<input type='file' class='input-sm' name='uploadFile"+(objNum+1)+"'></div></div></div>";
				if (delete_code) {
					objContent += delete_code;
				} else {
					;
				}
				objContent += "</div>";
	
				objCell.innerHTML = objContent;
	
				flen++;
			}
	
			add_file('');
	
			function del_file() {
				// file_length 이하로는 필드가 삭제되지 않아야 합니다.
				var file_length = 0;
				var objTbl = document.getElementById("variableFiles");
				if (objTbl.rows.length - 1 > file_length) {
					objTbl.deleteRow(objTbl.rows.length - 1);
					flen--;
				}
			}
			
			
			   /* 비밀번호 확인 */
		    $('#pwd2').change(function(){
			    $('#pwd').change(function(){
			        if($('#pwd2').val()==$(this).val()){
			            $('#pwdResult').html("비밀번호 확인 값이 일치합니다.").css('color','green');

			        }else{
			            $('#pwdResult').html("비밀번호 확인 값이 불일치합니다.").css('color','red');
			            $('#pwd2').select();

			        }
			    });
		        if($('#pwd').val()==$(this).val()){
		            $('#pwdResult').html("비밀번호 확인 값이 일치합니다.").css('color','green');

		        }else{
		            $('#pwdResult').html("비밀번호 확인 값이 불일치합니다.").css('color','red');
		            $('#pwd2').select();

		        }
		    });
			
			
		</script>
	    
	


<!-- ==== FOOTER START ==== -->
	<c:import url ="../common/footer.jsp"/>
<!-- ==== FOOTER END ==== -->
</body>
</html>