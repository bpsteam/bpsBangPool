<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신입생 메이트 게시판</title>

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
            border-bottom: 1px solid #dddddd ;
        }
        #form label{
            margin-top: 5px;
        }
        
    
        
        #variableFiles { width:100%; margin:0; border:0; }
        #variableFiles td { padding:0px 0px 7px; border:0; }
        #variableFiles input[type=file] { box-shadow : none; border: 1px solid #ccc !important; outline:none; }
        #variableFiles .form-group { margin-left:0; margin-right:0; margin-bottom:7px; }
        #variableFiles .checkbox-inline { padding-top:0px; font-weight:normal; }
       
       
        </style>
 

</head>
<body>

<!-- ==== HEADER START ==== -->
	<c:import url ="../../common/header.jsp"/>
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
                                <h1><small>글쓰기</small></h1>
                                <div class="margin-bottom-10">
                                    <hr>
                                </div>
                                
                                <div class="panel panel-blue">
                                    <div class="panel-body" style="background-color: white;">
                                       <c:url var="bupdate" value="bupdate.fm">
                                       		<c:param name="fbId" value="${ board.fbId }"/>
                                       </c:url>
                                            <form action="${ bupdate }" method="post" enctype="Multipart/form-data" id="insertform" class="form-horizontal">
                                       
                                               <div class="form-group has-feedback">
	                                               <label class="col-sm-2 control-label" >작성자</label>
	                                               <div class="col-sm-3">
	                                                   <input type="text" name="fbWriter"  id="fbWriter" value="${ board.fbWriter }" readonly class="form-control input-sm" size="10" maxlength="20">
	                                               </div>
	                                           </div>
	                                           
										       <!-- ==== EMAIL AUTHORIZATION START ==== -->                                         
												<c:import url ="emailautho.jsp"/>
										       <!-- ==== EMAIL AUTHORIZATION END ==== -->                                         
										                                                
                                                <div class="form-group">
                                                     <label class="col-sm-2 control-label" >
                                                        지역분류 			<strong class="sound_only">*</strong></label>
                                                        <div class="col-sm-3">
                                                            <select name="fLocation" id="fLocation" required class="form-control input-sm">
                                                                <option value="">선택하세요</option>
                                                                <option value="서울">서울</option>
					                                            <option value="인천/부천">인천/부천</option>
					                                            <option value="수원/경기">수원/경기</option>
					                                            <option value="대구/경북">대구/경북</option>
					                                            <option value="부산/경남">부산/경남</option>
					                                            <option value="충청/강원">충청/강원</option>
					                                            <option value="광주/전라">광주/전라</option>
                                                            </select>
                                                        </div>
                                                </div>
                                                        
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">제목<strong class="sound_only">*</strong></label>
                                                    <div class="col-sm-10">
                                                        <div class="input-group">
                                                            <input type="text" name="fbTitle" value="${ board.fbTitle }" id="fbTitle" required class="form-control input-sm" size="50" maxlength="255">
                                                           <!--  <span class="input-group-btn">
                                                                <a href="http://myroom.oceanmate.co.kr/bbs/helper.php" target="_blank" class="btn btn-black btn-sm hidden-xs win_scrap">안내</a>
                                                                <a href="http://myroom.oceanmate.co.kr/bbs/helper.php?act=map" target="_blank" class="btn btn-black btn-sm hidden-xs win_scrap">지도</a>
                                                                                </span> -->
                                                        </div>
                                                    </div>
                                                </div>
                                            
                                            
                                            
                                            
                                            
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label " >매물구분<strong class="sound_only">*</strong></label>
                                                        <div class="col-sm-3">
                                            
                                                            <select name="fRentType" id="fRentType" required class="form-control input-sm">
                                                                <option value="" selected>매물구분 선택</option>
                                                                <option value="전세">전세</option>
                                                                <option value="월세">월세</option>
                                                                <option value="매매">매매</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                            
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label " for="ca_name">매물종류<strong class="sound_only">*</strong></label>
                                                        <div class="col-sm-3">
                                                            <select name="fLivingType" id="fLivingType" required class="form-control input-sm">
                                                                <option value="">매물종류 선택</option>
                                                                <option value="오피스텔">오피스텔</option>
                                                                <option value="아파트">아파트</option>
                                                                <option value="빌라">빌라</option>
                                                                <option value="단독주택">단독주택</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label " for="ca_name">방갯수<strong class="sound_only">*</strong></label>
                                                        <div class="col-sm-3">
                                                        
                                                        <select name="fRoomCount" id="fRoomCount" required  class="form-control input-sm">
                                                            <option value="" selected>방갯수를 선택해주세요.</option>
                                                            <option value="원룸">원룸</option>
                                                            <option value="투룸">투룸</option>
                                                            <option value="쓰리룸">쓰리룸</option>
                                                            <option value="포룸">포룸</option>
                                                        </select>
                                                        </div>
                                                    </div>
                                            
                                                
                                                
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label " for="ca_name">해당층수<strong class="sound_only">*</strong></label>
                                                        <div class="col-sm-3">
                                                        <select name="fFloor" id="fFloor" required class="form-control input-sm">
                                                            <option value="" selected>층수를 선택해주세요.</option>
                                                            <option value="지하">지하</option>
                                                            <option value="반지하">반지하</option>
                                                            <option value="1층">1층</option>
                                                            <option value="2층">2층</option>
                                                            <option value="3층">3층</option>
                                                            <option value="4층">4층</option>
                                                            <option value="5층">5층</option>
                                                            <option value="6층이상">6층이상</option>
                                                        </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label ">상대성별<strong class="sound_only">*</strong></label>
                                                        <div class="col-sm-4">
                                                        <select name="fReqGender" id="fReqGender" required class="form-control input-sm">
                                                            <option value="" selected >원하는 상대 성별을 선택해주세요.</option>
                                                            <option value="무관">무관</option>
                                                            <option value="여성">여성</option>
                                                            <option value="남성">남성</option>
                                                        </select>
                                                        </div>
                                                    </div>



									<div class="form-group">
										<label class="col-sm-2 control-label " for="ca_name">핸드폰<strong
											class="sound_only">*</strong></label>
										<div class="col-sm-7">
											<table>
												<tbody>
													<tr>
														<td><input type="tel" name="phone1" size="3"
															maxlength="3" class="form-control input-sm" value="${ phone1 }"></td>
														<td>-</td>
														<td><input type="tel" name="phone2" size="4"
															maxlength="4" class="form-control input-sm" value="${ phone2 }"></td>
														<td>-</td>
														<td><input type="tel" name="phone3" size="4"
															maxlength="4" class="form-control input-sm" value="${ phone3 }"></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>


									<div class="form-group">
                                        <label class="col-sm-2 control-label " for="ca_name">거래금액</label>
                                        <div class="col-sm-3">
                                        <input type="text" value="${ board.fPrice }"name="fPrice" size="50"class="form-control input-sm">
                                        </div>
                                    </div>
                               
                               
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label " for="ca_name">주차가능여부</label>
                                        <div class="col-sm-4">
                                        <select name="fParking" id="fParking" required class="form-control input-sm">
                                            <option value="" >주차가능여부를 선택해주세요.</option>
                                            <option value="가능">가능</option>
                                            <option value="불가능">불가능</option>
                                        </select>
                                        </div>
                                    </div>
                                            
                                            
                                  <div class="form-group">
                                   <label class="col-sm-2 control-label">내용</label>
                                   <div class="col-sm-12">
                                            <span class="sound_only"></span>
                                            <textarea id="fbContent" name="fbContent" class="form-control input-sm write-content" maxlength="65536" style="width:100%;height:300px">${ board.fbContent }</textarea>
                                            <span class="sound_only"></span>		
                                    </div>
                               	  </div>
                                            
                                     
                                  <div class="form-group">
                                      <label class="col-sm-2 control-label">첨부파일</label>
                                      <div class="col-sm-10">
                                          <button class="btn btn-blue btn-sm" type="button" onclick="add_file();"><i class="fa fa-plus-circle fa-lg"></i> 추가</button>
                                          <button class="btn btn-red btn-sm" type="button" onclick="del_file();"><i class="fa fa-times-circle fa-lg"></i> 삭제</button>
                                      </div>
                                  </div>
                                   <div class="form-group" style="margin-bottom:0;">
										<div class="col-sm-10 col-sm-offset-2">
											<table id="variableFiles">
												<tbody>
													<!-- <tr>
														<td>
															<div class="row">
																<div class="col-sm-7">
																	<div class="form-group">
																		<div class="input-group input-group-sm">
																			<span class="input-group-addon">파일 0</span> 
																			<input type="file" class="input-sm" name="reloadFile" >
																		</div>
																	</div>
																</div>
															</div>
														</td>
													</tr> -->
												</tbody>
											</table>
										</div>
									</div>
                                            
                                                  
                                                        <div class="well well-sm text-center">
                                           <!-- 자동등록방지 -->
										
										<c:import url ="../../common/captchaApi/naverCaptcha.jsp"/>
									
										<!-- 자동등록방지 -->
                                            
                                            </div>
                                                <c:url var="bDetail" value="bdetail.fm">
	                         				  <c:param name="fbId" value="${ board.fbId }"/>
	                         				  </c:url>
                                             
                                                <div class="write-btn pull-center">
                                                    <button type="submit" id="submit" accesskey="s" class="btn btn-success btn-sm"><i class="fa fa-check"></i> <b>작성완료</b></button>
                                                    <!-- <a href="bdetail.fm" id="btn_submit" accesskey="s" class="btn btn-success btn-sm"><i class="fa fa-check"></i> <b>작성완료</b></a> -->
                                                    <a href="${ bDetail }" class="btn btn-danger btn-sm" role="button">취소</a>
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
                                        <li >
                                            <a href="#sample-3a" data-toggle="tab">
                                                <i class="fa fa-cloud"></i>  룸메이트</a>
                                        </li>
                                        <li>
                                            <a href="#sample-3b" data-toggle="tab">
                                                <i class="fa fa-home"></i>  하우스메이트</a>
                                        </li>
                                        <li class="active">
                                            <a href="#sample-3c" data-toggle="tab">
                                                <i class="fa fa-comments"></i>  신입생메이트</a>
                                        </li>
                                        
                                    </ul>
                            </div>
                        </div>
                       		<!-- category 시작 -->
					<c:import url="../../common/rightCategory.jsp" />
					<!-- category  끝-->
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
					+ "</span>	<input type='file' class='input-sm' name='reloadFile"+(objNum+1)+"'></div></div></div>";
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
			
			$(function(){
				var fLocation = "${board.fLocation}";
				var fRentType = "${board.fRentType}";
				var fLivingType = "${board.fLivingType}";
				var fRoomCount = "${board.fRoomCount}";
				var fFloor = "${board.fFloor}";
				var fReqGender = "${board.fReqGender}";
				var fParking = "${board.fParking}";
			/* 	
				console.log(fLocation+", "
							+fRentType+", "	
							+fLivingType+", "	
							+fRoomCount+", "	
							+fFloor+", "	
							+fReqGender+", "	
							+fParking); */
			//	$("#셀렉트ID")val("1번").attr("selected", "selected");
			
			$("#fLocation").val(fLocation).attr("selected","selected");
			$("#fRentType").val(fRentType).attr("selected","selected");
			$("#fLivingType").val(fLivingType).attr("selected","selected");
			$("#fRoomCount").val(fRoomCount).attr("selected","selected");
			$("#fFloor").val(fFloor).attr("selected","selected");
			$("#fReqGender").val(fReqGender).attr("selected","selected");
			$("#fParking").val(fParking).attr("selected","selected");
	
			
			});
			
			
		</script>
	    
	


<!-- ==== FOOTER START ==== -->
	<c:import url ="../../common/footer.jsp"/>
<!-- ==== FOOTER END ==== -->
</body>
</html>