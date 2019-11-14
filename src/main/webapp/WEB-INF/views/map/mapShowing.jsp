<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="map" style="width:500px;height:400px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0a48fcadcb1442066ac40adaba14e637"></script>
	<script>
		// start 지도 생성
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(37.498993, 127.0307203), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
	
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		// end 지도 생성
		
		
		// TODO 마커에 표시된 위치를 클릭하면 해당 게시판으로 이동하게한다.
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(37.498993, 127.0307203); 

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);
		
		
		// 지도에 표시할 원을 생성합니다
		var circle = new kakao.maps.Circle({
		    center : new kakao.maps.LatLng(37.498993, 127.0307203),  // 원의 중심좌표 입니다 
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
		
		
		// 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
		// ?????? 찾아보기
		var linePath = [
		    new kakao.maps.LatLng(33.452344169439975, 126.56878163224233),
		    new kakao.maps.LatLng(33.452739313807456, 126.5709308145358),
		    new kakao.maps.LatLng(33.45178067090639, 126.5726886938753) 
		];
		
		// 지도에 표시할 선을 생성합니다
		var polyline = new kakao.maps.Polyline({
		    path: linePath, // 선을 구성하는 좌표배열 입니다
		    strokeWeight: 5, // 선의 두께 입니다
		    strokeColor: '#FFAE00', // 선의 색깔입니다
		    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		    strokeStyle: 'solid' // 선의 스타일입니다
		});
		
		// 지도에 선을 표시합니다 
		polyline.setMap(map);  

	</script>
</body>
</html>