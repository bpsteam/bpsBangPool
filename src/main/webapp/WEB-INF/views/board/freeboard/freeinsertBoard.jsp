<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
/*     #ultag li {
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


#variableFiles {
	width: 100%;
	margin: 0;
	border: 0;
}

#variableFiles td {
	padding: 0px 0px 7px;
	border: 0;
}

#variableFiles input[type=file] {
	box-shadow: none;
	border: 1px solid #ccc !important;
	outline: none;
}

#variableFiles .form-group {
	margin-left: 0;
	margin-right: 0;
	margin-bottom: 7px;
}

#variableFiles .checkbox-inline {
	padding-top: 0px;
	font-weight: normal;
}

</style>

</head>
<body>

	<!-- ==== HEADER START ==== -->
	<c:import url="../../common/header.jsp" />
	<!-- ==== HEADER END ==== -->

	<!-- === BEGIN CONTENT === -->


	<div id="content">


		<div class="margin-bottom-20">
			<hr>
		</div>
		<div class="container background-white ">

			<div class="row margin-vert-30">
				<!-- Main Column -->
				<div class="col-sm-9">
					<div class="tab-content">
						<h1>
							<small>글쓰기</small>
						</h1>
						<div class="margin-bottom-10">
							<hr>
						</div>

						<div class="panel panel-blue">
							<div class="panel-body" style="background-color: white;">
								<form action="frbinsert.fr" method="post"
									enctype="multipart/form-data"
									class="form-horizontal">

									<div class="form-group has-feedback">
										<label class="col-sm-2 control-label">작성자</label>
										<div class="col-sm-3">
											 <c:if test="${ !empty loginUser }">
                                                   <input type="text" name="frbWriter"  id="hbWriter" value="${ loginUser.nickname }" readonly class="form-control input-sm" size="10" maxlength="20">
	                                         </c:if>
										</div>
									</div>

								<!-- 	<div class="form-group">
										<label class="col-sm-2 control-label" for="wr_email">E-mail</label>
										<div class="col-sm-6">
											<input type="text" name="wr_email" id="wr_email" readonly
												value=""
												class="form-control input-sm email" size="50"
												maxlength="100">
										</div>
									</div> -->

									

									<div class="form-group">
										<label class="col-sm-2 control-label" for="wr_subject">제목<strong
											class="sound_only">*</strong></label>
										<div class="col-sm-10">
											<div class="input-group">
												<input type="text" name="frbTitle" required
													class="form-control input-sm" size="50" maxlength="255">
													
											</div>
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-2 control-label">내용</label>
										<div class="col-sm-12">
											<span class="sound_only"></span>
											<textarea id="wr_content" name="frbContent"
												class="form-control input-sm write-content"
												maxlength="65536" style="width: 100%; height: 300px"></textarea>
											<span class="sound_only"></span>
										</div>
									</div>


									<div class="form-group">
										<label class="col-sm-2 control-label">첨부파일</label>
										<div class="col-sm-10">
											<button class="btn btn-blue btn-sm" type="button"
												onclick="add_file();">
												<i class="fa fa-plus-circle fa-lg"></i> 추가하기
											</button>
											<button class="btn btn-red btn-sm" type="button"
												onclick="del_file();">
												<i class="fa fa-times-circle fa-lg"></i> 삭제하기
											</button>
										</div>
									</div>
									<div class="form-group" style="margin-bottom: 0;">
										<div class="col-sm-10 col-sm-offset-2">
											<table id="variableFiles">
												<tbody>
													<!-- <tr>
														<td><div class="row">
																<div class="col-sm-7">
																	<div class="form-group">
																		<div class="input-group input-group-sm">
																			<span class="input-group-addon">파일 0</span>
																			<input type="file" class="input-sm" name="uploadFile">
																		</div>
																	</div>
																</div>
															</div></td>
													</tr> -->
												</tbody>
											</table>
										</div>
									</div>
									<script>
                                                    var flen = 0;
                                                    function add_file(delete_code) {
                                                        var upload_count = 3;
                                                        if (upload_count && flen >= upload_count) {
                                                            alert("이 게시판은 "+upload_count+"개 까지만 파일 업로드가 가능합니다.");
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
                                                        		+(objNum+1)+"</span><input type='file' class='form-control input-sm' name='uploadFile' title='파일 용량 33,485,760 바이트 이하만 업로드 가능'"+(objNum+1)+"></div></div></div>";
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


									<div class="well well-sm text-center">

										<script> var g5_captcha_url  = "http://myroom.oceanmate.co.kr/plugin/kcaptcha";</script>
										<script
											src="http://myroom.oceanmate.co.kr/plugin/kcaptcha/kcaptcha.js"></script>
										<fieldset id="captcha" class="captcha">
											<legend>
												<label for="captcha_key">자동등록방지</label>
											</legend>
											<img
												src="http://myroom.oceanmate.co.kr/plugin/kcaptcha/kcaptcha_image.php?t=1571763466619"
												alt="" id="captcha_img">
											<button type="button" id="captcha_mp3">
												<span></span>숫자음성듣기
											</button>
											<button type="button" id="captcha_reload">
												<span></span>새로고침
											</button>
											<input type="text" name="captcha_key" id="captcha_key"
												required="" class="captcha_box required" size="6"
												maxlength="6"> <span id="captcha_info">자동등록방지
												숫자를 순서대로 입력하세요.</span>
										</fieldset>
									</div>

									<div class="write-btn pull-center">
										<button type="submit" id="btn_submit" accesskey="s" class="btn btn-success btn-sm"><i class="fa fa-check"></i> <b>작성완료</b></button>
										<!-- <a href="bdetail.hm" id="btn_submit" accesskey="s"
											class="btn btn-success btn-sm"><i class="fa fa-check"></i>
											<b>작성완료</b></a>  -->
										<a href="frblist.fr" class="btn btn-danger btn-sm" role="button">취소</a>
									</div>

							

								</form>
							</div>

						</div>

					</div>
				</div>
				<!-- End Main Column -->
				<!-- Side Column -->
				<div class="col-md-3">
					<!-- Recent Posts -->
					<div class="panel panel-success">
						<div class="panel-body" style="background-color: white;">
							<!-- <a href="#"><b>룸메이트</b></a> <br>
                                <a href="#">하우스메이트</a> <br>
                                <a href="#">신입생메이트</a> -->
							<ul class="nav nav-pills nav-stacked">
								<li><a href="#sample-3a" data-toggle="tab"> <i
										class="fa fa-cloud"></i> 룸메이트
								</a></li>
								<li class="active"><a href="#sample-3b" data-toggle="tab">
										<i class="fa fa-home"></i> 하우스메이트
								</a></li>
								<li><a href="#sample-3c" data-toggle="tab"> <i
										class="fa fa-comments"></i> 신입생메이트
								</a></li>

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
						<c:import url="../../common/noticeTopList.jsp"/>
					</div>
					<!-- End recent Posts -->
					<!-- 공지사항 -->
					<div class="panel panel-info">
						<!-- 이슈 시작-->
						<c:import url="../../common/recentPosts.jsp"/>
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
	<c:import url="../../common/footer.jsp" />
	<!-- ==== FOOTER END ==== -->
</body>
</html>