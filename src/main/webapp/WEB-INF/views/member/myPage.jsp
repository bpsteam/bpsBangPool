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
                                                      
                                                      <span class="member">
                                                         <span class="lv-icon lv-1">
                                                         
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
                    
                    <!-- mateMatching -->
                    <c:import url="../common/mateMatching.jsp"/>
                    <!-- mateMatching -->
                      
                        
                       
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