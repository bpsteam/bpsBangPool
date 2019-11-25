<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0a48fcadcb1442066ac40adaba14e637&libraries=services,clusterer,drawing"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- ==== HEADER START ==== -->
<c:import url ="../common/header.jsp"/>
<!-- ==== HEADER END ==== -->

<!-- start 지도 -->
<div id="map" style="width:100%;height:350px;"></div>
<!-- end 지도 -->

<!-- ==== FOOTER START ==== -->
<c:import url ="../common/footer.jsp"/>
<!-- ==== FOOTER END ==== -->

</body>
<script type="text/javascript">
	
	console.log("${loginUser.address}"); // 로그인한 유저의 주소가 찍힌다.
	
	// start 로그인한 유저의 주소 잘라서 보여주기
	var loginUseradd = "";
	console.log("${loginUser}");
	loginUseradd = ("${loginUser.address}".split('/'));
	console.log(loginUseradd);
	console.log(loginUseradd[1]);
	// end 로그인한 유저의 주소 잘라서 보여주기
 
</script>

<script type="text/javascript">
	///* 지도 생성 믿 지도 중심 좌표 */
	// start 지도 생성
	var mapContainer = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var mapOptions = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(37.5132612,127.0979449), //지도의 중심좌표.
		level: 6 //지도의 레벨(확대, 축소 정도)
	};
	
	var map = new kakao.maps.Map(mapContainer, mapOptions); //지도 생성 및 객체 리턴
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// java 를 통해서 받아온 String 값에 넣어준다.
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(loginUseradd[1], function(result, status) {
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
	            content: '<a href="www.naver.com">네이버</a><div style="width:150px;text-align:center;padding:6px 0;">${loginUser.name}집</div>'
	        });
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	}); 
	
	
// end 지도 생성
</script>

<script type="text/javascript">
	//------------------------------- 지도의 원을 표시하는 로직 ------------------------------		
	// 지도에 표시할 원을 생성합니다
	var circle = new kakao.maps.Circle({
	    center : new kakao.maps.LatLng(37.5132612,127.0979449),  // 원의 중심좌표 입니다 
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
</script>
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
							'서울특별시 송파구 석촌호수로 188'	);
	
	// java 를 통해서 받아온 String 값에 넣어준다.
	// 주소로 좌표를 검색합니다
	for(var i in address){
		console.log("for 문을 돌고 있습니다.");
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
		        console.log("coords의 값" + coords);
		        console.log("marker의 값" + marker);
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">${loginUser.name}집</div>'
		        });
		        infowindow.open(map, marker);
	
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		}); 
	}
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

</script>

<!-- 1km 이하 거리의 객체를 보여주기 -->

<script type="text/javascript">
	
</script>

<!-- ajax map -->
<script type="text/javascript">
	function getMap(){
		var loginUserId = ${ loginUser };
		$.ajax({
			url:"mapAddSC.map", // controller 접근
			data: {loginUserId:loginUserId}, // 왼쪽이 컨트롤러에서 받는 값
			dataType: "json",
			success: function(data){
				console.log("성공");
			}
		});
	}
</script>
</html>