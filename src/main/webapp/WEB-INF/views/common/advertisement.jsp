<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<div class="row">
      <!-- Carousel Slideshow -->
      	<div id="carousel-example" class="carousel slide" data-ride="carousel">
          <!-- Carousel Indicators -->
          	<ol class="carousel-indicators">
            <li data-target="#carousel-example" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example" data-slide-to="1"></li>
            <li data-target="#carousel-example" data-slide-to="2"></li>
            <li data-target="#carousel-example" data-slide-to="3"></li>
            <li data-target="#carousel-example" data-slide-to="4"></li>
            <li data-target="#carousel-example" data-slide-to="5"></li>
            <li data-target="#carousel-example" data-slide-to="6"></li>
              </ol>
         	<div class="clearfix"></div>
   		<!-- End Carousel Indicators -->
   	<!-- Carousel Images -->
  	 <div class="carousel-inner">
       	<div class="item active">
           <img src="${contextPath}/resources/assets/img/slideshow/BPslide.png">
       </div>
       <div class="item">
           <!-- <img src="${contextPath}/resources/assets/img/slideshow/BPads1.png"> -->
           <img src="${contextPath}/resources/assets/img/slideshow/BPslide.png">
       </div>
       <div class="item">
           <!-- <img src="${contextPath}/resources/assets/img/slideshow/BPads2.png"> -->
           <img src="${contextPath}/resources/assets/img/slideshow/BPslide.png">
       </div>
      
       <div class="item">
           <!-- <img src="${contextPath}/resources/assets/img/slideshow/SELLENT3.png"> -->
           <img src="${contextPath}/resources/assets/img/slideshow/BPslide.png">
       </div>
       <div class="item">
           <!-- <img src="${contextPath}/resources/assets/img/slideshow/TMC6.png"> -->
           <img src="${contextPath}/resources/assets/img/slideshow/BPslide.png">
       </div>
       <div class="item">
       <!-- <img src="${contextPath}/resources/assets/img/slideshow/SELLENT1.png"> -->
       <img src="${contextPath}/resources/assets/img/slideshow/BPslide.png">
       </div>
       <div class="item">
            <!-- <img src="${contextPath}/resources/assets/img/slideshow/JSG1.png"> -->
            <img src="${contextPath}/resources/assets/img/slideshow/BPslide.png">
       </div>
                          
       <div class="item">
             <img src="${contextPath}/resources/assets/img/slideshow/eveningAd.png">
          <%--   <img src="${contextPath}/resources/assets/img/slideshow/BPslide.png"> --%>
       </div>
                          
        </div>
        <!-- End Carousel Images -->
        <!-- Carousel Controls -->
        <a class="left carousel-control" href="#carousel-example" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
        </a>
        <a class="right carousel-control" href="#carousel-example" data-slide="next">
            <span id="login" class="glyphicon glyphicon-chevron-right"></span>
        </a>
        <!-- End Carousel Controls -->
    </div>
    <!-- End Carousel Slideshow -->
</div>

</body>
</html>