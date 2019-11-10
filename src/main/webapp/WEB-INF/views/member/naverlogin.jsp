<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>네이버로그인</title>
</head>
<body>

<!-- ==== HEADER START ==== -->
	<c:import url ="../common/header.jsp"/>
<!-- ==== HEADER END ==== -->
<%
    String clientId = "5UBafHl3pvkxVL8nbUOG";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:9879/bangpool/home.do", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
 %>
<!--  ==== BEGIN CONTENT ==== -->

<div id="content" class="bottom-border-shadow">
                <div class="container background-gray">
                
                        <div>        
                      <hr class="margin-bottom-10">
                        </div>
                        <div class="row margin-vert-30">
                        
                            <!-- Login Box -->
                            <div class="col-md-6 col-md-offset-3 col-sm-offset-3" >
                                <form class="login-page">
                                    <div class="login-header margin-bottom-30">
                                        <h2>Login to your account</h2>
                                    </div>
                                    <div class="input-group margin-bottom-20">
                                        <span class="input-group-addon">
                                            <i class="fa fa-user"></i>
                                        </span>
                                        <input placeholder="Username" class="form-control" type="text">
                                    </div>
                                    <div class="input-group margin-bottom-20">
                                        <span class="input-group-addon">
                                            <i class="fa fa-lock"></i>
                                        </span>
                                        <input placeholder="Password" class="form-control" type="password">
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label class="checkbox">
                                                <input type="checkbox">Stay signed in</label>
                                        </div>
                                        <div class="col-md-6">
                                            <button class="btn btn-primary pull-right" type="submit">Login</button>
                                        </div>
                                    </div>
                                    <hr>
                                   <!--  <h4>Forget your Password ?</h4>
                                    <p>
                                        <a href="#">Click here</a>to reset your password.</p> -->
                                    <div style="text-align:center" >   
                                         <a href="<%=apiURL%>" ><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
                                	</div>
                                </form>
                            </div>
                            <!-- End Login Box -->
                        </div>
                        
                         <div>        
                      <hr class="margin-top-10">
                        </div>
                </div>
            </div>

<!--  ==== END CONTENT ==== -->
 
 
  
  
  
<!-- ==== FOOTER START ==== -->
	<c:import url ="../common/footer.jsp"/>
<!-- ==== FOOTER END ==== -->
  
</body>
</html>