<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
  src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
  charset="utf-8"></script>
<script type="text/javascript"
  src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
  
<style type="text/css">
html, div, body, h3 {
  margin: 0;
  padding: 0;
}

h3 {
  display: inline-block;
  padding: 0.6em;
}
</style>


<script type="text/javascript">
  $(document).ready(function() {
	    var name = "${loginUser.name}";
	    var email = "${loginUser.email}";
	    $("#name").html("환영합니다. "+name+"님");
	    $("#email").html(email);
    });
  //location.href = "${pageContext.request.contextPath}/";
</script>

</head>
<body style="text-align:-webkit-center;background-color: #3EAF0E;">
<br><br><br><br><br>
<br><br><br><br><br>

  <div
    style="background-color: white; width: 400px; height: 200px; text-align: center; color: white;">
    <img src="${pageContext.request.contextPath}/resources/assets/img/bps/naverlogo.png" style="width:300px">
  
  <span> <h2 style="text-align: center;color:black" id="name"></h2></span>
  <h4 style="text-align: center; color:#3EAF0E" id="email"></h4>
  </div>
  <script>
    $(function () {
      $("body").hide();
      $("body").fadeIn(3000);  
     
		 setTimeout(function(){$("body").fadeOut(3000);},1000);
     	setTimeout(function(){location.href= "home.do"},2000);  
    
    })
  </script>

</body>
</html>