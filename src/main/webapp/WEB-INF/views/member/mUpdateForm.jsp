<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  
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
										<input type="text" name="mb_id" value="khajsfirepunch"
											id="reg_mb_id" readonly class="form-control input-sm"
											 maxlength="20"> 
									<span class="text-muted">	영문자, 숫자, _ 만 입력 가능. 최소 3자이상 입력하세요.</span>
									</div>
								</div>
						<!-- 		<div class="form-group">
									<div class="col-sm-offset-2 col-sm-8 text-muted">
										<div id="msg_mb_id"></div>
										영문자, 숫자, _ 만 입력 가능. 최소 3자이상 입력하세요.
									</div>
								</div>
 -->
								<div class="form-group has-feedback col-sm-12">
									<label class="col-sm-2 control-label" for="reg_mb_password"><b>비밀번호</b><strong
										class="sound_only">*</strong></label>
									<div class="col-sm-3">
										<input type="password" name="mb_password" id="reg_mb_password"
											class="form-control input-sm" maxlength="20">
									</div>
									<label class="col-sm-2 control-label" for="reg_mb_password_re"><b>비밀번호
											확인</b><strong class="sound_only">*</strong></label>
									<div class="col-sm-3">
										<input type="password" name="mb_password_re"
											id="reg_mb_password_re" class="form-control input-sm"
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
										<input type="text" name="mb_hp" value="010-8787-3759"
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
										<input type="hidden" name="old_email"
											value="ajs15010120@gmail.com"> <input type="text"
											name="mb_email" value=""
											id="reg_mb_email" 
											class="form-control input-sm email" size="70" maxlength="100">
									</div>
								</div>



								<div class="form-group has-feedback col-sm-12">
									<label class="col-sm-2 control-label" for="reg_mb_hp"><b>성별</b></label>
									<div class="col-sm-3">
										<input type="text" name="mb_hp" value="남성"
											id="reg_mb_hp" class="form-control input-sm" maxlength="20">
									</div>
								</div>
								<div class="form-group has-feedback col-sm-12">
									<label class="col-sm-2 control-label" for="reg_mb_hp"><b>생년월일</b></label>
									<div class="col-sm-3">
										<input type="text" name="mb_hp" value="1990-11-11"
											id="reg_mb_hp" class="form-control input-sm" maxlength="20">
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
        <script>
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
			
			
			
		</script>
	    
	


<!-- ==== FOOTER START ==== -->
	<c:import url ="../common/footer.jsp"/>
<!-- ==== FOOTER END ==== -->
</body>
</html>