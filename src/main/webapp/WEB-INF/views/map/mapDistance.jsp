<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko"> 
<head>
  <meta charset="UTF-8">
  <title>Location</title>  
  <style>
    /*스타일 영역*/
  </style>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
  <script type="text/javascript" src="myLocation.js"></script>  
 </head>
 <body>
    <div id="location">
        여러분의 위치가 여기에 나타날 것입니다.
    </div>
    <div id="distance">
        서울시청과의 거리가 여기에 나타날 것입니다.
    </div>
 </body>
 
 <script type="text/javascript">
 /* myLocation.js */

 var ourCoords = { // 안정식 좌표
     latitude : 37.51131078364221,  //위도
     longitude : 127.09814039543262  //경도
 };

 window.onload = getMyLocation;

 function getMyLocation() {

      // navigator.geolocation 없다면 null을 반환하고 조건식의 결과는 false
     if (navigator.geolocation) {
         
         //getCurrentPosition(successhandler, errorHandler, option)
         navigator.geolocation.getCurrentPosition(
             displayLocation, 
             displayError); 
     } else {
         alert("내 위치 정보제공 설정이 꺼져있거나, 지원하지 않는 브라우져 입니다." );
     }
 }

 function displayLocation(position) {

     var latitude = position.coords.latitude;
     var longitude = position.coords.longitude;
     
     $("#location").html("당신은 위도: " + latitude 
                             +", 경도: " + longitude + "에 있습니다");
     
     var distance = computeDistance(position.coords, ourCoords);
     $("#distance").html("당신은 서울시청과 "+distance+"km 떨어져 있습니다.");
                         
 }

 function displayError(error) {
     var errorTypes = {
         0: "알려지지 않은 에러",
         1: "사용자가 권한 거부",
         2: "위치를 찾을 수 없음",
         3: "요청 응답 시간 초과"
     };
     var errorMessage = errorTypes[error.code];
     if (error.code == 0 || error.code == 2) {
         errorMessage = errorMessage + " " + error.message;
     }
     $("#location").html(errorMessage);        
 }


 // 구면 코사인 법칙(Spherical Law of Cosine) 으로 두 위도/경도 지점의 거리를 구함
 // 반환 거리 단위 (km)
 function computeDistance(startCoords, destCoords) {
     var startLatRads = degreesToRadians(startCoords.latitude);
     var startLongRads = degreesToRadians(startCoords.longitude);
     var destLatRads = degreesToRadians(destCoords.latitude);
     var destLongRads = degreesToRadians(destCoords.longitude);

     var Radius = 6371; //지구의 반경(km)
     var distance = Math.acos(Math.sin(startLatRads) * Math.sin(destLatRads) + 
                     Math.cos(startLatRads) * Math.cos(destLatRads) *
                     Math.cos(startLongRads - destLongRads)) * Radius;

     return distance;
 }

 function degreesToRadians(degrees) {
     radians = (degrees * Math.PI)/180;
     return radians;
 }
 </script>
 
</html>