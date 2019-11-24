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
            <div class="margin-bottom-20">
                <hr>
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
<!-- 검색 모달창 끝 -->

                    <!-- Side Column -->
                    <div class="col-md-3">
                        <!-- Recent Posts -->
                        <div class="margin-bottom-10">
                            <hr>
                        </div>
<!--                         <div class="panel panel-success">
                            <div class="panel-body" style="background-color: white;">
                                <a href="#"><b>룸메이트</b></a> <br>
                                <a href="#">하우스메이트</a> <br>
                                <a href="#">신입생메이트</a>
                                <ul class="nav nav-pills nav-stacked">
                                        <li>
                                            <a href="#sample-3a" data-toggle="tab">
                                                <i class="fa fa-cloud"></i>  룸메이트</a>
                                        </li>
                                        <li class="active">
                                            <a href="#sample-3b" data-toggle="tab">
                                                <i class="fa fa-home"></i>  하우스메이트</a>
                                        </li>
                                        <li>
                                            <a href="#sample-3c" data-toggle="tab">
                                                <i class="fa fa-comments"></i>  신입생메이트</a>
                                        </li>
                                        
                                    </ul>
                            </div>
                        </div> -->
                        <div class="panel panel-danger">
                         		<div class="panel-heading">
	                        		<h3 class="panel-title">무료나눔</h3>
	                        	</div>
	                        <div class="margin-bottom-10">
	                        	<!-- start 지도 -->
									<div id="map" style="width:100%;height:370px; border-radius: 0.5em;"></div>
								<!-- end 지도 -->
	                        </div>
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
		center: new kakao.maps.LatLng(0,0), 			//지도의 중심좌표 초기화값.
		level: 6										//지도의 레벨(확대, 축소 정도)
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
			console.log("값이 들어왔습니다. 안정식 coordsLogInUser " + coordsLogInUser);	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coordsLogInUser
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<a href="www.naver.com">네이버</a><div style="width:150px;text-align:center;padding:6px 0;">${loginUser.name}집</div>'
	        });
	        infowindow.open(map, marker);
			
	        userCoords = {
        		latitude : result[0].y,
       			longitude : result[0].x
	        };
	        console.log(userCoords);
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
	
	// 다른사람들 주소 가지고 만들기
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 다른분들 주소값 배열로 받아오기
	var address = new Array('서울특별시 송파구 올림픽로 240',	
							'서울특별시 송파구 올림픽로 269',
							'서울특별시 송파구 올림픽로 300',
							'서울특별시 송파구 석촌호수로 268',
							'서울특별시 송파구 석촌호수로 258',
							'서울특별시 송파구 석촌호수로 230',
							'서울특별시 송파구 석촌호수로 188');
	console.log("userCoords" + userCoords);
	// java 를 통해서 받아온 String 값에 넣어준다.
	// 주소로 좌표를 검색합니다
	for(var i=0; i < address.length; i++){
		console.log(address[i]);
		// geocoder 안으로 들어가면 address[i]값이 표시되지 않는다.
		geocoder.addressSearch(address[i], function(result, status) {
			// 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
	
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		        console.log("값이 들어왔습니다." + coords);
					
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">${loginUser.name}집</div>'
		        });
		        infowindow.open(map, marker);
				
		        // ** map.setCenter 주석처리
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        // map.setCenter(coords);
		        // ** map.setCenter 주석처리
		    } 
		}); 
	}

/* 	
	//마커를 표시할 위치와 title 객체 배열입니다 
	var positions = [
	    {
	        title: '카카오', 
	        latlng: new kakao.maps.LatLng(33.450705, 126.570677)
	    },
	    {
	        title: '생태연못', 
	        latlng: new kakao.maps.LatLng(33.450936, 126.569477)
	    },
	    {
	        title: '텃밭', 
	        latlng: new kakao.maps.LatLng(33.450879, 126.569940)
	    },
	    {
	        title: '근린공원',
	        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
	    }
	];
	
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

 */	
	
</script>

<!-- ajax map -->
<script type="text/javascript">
	window.onload = function (){ 					/* window.onload 페이지가 로딩되고 시작하는 함수 */
		console.log("${ list }");
		var loginUserName = "${ loginUser.name }";
		$.ajax({
			url:"mapAjax.map", 						// controller 접근
			data: {mName:loginUserName}, 			// 왼쪽 변수가 컨트롤러에서 받는 값, 오른쪽 변수가 자바스크립트에서 받는 값입니다.
			dataType: "json",
			success: function(data){
				console.log("성공");
			}
		});
	}
</script>

</body>
</html>