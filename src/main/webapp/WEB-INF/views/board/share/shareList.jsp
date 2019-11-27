<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <style>

        .table tbody tr {
            border-bottom: 1px solid #dddddd ;
        }
        
        .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
	    .wrap * {padding: 0;margin: 0;}
	    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
	    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
	    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
	    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
	    .info .close:hover {cursor: pointer;}
	    .info .body {position: relative;overflow: hidden;}
	    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
	    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
	    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
	    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
	    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
	    .info .link {color: #5085BB;}
        
    </style>



</head>
<body>

<!-- ==== HEADER START ==== -->
	<c:import url ="../../common/header.jsp"/>
<!-- ==== HEADER END ==== -->


 <!-- === BEGIN CONTENT === -->
        
        
        <div id="content">
        
            <div id="slideshow" class="bottom-border-shadow">
                <div class="container background-grey bottom-border">
        
                    <div class="margin-bottom-10">
                        <hr>
                    </div>
                    <!-- ==== BEGIN ADVERTISEMENT ==== -->
						<c:import url ="../../common/advertisement.jsp"/>
					<!-- ==== END ADVERTISEMENT ==== -->
                    <br>
                    <br>
                </div>
            </div>

            <div class="container background-white ">
        
                <div class="row margin-vert-30">
                    <!-- Main Column -->
                    <div class="col-sm-9">
                            <div class="tab-content">
                                <div class="tab-pane fade in active" id="housemate">
                                        <h1><small>나눔게시판</small></h1>
                                        <div class="margin-bottom-10">
                                                <hr>
                                         </div>

							<form action="srListView.sr">
								<div class="tabs alternative">
									<ul class="nav nav-tabs" id="tabs">
										<li id="all">
											<c:url var="loc" value="srListView.sr">
												<c:param name="srLocation" value="ALL"/>
											</c:url>
											<a href="${ loc }">전체</a>
										</li>
										<li id="seoul">
											<c:url var="loc" value="srListView.sr">
												<c:param name="srLocation" value="SEOUL"/>
											</c:url> 
											<a href="${ loc }" >서울</a> 
										</li>
										<li id="inc">
											<c:url var="loc" value="srListView.sr">
												<c:param name="srLocation" value="INCHEON"/>
											</c:url> 
											<a href="${ loc }" >인천/부천</a></li>
										<li id="su">
											<c:url var="loc" value="srListView.sr">
												<c:param name="srLocation" value="SU"/>
											</c:url> 
											<a href="${ loc }" >수원/경기</a></li>
										<li id="dae">
											<c:url var="loc" value="srListView.sr">
												<c:param name="srLocation" value="DAE"/>
											</c:url> 
											<a href="${ loc }" >대구/경북</a></li>
										<li id="bu">
											<c:url var="loc" value="srListView.sr">
												<c:param name="srLocation" value="BU"/>
											</c:url> 
											<a href="${ loc }" >부산/경남</a></li>
										<li id="chung">
											<c:url var="loc" value="srListView.sr">
												<c:param name="srLocation" value="CHUNG"/>
											</c:url> 
											<a href="${ loc }" >충청/강원</a></li>
										<li id="kwang">
											<c:url var="loc" value="srListView.sr">
												<c:param name="srLocation" value="GWANG"/>
											</c:url> 
											<a href="${ loc }" >광주/전라</a></li>
									</ul>
									<div class="tab-content">
										<div class="tab-pane fade in active" id="integrate">
											<div class="row">
												<div class="col-md-12">
													<div class="table-responsive">
														<table class="table table-hover">
															<thead>
																<tr>
																	<th>No.</th>
																	<th>지역분류</th>
																	<th>제목</th>
																	<th>작성자</th>
																	<th>날짜</th>
																	<th>조회수</th>
																</tr>
															</thead>
															<tbody>
 																<c:forEach var="s" items="${ list }">
																	<tr>
																		<td>${ s.srbId }</td>
																		<c:url var="srdetail" value="srdetail.sr">
																			<c:param name="srbId" value="${ s.srbId }" />
																		</c:url>
																		<td>${ s.srbLocation }</td>
																		<td onclick="location.href='${ srdetail }'">
																			<a href="${ srdetail }">${ s.srbTitle }</a></td>
																		</td>
																		<td>${ s.srbWriter }</td>
																		<td>${ s.srCreateDate }</td>
																		<td>${ s.srbCount }</td>
																	</tr>
																</c:forEach> 
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>

										<!-- 페이징 처리 -->
										<div class="text-center">
											<ul class="pagination">
												<!-- [이전] -->
												<li><c:if test="${ pi.currentPage <= 1 }">
														<a>«</a>
													</c:if> <c:if test="${ pi.currentPage > 1 }">
														<c:url var="before" value="srListView.sr">
															<c:param name="page" value="${ pi.currentPage - 1 }" />
														</c:url>
														<a href="${ before }">«</a>
													</c:if></li>

												<!-- 페이지 -->
												<c:forEach var="p" begin="${ pi.startPage }"
													end="${ pi.endPage }">
													<c:if test="${ p eq pi.currentPage }">
														<li class="active"><a>${ p }</a></li>
													</c:if>

													<c:if test="${ p ne pi.currentPage }">
														<li><c:url var="pagi" value="srListView.sr">
																<c:param name="page" value="${ p }" />
															</c:url> <a href="${ pagi }">${ p }</a></li>
													</c:if>
												</c:forEach>

												<!-- [다음] -->
												<li><c:if test="${ pi.currentPage >= pi.maxPage }">
														<a>»</a>
													</c:if> <c:if test="${ pi.currentPage < pi.maxPage }">
														<c:url var="after" value="srListView.sr">
															<c:param name="page" value="${ pi.currentPage + 1 }" />
														</c:url>
														<a href="${ after }">»</a>
													</c:if></li>


											</ul>
											<a href="#" style="float: left" class="btn btn-aqua btn-sm"
												data-toggle="modal" data-target="#searchModal"
												onclick="return false;"><i class="fa fa-search"></i></a>
											<c:if test="${ !empty loginUser }">
												<a href="srInsertForm.sr" type="button" class="btn btn-red"
													style="float: right;">글쓰기</a>
											</c:if>
										</div>
									</div>

								</div>
							</form>

						</div>
                                
                            </div>
                        </div>
                    <!-- End Main Column -->

					<!-- 검색 모달창 시작 -->
                    <div class="modal fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                        <div class="modal-dialog modal-sm">
                            <div class="modal-content">
                                <div class="modal-body">
                                    <div class="text-center">
                                        <h4 id="myModalLabel" style="font-weight: 500; font-family: 'Roboto', sans-serif; color:unset; line-height:1.1"><i class="fa fa-search fa-lg" ></i> Search</h4>
                                    </div>
                                    <form action="hserach.hm" name="hsearch" method="get" role="form" class="form" style="margin-top:20px;">
                                        <input type="hidden" name="bo_table" value="roomate">
                                        <input type="hidden" name="sca" value="">
                                        <input type="hidden" name="sop" value="and">
                                        <div class="form-group">
                                            <label for="sfl" class="sound_only">검색대상</label>
                                            <select name="searchCondition" id="searchCondition" class="form-control input-sm">
                                                <option value="wr_subject">제목</option>
                                                <option value="wr_content">내용</option>
                                                <option value="titleNcontent">제목+내용</option>
                                                <option value="email">회원아이디</option>
                                                <option value="hbwriter">글쓴이</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="stx" class="sound_only">검색어<strong class="sound_only"> 필수</strong></label>
                                            <input type="text" name="searchValue" required id="searchValue" class="form-control input-sm" maxlength="20" placeholder="검색어">
                                        </div>
            
                                        <div class="btn-group btn-group-justified">
                                            <div class="btn-group">
                                                <button type="submit" class="btn btn-danger"><i class="fa fa-check"></i></button>
                                            </div>
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-aqua" data-dismiss="modal"><i class="fa fa-times"></i></button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3">
                    	<!-- category 시작 -->
					<c:import url="../../common/rightCategory.jsp" />
					<!-- category  끝-->
                        <!-- <div class="margin-bottom-10">
                            <hr>
                        </div>
                        <div class="panel panel-danger">
                            <div class="panel-heading">
                                <h3 class="panel-title">공지사항</h3>
                            </div>
                            <div class="panel-body" style="background-color: white; ">
                                <div class="table-responsive">
                                    <table class="table table-hover ellipsistb" >
        
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td id="ellipsistd" >공지사항입니다1ddddd</td>
                                                <td>07/19</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td id="ellipsistd">공지사항입니다2</td>
                                                <td>08/24</td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td  id="ellipsistd">공지사항입니다3</td>
                                                <td>10/20</td>
                                            </tr>
                                            <tr style="border-bottom: 1px solid #dddddd;">
                                                <td>4</td>
                                                <td  id="ellipsistd">공지사항입니다4</td>
                                                <td>11/15</td>
                                            </tr>
        
                                        </tbody>
                                    </table>
                                </div>
                                
                            </div>
                        </div>
                        
                        End recent Posts
                        공지사항
                        <div class="panel panel-info">
                            이슈 시작
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
                            </div> -->
                        </div>
                  
                    
                
                <div class="panel panel-success col-sm-12">
               		<div class="panel-heading">
               			<h3 class="panel-title">무료나눔</h3>
                   	</div>
                    <div class="margin-bottom-10">
	                   	<!-- start 지도 -->
							<div id="map" style="width:100%;height:370px; border-radius: 0.5em;"></div>
						<!-- end 지도 -->
                    </div>
   				</div>
   				
   				
   				</div>
            </div>
          </div>
            <div class="margin-bottom-30">
                <hr>
            </div>
        
        <!-- === END CONTENT === -->
        
        
<!-- ==== FOOTER START ==== -->
	<c:import url ="../../common/footer.jsp"/>
<!-- ==== FOOTER END ==== -->

<script>
// 탭 액티브 처리
	$(function(){
		var location= "${ sLoc }";
		
		switch(location) {
		case "SEOUL" : 
			$("#tabs li").removeClass("active");
			$("#seoul").addClass("active");
			break;
		case "INCHEON" : 
			$("#tabs li").removeClass("active");
			$("#inc").addClass("active");
			break;
		case "SU" : 
			$("#tabs li").removeClass("active");
			$("#su").addClass("active");
			break;
		case "DAE" : 
			$("#tabs li").removeClass("active");
			$("#dae").addClass("active");
			break;
		case "BU" : 
			$("#tabs li").removeClass("active");
			$("#bu").addClass("active");
			break;
		case "CHUNG" : 
			$("#tabs li").removeClass("active");
			$("#chung").addClass("active");
			break;
		case "GWANG" : 
			$("#tabs li").removeClass("active");
			$("#gwang").addClass("active");
			break;
		default :
			$("#tabs li").removeClass("active");
			$("#all").addClass("active");
			break;
		}
	});
	
</script>

<!-- start 카카오 지도 API source -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0a48fcadcb1442066ac40adaba14e637&libraries=services,clusterer,drawing"></script>
<!-- end 카카오 지도 API source -->

<!-- 지도 관련  유저 정보 가져오기 -->
<script type="text/javascript">
	// start 로그인한 유저의 주소 잘라서 보여주기
	var loginUseradd = "";
	loginUseradd = ("${loginUser.address}".split('/'));
	// end 로그인한 유저의 주소 잘라서 보여주기
</script>

<!-- start 지도 관련 지도 생성 및 지도 중심 좌표 -->
<script type="text/javascript">
	// 로그인 유저의 좌표값이 들어갈 객체
	var userCoords = null;

	// start 지도 생성
	var mapContainer = document.getElementById('map'); 	//지도를 담을 영역의 DOM 레퍼런스
	var mapOptions = { 									//지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(123,123), 			//지도의 중심좌표 초기화값.
		level: 3										//지도의 레벨(확대, 축소 정도)
	};
	
	var map = new kakao.maps.Map(mapContainer, mapOptions); //지도 생성 및 객체 리턴
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// java 를 통해서 받아온 String 값에 넣어준다.
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(loginUseradd[1], function(result, status) {
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coordsLogInUser = new kakao.maps.LatLng(result[0].y, result[0].x);
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coordsLogInUser
	        });

			
	        userCoords = {
        		latitude : result[0].y,
       			longitude : result[0].x
	        };
	     	// start 지도에 표시할 원을 생성합니다 ** 수정해 놓은상태
	    	var circle = new kakao.maps.Circle({
	    	    center : new kakao.maps.LatLng(result[0].y, result[0].x),  // 원의 중심좌표 입니다 
	    	    radius: 1000, // 미터 단위의 원의 반지름입니다 
	    	    strokeWeight: 5, // 선의 두께입니다 
	    	    strokeColor: '#75B8FA', // 선의 색깔입니다
	    	    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	    	    strokeStyle: 'dashed', // 선의 스타일 입니다
	    	    fillColor: '#CFE7FF', // 채우기 색깔입니다
	    	    fillOpacity: 0.7  // 채우기 불투명도 입니다   
	    	}); 
	    	
	    	// 지도에 원을 표시합니다 
	    	circle.setMap(map); 
	    	// end 지도에 표시할 원을 생성합니다 ** 수정해 놓은상태
	    	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coordsLogInUser);
	    } 
	}); 
	// end 지도 생성
	
