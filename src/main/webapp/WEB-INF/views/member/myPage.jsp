<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
 /* 1114test */
        #ultag li {
            display: inline;
            padding: 0 30px;
        }

        #table th {
            width: 150px;

        }

        #table td {
            width: 150px;
        }
    
    .btn.btn-lightgray { 
   color: #333 !important; border-image: none !important; background-image: none !important;
   border: 1px solid #ddd; 
   background-color: #fafafa; 
    }

    .section_matching {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 500; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  }

  .matching_content {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    width: 100%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s
  }


/********************************************************
■ Page Title : 페이지 타이틀 및 설명글
********************************************************/
.at-title { height:55px; position:relative; color:#000; background-color: #fafafa; border:1px solid #dfdfdf; border-radius: 5px; }
.at-title .at-container { height:100%; position:relative; }
.at-title .page-title { font-size:24px; position:absolute; left:20px; bottom:15px; z-index:1; }
.at-title .page-desc { color:#888; position:absolute; right:20px; bottom:10px; z-index:1; }
@media all and (max-width:767px) {
   .responsive .at-title { height:50px; }
   .responsive .at-title .page-title { font-size:20px; left:15px; bottom:10px; }
}

.btn.btn-navy {
    color: #fff !important;
    border-image: none !important;
    background-image: none !important;
    border: 1px solid rgb(40, 40, 50);
    background-color: rgb(50, 60, 70);
}

.basic-outlogin .profile h3 {
    font-size: 18px;
    line-height: 32px;
    padding: 0px;
    margin: 0px;
    letter-spacing: -1px;
    display: block;
    text-overflow: ellipsis;
    white-space: nowrap;
    word-wrap: normal;
    overflow: hidden;
}

.text-muted {
    color: #777;
}


    </style>

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
            <div class="container background-white">

                <div class="row margin-vert-30">
                    <!-- Main Column -->
                    <div class="col-md-9">
                            <!-- Tab v2 -->
                            <div class="tabs alternative">
                                <div class="at-title" style="width:950px;">
                                    <div class="at-container">
                                        <div class="page-title en">
                                            <strong>
                                                <i class="fa fa-user"></i>마이페이지 </strong>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="page-desc hidden-xs">
                                            마이페이지 </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <br>
                                <div class="tab-content" style="border-top: 1px; width:950px;">
                                
                                
                                    <div class="tab-pane fade in active" id="sample-2a">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="table-responsive">
                                                    <div class="panel panel-default view-author">
                                                        <div class="panel-heading">
                                                            <h3 class="panel-title">My Profile</h3>
                                                        </div>
                                                        <div class="panel-body" style="background-color:white;">
                                                            
                                                            <!-- 여기 -->
                                                            <div class="panel-body">
                                                <div class="pull-left text-center auth-photo" style="width:100px;">
                                                   <%-- <div class="img-photo">
                                                         <img src="${ contextPath }/resources/456.jpg" style="width: 100%;">
                                                   </div> --%>
                                                   
                                                   
                                                <!-- 사진등록  -->   
                                                <div class="member/profile">
                                                   <!-- <a href="http://myroom.oceanmate.co.kr/bbs/myphoto.php" target="_blank" class="win_memo" title="사진등록"> -->
                                                   <%-- <a href="${ pageContext.request.contextPath }/WEB-INF/views/memebr/myPhoto.jsp" target="_blank" class="win_memo" title="사진등록"> --%>
                                                   
                                                   <a href="mProfile.me" target="_blank" class="win_memo" title="사진등록">
                                                      <div class="photo pull-left">
                                                      <c:if test="${ empty loginUser.renameFileName }">
                                                         <img src="${ contextPath }/resources/photo.png" style="width:80px; border-radius:50px;">
                                                      </c:if>
                                                         
                                                      <c:if test="${ !empty loginUser.renameFileName }">
                                                         <img src="${ contextPath }/resources/profileUpload/${ loginUser.renameFileName }"style="width:80px;border-radius:50px;">
                                                      </c:if>
                                                      </div>
                                                   </a>
                                                   <div class="clearfix"></div>
                                                </div>   
                                                   
                                                   <!-- 
                                                   0 ~ 3 : 베이직
                                                   3 ~ 5 : 실버
                                                   5 ~ 10 : 골드-->
                                                   <c:if test="loginCount lte 3">
                                                      
                                                   </c:if>
                                                   
                                                   <div class="btn-group" style="margin-top:-10px;margin-left:-20px;white-space:nowrap;">
                                                      <button type="button" class="btn btn-blue btn btn-primary btn-sm" onclick="apms_like('khajsfirepunch', 'like', 'it_like'); return false;" title="Like">
                                                         <i class="fa fa-thumbs-up"></i> <span id="it_like">0</span>
                                                      </button>
                                                      <button type="button" class="btn btn-color btn-sm btn btn-red btn btn-primary btn-sm" onclick="apms_like('khajsfirepunch', 'follow', 'it_follow'); return false;" title="Follow">
                                                         <i class="fa fa-users"></i> <span id="it_follow">0</span>
                                                      </button>
                                                   </div>
                                                </div>
                                                <div class="auth-info">
                                                   <div class="en font-14" style="margin-bottom:6px;">
                                                      <span class="pull-right font-12">
                                                         <c:if test="${ mlCode eq 'B' }">Exp 0 (0%)</c:if>
                                                         <c:if test="${ mlCode eq 'S' }">Exp 30 (30%)</c:if>
                                                         <c:if test="${ mlCode eq 'G' }">Exp 60 (60%)</c:if>
                                                      </span>
                                                      
                                                      <!-- <b><a href="javascript:;" onclick="showSideView(this, 'khajsfirepunch', '중중식', '', '');"> -->
                                                      <span class="member">
                                                         <span class="lv-icon lv-1">
                                                            <%-- <choose>
                                                               <when test="${ mlCode eq 'B' }"><img src="${ contextPath }/resources/lv_basic.png" style="width: 30px;"></when>
                                                               <when test="${ mlCode eq 'S' }"><img src="${ contextPath }/resources/lv_silver.png" style="width: 30px;"></when>
                                                               <when test="${ mlCode eq 'G' }"><img src="${ contextPath }/resources/lv_gold.png" style="width: 30px;"></when>
                                                            </choose> --%>
                                                         
                                                            <c:if test="${ mlCode eq 'B' }"><img src="${ contextPath }/resources/lv_basic.png" style="width: 30px;"></c:if>
                                                            <c:if test="${ mlCode eq 'S' }"><img src="${ contextPath }/resources/lv_silver.png" style="width: 30px;"></c:if>
                                                            <c:if test="${ mlCode eq 'G' }"><img src="${ contextPath }/resources/lv_gold.png" style="width: 30px;"></c:if>
                                                         </span> ${ loginUser.nickname }</span></a></b> &nbsp;
                                                      <span class="text-muted en font-12">
                                                      <c:if test="${ mlCode eq 'B' }">BASIC</c:if>
                                                      <c:if test="${ mlCode eq 'S' }">SILVER</c:if>
                                                      <c:if test="${ mlCode eq 'G' }">GOLD</c:if>
                                                      레벨
                                                      </span>
                                                   </div>
                                                   <br>
                                                   
                                                <c:if test="${ mlCode eq 'G' }">   
                                                   <div class="progress progress-striped active">
                                                                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 90%;">
                                                                    <span class="sr-only">90% Complete (Sucess)</span>
                                                                </div>
                                                            </div>
                                                         </c:if>
                     
                                                <c:if test="${ mlCode eq 'S' }">
                                                   <div class="progress progress-striped active">
                                                                <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 30%;">
                                                                    <span class="sr-only">30% Complete (info)</span>
                                                                </div>
                                                            </div>
                                                         </c:if>

                                                <c:if test="${ mlCode eq 'B' }">
                                                   <div class="progress progress-striped active">
                                                                <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 20%;">
                                                                    <span class="sr-only">20%Complete (warning)</span>
                                                                </div>
                                                            </div>
                                                         </c:if>
                                                         
                                                </div>
                                                <div class="clearfix"></div>
                                             </div>
                                                            <!-- 끝 -->
                                                            
                                                            
                                                            <div class="clearfix"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
    
                                    <div class="row">
                                        <div class="col-sm-7">
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title">My Info</h3>
                                                </div>
                                                <ul class="list-group" style="background-color:white;">
                                                    <li class="list-group-item">
                                                        <a href="http://myroom.oceanmate.co.kr/bbs/point.php" target="_blank" class="win_point">
                                                            <span class="pull-right">0점</span>
                                                            MP                  </a>
                                                    </li>
                                                    <li class="list-group-item">
                                                        <span class="pull-right">${ loginUser.phone }</span>
                                                        연락처
                                                    </li>
                                                    <li class="list-group-item">
                                                        <span class="pull-right">${ loginUser.email }</span>
                                                        E-Mail
                                                    </li>
                                                    <li class="list-group-item">
                                                        <span class="pull-right">${ loginUser.gender }</span>
                                                       성별
                                                    </li>
                                                    
                                                    <li class="list-group-item" style="height:88px">
                                                        <span class="pull-right" style="text-align:right">${ loginUser.address }</span>
                                                        주소
                                                    </li>
                                                    <li class="list-group-item">
                                                        <button id="matching_onclick" type="button" class="btn btn-primary btn-sm" style="width: 100%;">나에게 맞는 메이트 찾기</button>
                                                    </li>
                                                                    </ul>
                                                            </div>
                                        </div>
                                      
                                        <div class="col-sm-5">
                                            <div class="panel panel-default">
                                               <!-- recentPost 최근 본 개시물 Import -->
                                               <c:import url="../common/recentPosts.jsp"/>
                                               <!-- recentPost Import -->
                                            </div>
                                        </div>
                                        <div class="col-sm-4"></div>
                                        <div class="col-sm-8">
                                                <div class="col-xs-3">
                                                    <div class="form-group">
                                                        <a href="mupConfirm.me" class="btn btn-green btn-sm btn-block">
                                                            정보수정
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col-xs-3">
                                                    <div class="form-group">
                                                        <button id="deleteMember" class="btn btn-red btn-sm btn-block leave-me">
                                                            탈퇴하기
                                                        </button>
                                                    </div>
                                                </div>
                                        </div>
                                    </div>
                                    
    
                                </div>
    
                            </div>
    
                        </div>
                    <!-- End Main Column -->
                    <!-- Side Column -->
                    <div class="col-md-3">
                    
                    
                        <!-- Recent Posts -->
                        <!-- <button id="matching_onclick" type="button" class="btn btn-primary btn-sm" style="width: 100%;">나에게 맞는 메이트 찾기</button> -->
                        <div id="matching_form" class="section_matching">
                            <div class="matching_content">
                                <div class="col-md-6 col-md-offset-3 col-sm-offset-3">
                        <form class="signup-page" id="mform">
                           <div class="signup-header">
                              <h2 style="display: inline;">나에게 맞는 메이트는?</h2>
                              <span class="close"><h1 style="display: inline;">&times;</h1></span>
                              <br>
                              <br>
                              <br>
                              <br> 
                           </div>
                           <div class="row">
                              <div class="col-sm-6">
                                 <label>메이트 *</label>
                                 <select id="mBcode" 
                                    class="form-control margin-bottom-20">
                                    <option value="">선택</option>
                                    <option value="RMBCODE">룸메이트</option>
                                    <option value="HMBCODE">하우스메이트</option>
                                    <option value="FMBCODE">신입생메이트</option>
                                 </select>
                              </div>
                           </div>
                           <div class="row">
                              <div class="col-sm-6">
                                 <label>지역</label> 
                                 <select id="mLocation" class="form-control margin-bottom-20">
                                    <option value="">선택하세요</option>
                                    <option value="서울">서울</option>
                                    <option value="인천">인천/부천</option>
                                    <option value="수원">수원/경기</option>
                                    <option value="대구">대구/경북</option>
                                    <option value="부산">부산/경남</option>
                                    <option value="충청">충청/강원</option>
                                    <option value="광주">광주/전라</option>
                                 </select>
                              </div>
                              <div class="col-sm-6">
                                 <label>상대 성별</label> 
                                 <select id="mReqgender" class="form-control margin-bottom-20">
                                    <option value="">선택하세요</option>
                                    <option value="무관">무관</option>
                                    <option value="남성">남성</option>
                                    <option value="여성">여성</option>
                                 </select>
                              </div>
                           </div>
                           <div class="row">
                              <div class="col-sm-6">
                                 <label>주거형태</label> 
                                 <select id="mLivingType"class="form-control margin-bottom-20">
                                    <option value="">선택하세요</option>
                                    <option value="단독주택">단독주택</option>
                                    <option value="빌라">빌라</option>
                                    <option value="아파트">아파트</option>
                                    <option value="오피스텔">오피스텔</option>
                                 </select>
                              </div>
                              <div class="col-sm-6">
                                 <label>방갯수</label> 
                                 <select id="mRoom" class="form-control margin-bottom-20">
                                    <option value="">선택하세요</option>
                                    <option value="원룸">원룸</option>
                                    <option value="투룸">투룸</option>
                                    <option value="쓰리룸">쓰리룸</option>
                                    <option value="포룸">포룸</option>
                                 </select>
                              </div>
                           </div>


                           <div class="row">
                              <div class="col-lg-8"></div>
                              <div class="col-lg-4 text-right">
                                 <button class="btn btn-primary" type="button" id="matchingBtn">매칭하기</button>
                              </div>
                           </div>
                           <hr>

                           <!-- 매칭하기 누른 후 추천 메이트 목록 보여주기 -->
                           <div class="row" >
                              <div class="col-md-12" id="matListDiv">

               
                              </div>
                           </div>
                        </form>
                     </div>
                            </div>
                        </div>
                        
                        <script>
                        
                  var section_matching = document.getElementById("matching_form");

                  var matching_btn = document.getElementById("matching_onclick");

                  var span = document.getElementsByClassName("close")[0];

                  matching_btn.onclick = function() {
                     section_matching.style.display = "block";
                  }

                  span.onclick = function() {
                     section_matching.style.display = "none";
                  }
                  
                  
                  // "나에게 맞는 메이트 찾기" 버튼 눌렀을 때
                  $("#matchingBtn").on("click", function(){
                     var mBcode = $("#mBcode option:selected").val();
                     var mLocation = $("#mLocation option:selected").val();
                     var mReqgender = $("#mReqgender option:selected").val();
                     var mLivingType = $("#mLivingType option:selected").val();
                     var mRoom = $("#mRoom option:selected").val(); 
                     console.log(mBcode);
                     
                     $.ajax({
                        url: "matchingList.mc",
                        data: {mBcode:mBcode, mLocation:mLocation, mReqgender:mReqgender,
                           mLivingType:mLivingType, mRoom:mRoom},
                        type: "post",
                        success: function(data){
                           console.log("ajax 성공");
                           $(".section_matching").css('display','block');
                           
                           $matListDiv = $("#matListDiv");
                           $matListDiv.html("");
                           console.log(data);
                           
                           var $mDiv;
                           var $atag;
                           var $figuretag;
                           var $imgtag;
                           var $h6tag;
                           
                           if(data.length > 0){
                              
                              switch (data[0].bcode) {
                              case "RMBCODE":
                                 for(var i in data){
                                    $mDiv = $("<div>").addClass("col-md-4 portfolio-item margin-bottom-40 design");
                                    $atag = $("<a>").attr('href','bdetail.rm?rbId='+data[i].rbId);
                                    $figuretag = $("<figure>");
                                    if(data[i].renameFileName != null){
                                       $imgtag = $("<img>").attr('src','${ contextPath }/resources/rmboarduploads/'+data[i].renameFileName)
                                         .width('400px').height('200px');
                                    } else {
                                       $imgtag = $("<img>").attr('src', '${ contextPath }/resources/assets/img/matching1.JPG')
                                                     .width('400px').height('200px');
                                    }
                                    $h6tag = $("<h6>").addClass("project-item__cover__title").text(data[i].rbTitle);
                                    
                                    $mDiv.append($atag);
                                    $atag.append($figuretag); 
                                    $figuretag.append($imgtag);
                                    $atag.append($h6tag);
                                    $matListDiv.append($mDiv);
                                 }
                                 break;
                                 
                              case "HMBCODE":
                                 for(var i in data){
                                    $mDiv = $("<div>").addClass("col-md-4 portfolio-item margin-bottom-40 design");
                                    $atag = $("<a>").attr('href','bdetail.hm?hbId='+data[i].hbId);
                                    $figuretag = $("<figure>");
                                    if(data[i].renameFileName != null){
                                       $imgtag = $("<img>").attr('src','${ contextPath }/resources/hmBoardUploadFiles/'+data[i].renameFileName)
                                         .width('400px').height('200px');
                                    } else {
                                       $imgtag = $("<img>").attr('src', '${ contextPath }/resources/assets/img/matching1.JPG')
                                                     .width('400px').height('200px');
                                    }
                                    $h6tag = $("<h6>").addClass("project-item__cover__title").text(data[i].hbTitle);
                                    
                                    $mDiv.append($atag);
                                    $atag.append($figuretag); 
                                    $figuretag.append($imgtag);
                                    $atag.append($h6tag);
                                    $matListDiv.append($mDiv);
                                 }
                                 break;
                              case "FMBCODE":
                                 for(var i in data){
                                    $mDiv = $("<div>").addClass("col-md-4 portfolio-item margin-bottom-40 design");
                                    $atag = $("<a>").attr('href','bdetail.fm?fbId='+data[i].fbId);
                                    $figuretag = $("<figure>");
                                    if(data[i].renameFileName != null){
                                       $imgtag = $("<img>").attr('src','${ contextPath }/resources/fmboarduploads/'+data[i].renameFileName)
                                         .width('400px').height('200px');
                                    } else {
                                       $imgtag = $("<img>").attr('src', '${ contextPath }/resources/assets/img/matching1.JPG')
                                                     .width('400px').height('200px');
                                    }
                                    $h6tag = $("<h6>").addClass("project-item__cover__title").text(data[i].fbTitle);
                                    
                                    $mDiv.append($atag);
                                    $atag.append($figuretag); 
                                    $figuretag.append($imgtag);
                                    $atag.append($h6tag);
                                    $matListDiv.append($mDiv);
                                 }
                                 break;
                              default:
                                 break;
                              }
                              
                           }
                           
                           
                           // 모달창의 x를 누를때  기존값 초기화시키기
                           $(".close").on("click", function(){
                              $matListDiv.html("");
                              $("#mform").each(function() {
                                 this.reset();   
                              });
                           });
                           
                        },
                        error: function() {
                           alert("필수 항목을 반드시 입력해주세요.");
                        }
                     });
                     
                  });
                  
               </script>
                        <br><br>
                        
                        
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

 <!-- 비밀번호 불일치 모달 -->
   <div class="modal fade" id="pwdCheck" tabindex="-1" role="dialog"
      aria-labelledby="myModalLabel" aria-hidden="true"
      style="display: none;">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal"
                  aria-hidden="true">×</button>
               <h4 class="modal-title" id="myModalLabel"> 탈퇴회원 비밀번호 확인 </h4>
            </div>
            <div class="modal-body">
            본인 확인을 위해 가입시 입력하신 비밀번호를 입력해주세요<br>
            <div class="form-group has-feedback" >
               <label><b>회원아이디 : 
               <span id="mb_confirm_id" class="text-primary">${loginUser.email }</span>
               </b></label> 
               <input type="password" name="pwd" id="passwordCheck" required
                  class="form-control input-sm" size="15" maxlength="20">
               <span class="fa fa-lock form-control-feedback"></span>
            </div>
            <span id="pwdResult"></span>
            </div>
            <div class="modal-footer">
               <button type="button" id="submitBtn" class="btn btn-primary" >확인</button>
            </div>
         </div>
      </div>
   </div>
<!-- 비밀번호 불일치 모달 끝 -->

<!-- ==== FOOTER START ==== -->
   <c:import url ="../common/footer.jsp"/>
<!-- ==== FOOTER END ==== -->


<script>
$('#deleteMember').click(function() {
      console.log("비밀번호 확인");
      $("#pwdCheck").modal();
      $('#pwdResult').html("");
      $('#passwordCheck').val("");
});

$('#submitBtn').click(function(){
   var passwordCheck = $('#passwordCheck').val();
   var emailCheck = "${loginUser.email}";
   //console.log("머야 왜안나와 " +passwordCheck+" "+emailCheck);
   
   $.ajax({
      url  : "pwdCheck.me",
      data : {pwd: passwordCheck, email :emailCheck},
      success : function(data){
         console.log("전송됨");
         if(data == "success"){
            window.location.replace("mdelete.me");
         }else{
             $('#pwdResult').html("비밀번호 확인 값이 불일치합니다.").css('color','red');
         }
      }
   });
});
</script>
</body>
</html>