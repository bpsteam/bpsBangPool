<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <style>
    /*  ㅇㅇ   dd
    	#ultag li {
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
                                            <form action="bupdate.rm" method="post" enctype="Multipart/form-data" class="form-horizontal">
                                            	<!-- 페이지 처리 후 수정  -->
                                            	<%-- <input type="hidden" name="page" value="${ page }"> --%>
                                            	<%-- <input type="hidden" name="renameFileName" value="${ board.renameFileName }"> --%>
                                            	<input type="hidden" name="rbId" value="${ rboard.rbId }">
                                                        <div class="form-group has-feedback">
                                                        <label class="col-sm-2 control-label" for="wr_name">작성자<strong class="sound_only"></strong></label>
                                                        <div class="col-sm-3">
                                                            <input type="text" name="rbWriter" value="${ rboard.rbWriter }" id="wr_name" required="" class="form-control input-sm" size="10" maxlength="20" readonly>
                                                            <span class="fa fa-check form-control-feedback"></span>
                                                        </div>
                                                    </div>
                                                
                                                        <!-- <div class="form-group has-feedback">
                                                        <label class="col-sm-2 control-label" for="wr_password">비밀번호<strong class="sound_only">필수</strong></label>
                                                        <div class="col-sm-3">
                                                            <input type="password" name="wr_password" id="wr_password" required="" class="form-control input-sm" maxlength="20">
                                                            <span class="fa fa-check form-control-feedback"></span>
                                                        </div>
                                                    </div>
                                                
                                                        <div class="form-group">
                                                        <label class="col-sm-2 control-label" for="wr_email">E-mail</label>
                                                        <div class="col-sm-6">
                                                            <input type="text" name="wr_email" id="wr_email" value="" class="form-control input-sm email" size="50" maxlength="100">
                                                        </div>
                                                    	</div> -->
                                                
                                                        <!-- <div class="form-group">
                                                        <label class="col-sm-2 control-label" for="wr_homepage">홈페이지</label>
                                                        <div class="col-sm-6">
                                                            <input type="text" name="wr_homepage" id="wr_homepage" value="" class="form-control input-sm" size="50">
                                                        </div>
                                                   		 </div> -->
                                                   		 
                                                   		 <div class="form-group">
                                                    <label class="col-sm-2 control-label" for="RBTITLE">제목<strong class="sound_only">필수</strong></label>
                                                    <div class="col-sm-10">
                                                        <div class="input-group">
                                                            <!-- <input type="text" name="wr_subject" value="" id="wr_subject" required="" class="form-control input-sm" size="50" maxlength="255"> -->
                                                            <input type="text" name="rbTitle" value="${ rboard.rbTitle}" id="wr_subject" required="" class="form-control input-sm" size="50" maxlength="255">
                                                            <span class="input-group-btn">
                                                                <a href="http://myroom.oceanmate.co.kr/bbs/helper.php" target="_blank" class="btn btn-black btn-sm hidden-xs win_scrap">안내</a>
                                                                <a href="http://myroom.oceanmate.co.kr/bbs/helper.php?act=map" target="_blank" class="btn btn-black btn-sm hidden-xs win_scrap">지도</a>
                                                                                </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                                        <div class="form-group">
                                                        <label class="col-sm-2 control-label" for="RLOCATION"> 지역분류<strong class="sound_only">필수</strong></label>
                                                        <div class="col-sm-3">
                                                            <!-- <select name="ca_name" id="ca_name" required="" class="form-control input-sm"> -->
                                                            <select name="rLocation" id="ca_name" required="" class="form-control input-sm">
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
                                                        <label class="col-sm-2 control-label " for=RRENTTYPE>매물구분<strong class="sound_only">필수</strong></label>
                                                        <div class="col-sm-3">
                                            
                                                            <select name="rRentType" id="wr_1" required="" itemname="게시물분류" class="form-control input-sm">
                                                                <option value="" selected="">매물구분 선택</option>
                                                                <option value="전세">전세</option>
                                                                <option value="월세">월세</option>
                                                                <option value="매매">매매</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                            
                                                    <div class="form-group">
                                                        <!-- <label class="col-sm-2 control-label " for="RLIVINGTYPE">매물종류<strong class="sound_only">필수</strong></label> -->
                                                        <label class="col-sm-2 control-label " for="RLIVINGTYPE">매물종류<strong class="sound_only">필수</strong></label>
                                                        <div class="col-sm-3">
                                                            <select name="rLivingType" id="wr_7" required="" itemname="매물종류" class="form-control input-sm">
                                                                <option value="">매물종류 선택</option>
                                                                <option value="오피스텔">오피스텔</option>
                                                                <option value="아파트">아파트</option>
                                                                <option value="빌라">빌라</option>
                                                                <option value="단독주택">단독주택</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                
                                                
                                                
                                                    <div class="form-group">
                                                        <!-- <label class="col-sm-2 control-label " for="RROOMCOUNT">방갯수<strong class="sound_only">필수</strong></label> -->
                                                        <label class="col-sm-2 control-label " for="RROOMCOUNT">방갯수<strong class="sound_only">필수</strong></label>
                                                        <div class="col-sm-3">
                                                        
                                                        <select name="rRoomCount" required="" itemname="방갯수" class="form-control input-sm">
                                                            <option value="" selected="">방갯수를 선택해주세요.</option>
                                                            <option value="원룸">원룸</option>
                                                            <option value="투룸">투룸</option>
                                                            <option value="쓰리룸">쓰리룸</option>
                                                            <option value="포룸">포룸</option>
                                                        </select>
                                                        </div>
                                                    </div>
                                            
                                                
                                                
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label " for="RFLOOR">해당층수<strong class="sound_only">필수</strong></label>
                                                        <div class="col-sm-3">
                                                        <select name="rFloor" required="" itemname="해당층수" class="form-control input-sm">
                                                            <option value="" selected="">층수를 선택해주세요.</option>
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
                                            
                                            
                                            
                                                    <!-- <div class="form-group">
                                                        <label class="col-sm-2 control-label " for="ca_name">핸드폰<strong class="sound_only">필수</strong></label>
                                                        <div class="col-sm-7">
                                                        
                                                                        
                                                        <table>
                                                            <tbody><tr><td>
                                                        <select name="wr_4" itemname="핸드폰 국번" class="form-control input-sm" style="width:100px;">
                                                            <option value="" selected="">국번</option>
                                                            <option value="010">010</option>
                                                            <option value="011">011</option>
                                                            <option value="016">016</option>
                                                            <option value="017">017</option>
                                                            <option value="018">018</option>
                                                            <option value="019">019</option>
                                                        </select>
                                                        </td>
                                                        <td>
                                                        -
                                                        </td>
                                                        <td>
                                                        <input type="text" name="wr_5" size="4" maxlength="4" itemname="핸드폰 앞자리" value="" class="form-control input-sm">
                                                        </td>
                                                        <td>
                                                         -
                                                         </td>
                                                         <td>
                                                        <input type="text" name="wr_6" size="4" maxlength="4" itemname="핸드폰 뒷자리" value="" class="form-control input-sm">			
                                                        </td>
                                                        </tr></tbody></table>
                                                        </div>
                                                    </div> -->
                                                    
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label " for="RGENDER">상대 성별</label>
															<div class="col-sm-3">
																<select name="rReqGender" required class="form-control input-sm">
		                                                            <option value="" selected >원하는 상대 성별</option>
		                                                            <option value="무관">무관</option>
		                                                            <option value="여성">여성</option>
		                                                            <option value="남성">남성</option>
	                                                        	</select>
                                                      	  </div>
                                                    </div>
                                            
                                            
                                                    <div class="form-group">
                                                        <!-- <label class="col-sm-2 control-label " for="RPRICE">거래금액</label> -->
                                                        <label class="col-sm-2 control-label " for="RPRICE">거래금액</label>
                                                        <div class="col-sm-3">
                                                        
                                                        <input type="text" name="rPrice" size="50" value="${ rboard.rPrice}" class="form-control input-sm">
                                                        </div>
                                                    </div>
                                            
                                            
                                                    <div class="form-group">
                                                        <!-- <label class="col-sm-2 control-label " for="RPARKING">주차가능여부</label> -->
                                                        <label class="col-sm-2 control-label " for="RPARKING">주차가능여부</label>
                                                        <div class="col-sm-3">
                                                        
                                                        <input type="text" name="rParking" size="50" value="${ rboard.rParking}" class="form-control input-sm">
                                                        </div>
                                                    </div>
                                            
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">내용</label>
                                                    <div class="col-sm-12">
                                                                    <span class="sound_only"></span>
                                            <textarea id="wr_content" name="rbContent" class="form-control input-sm write-content" maxlength="65536" style="width:100%;height:300px">${ rboard.rbContent }</textarea>
                                            <span class="sound_only"></span>		</div>
                                                </div>
                                            
                                                            <div class="form-group">
                                                        <label class="col-sm-2 control-label" for="wr_link1">링크 #1</label>
                                                        <div class="col-sm-10">
                                                            <input type="text" name="wr_link1" value="" id="wr_link1" class="form-control input-sm" size="50">
                                                                                <div class="text-muted font-12" style="margin-top:4px;">
                                                                    유튜브, 비메오 등 동영상 공유주소 등록시 해당 동영상은 본문 자동실행
                                                                </div>
                                                                        </div>
                                                    </div>
                                                        <div class="form-group">
                                                        <label class="col-sm-2 control-label" for="wr_link2">링크 #2</label>
                                                        <div class="col-sm-10">
                                                            <input type="text" name="wr_link2" value="" id="wr_link2" class="form-control input-sm" size="50">
                                                                        </div>
                                                    </div>
                                                    
                                                        <style>
                                                    #variableFiles { width:100%; margin:0; border:0; }
                                                    #variableFiles td { padding:0px 0px 7px; border:0; }
                                                    #variableFiles input[type=file] { box-shadow : none; border: 1px solid #ccc !important; outline:none; }
                                                    #variableFiles .form-group { margin-left:0; margin-right:0; margin-bottom:7px; }
                                                    #variableFiles .checkbox-inline { padding-top:0px; font-weight:normal; }
                                                    </style>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">첨부파일</label>
                                                        <div class="col-sm-10">
                                                            <button class="btn btn-blue btn-sm" type="button" onclick="add_file();"><i class="fa fa-plus-circle fa-lg"></i> 추가하기</button>
                                                            <button class="btn btn-red btn-sm" type="button" onclick="del_file();"><i class="fa fa-times-circle fa-lg"></i> 삭제하기</button>
                                                        </div>
                                                    </div>
                                                    <div class="form-group" style="margin-bottom:0;">
                                                        <div class="col-sm-10 col-sm-offset-2">
                                                            <table id="variableFiles">
	                                                            <tbody>
		                                                            <tr>
			                                                            <td>
				                                                            <div class="row">
					                                                            <div class="col-sm-7">
					                                                            <div class="form-group">
					                                                            <div class="input-group input-group-sm">
					                                                            <span class="input-group-addon">파일 0</span>
					                                                            <input type="file" class="form-control input-sm" name="reloadFile" title="파일 용량 33,485,760 바이트 이하만 업로드 가능">
					                                                            <!-- <input type="file" class="form-control input-sm" name="reloadFile" title="파일 용량 33,485,760 바이트 이하만 업로드 가능"> -->
						                                                            <c:if test="${ !empty rboard.originalFileName }">
																						<br>현재 업로드한 파일 : 
																						<a href="${ contextPath }/resources/rmboarduploads/${ rboard.renameFileName }" download="${ rboard.originalFileName }">
																							${ rboard.originalFileName }
																						</a>
																					</c:if>
					                                                            </div>
					                                                            </div>
					                                                            </div>
				                                                            </div>
			                                                            </td>
		                                                            </tr>
	                                                            </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                    <script>
                                                    var flen = 0;
                                                    function add_file(delete_code) {
                                                        var upload_count = 2;
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
                                                        		   +objNum+"</span><input type='file' class='form-control input-sm' name='reloadFile' title='파일 용량 33,485,760 바이트 이하만 업로드 가능'></div></div></div>";
                                                        		   /* +objNum+"</span><input type='file' class='form-control input-sm' name='bf_file[]' title='파일 용량 33,485,760 바이트 이하만 업로드 가능'></div></div></div>"; */
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
                                            
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">첨부사진</label>
                                                        <div class="col-sm-10">
                                                            <label class="control-label sp-label">
                                                                <input type="radio" name="as_img" value="0" checked=""> 상단출력
                                                            </label>
                                                            <label class="control-label sp-label">
                                                                <input type="radio" name="as_img" value="1"> 하단출력
                                                            </label>
                                                            <label class="control-label sp-label">
                                                                <input type="radio" name="as_img" value="2"> 본문삽입
                                                            </label>
                                                            <div class="text-muted font-12" style="margin-top:4px;">
                                                                본문삽입시 {이미지:0}, {이미지:1} 과 같이 첨부번호를 입력하면 내용에 첨부사진 출력 가능
                                                            </div>
                                                        </div>
                                                    </div>
                                                
                                                        <div class="well well-sm text-center">
                                                        
                                            <script> var g5_captcha_url  = "http://myroom.oceanmate.co.kr/plugin/kcaptcha";</script>
                                            <script src="http://myroom.oceanmate.co.kr/plugin/kcaptcha/kcaptcha.js"></script>
                                            <fieldset id="captcha" class="captcha">
                                            <legend><label for="captcha_key">자동등록방지</label></legend>
                                            <img src="http://myroom.oceanmate.co.kr/plugin/kcaptcha/kcaptcha_image.php?t=1571763466619" alt="" id="captcha_img">
                                            <button type="button" id="captcha_mp3"><span></span>숫자음성듣기</button>
                                            <button type="button" id="captcha_reload"><span></span>새로고침</button><input type="text" name="captcha_key" id="captcha_key" required="" class="captcha_box required" size="6" maxlength="6">
                                            <span id="captcha_info">자동등록방지 숫자를 순서대로 입력하세요.</span>
                                            </fieldset>		</div>
                                                
                                                <div class="write-btn pull-center">
                                                    <button type="submit" id="btn_submit" accesskey="s" class="btn btn-success btn-sm"><i class="fa fa-check"></i> <b>작성완료</b>
	                                                    <c:url var="blist" value="blist.rm">
															<%-- <c:param name="page" value="${ page }"/> --%>
														</c:url>
                                                    </button>
                                                  <!-- <a href="bdetail.rm" id="btn_submit" accesskey="s" class="btn btn-success btn-sm"><i class="fa fa-check"></i> <b>작성완료</b></a> -->
                                                    <a href="blist.rm" class="btn btn-danger btn-sm" role="button">취소</a>
                                                </div>
                                            
                                                <div class="clearfix"></div>
                                            
                                                </form>
                                        </div>
                                        
                                    </div>
                                    
                                </div>
                        </div>
                    <!-- End Main Column -->
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
                                        <li class="active">
                                            <a href="#sample-3a" data-toggle="tab">
                                                <i class="fa fa-cloud"></i>  룸메이트</a>
                                        </li>
                                        <li>
                                            <a href="#sample-3b" data-toggle="tab">
                                                <i class="fa fa-home"></i>  하우스메이트</a>
                                        </li>
                                        <li>
                                            <a href="#sample-3c" data-toggle="tab">
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
                            <div class="panel-body" style="background-color: white;">
                                <div class="table-responsive">
                                    <table class="table table-hover" style="margin-bottom:0px">
        
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>공지사항입니다1</td>
                                                <td>07/19</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>공지사항입니다2</td>
                                                <td>08/24</td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>공지사항입니다3</td>
                                                <td>10/20</td>
                                            </tr>
                                            <tr style="border-bottom: 1px solid #dddddd;">
                                                <td>4</td>
                                                <td>공지사항입니다4</td>
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
</body>
</html>