</script>

<!-- 주변 1km 이내에 나눔 게시판 표시 -->
<script type="text/javascript">
	
var otherAddress = new Array();
var otherWriter = new Array();
var otherItem = new Array();
var otherIdNum = new Array();
/* var overlay = new Array(); */

/* 페이지가 로딩되고 Share Board 를 가지고 오는 함수 */
	$.ajax({
		url:"mapAjax.sr", // controller 접근
		dataType: "json",
		success: function(data){
			for(var i in data){
				otherAddress[i] = decodeURIComponent(data[i].address.replace(/\+/g, " ")).split('/')[1];
				otherWriter[i] = decodeURIComponent(data[i].srbwriter);
				otherItem[i] = decodeURIComponent(data[i].sritemname.replace(/\+/g, " "));
				otherIdNum[i] = data[i].srbid;
			}
		}
		,async: false
	});
	// 다른사람들 주소 가지고 만들기
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// java 를 통해서 받아온 String 값에 넣어준다.
	// 주소로 좌표를 검색합니다
	var limit = otherAddress.length;
	for(var i=0; i < otherAddress.length; i++){
		// geocoder 안으로 들어가면 address[i]값이 표시되지 않는다.
		geocoder.addressSearch(otherAddress[i], function(result, status) {
			// 정상적으로 검색이 완료됐으면
		     if (status === kakao.maps.services.Status.OK) {
				
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        	overlay = new kakao.maps.CustomOverlay({
		            content:    '<div class="wrap">' + 
           			            '    <div class="info">' + 
           			            '        <div class="title">' + 
           			            '            방풀 나눔게시판' + 
           			            '            <div class="close" id="i" value=i title="닫기"></div>' + 
           			            '        </div>' + 
           			            '        <div class="body">' + 
           			            '            <div class="img">' +
           			            '                <img src="https://img.icons8.com/color/48/000000/cardboard-box.png" width="73" height="70">' +
           			            '           </div>' + 
           			            '            <div class="desc">' + 
           			            '                <div class="ellipsis"><b>상품 명 : '+otherItem[limit]+'</b></div>' + 
           			            '                멋쟁이 '+'<a href="srdetail.sr?srbId='+otherIdNum[limit]+'">'+otherWriter[limit]+'</a>'+'님의 게시판</div>' + 
           			            '            </div>' + 
           			            '        </div>' + 
           			            '    </div>' +    
           			            '</div>',
        			 map: map,
        			 position: marker.getPosition() 
		        });
		        	
			
		     }
		     limit--;
		}); 
		/* $(function closeOverlay() {
    		var test = $(this).val();
    		console.log(test + "?");
    	    overlay.setMap(null);     
    	}); */
    	
    	$("#i").click(function(){
    		console.log("????");
    		var test = $(this).val();
    		console.log(test + "?");
    		
    	})
	}
	// 배열값으로 바꿔 넣어야 한다.
	// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
	kakao.maps.event.addListener(marker, 'click', function() {
	    overlay.setMap(map);
	});

	// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
	/* function closeOverlay(i) {
		console.log("탔냐"+i);
	    overlay[i].setMap(null);     
	}	 */	        
	
	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	    
	for (var i = 0; i < positions.length; i ++) {
	    
	    // 마커 이미지의 이미지 크기 입니다
	    var imageSize = new kakao.maps.Size(24, 35); 
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	    
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng, // 마커를 표시할 위치
	        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        image : markerImage // 마커 이미지 
	    });
}

	
</script>



</body>
</html>