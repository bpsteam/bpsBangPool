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

<!-- ==== HEADER START ==== -->
	<c:import url ="../../common/header.jsp"/>
<!-- ==== HEADER END ==== -->


	<!-- === BEGIN CONTENT === -->
	<div id="content">
		<div class="container background-white">
			<div class="row margin-vert-30">
				<div class="col-md-12">
					<div class="error-404-page text-center">
						<h2>ERROR</h2>
						<h3>The page can not be found</h3>
						
						<h2 style="color: red;">${ message }</h2>
						<a href="home.do">시작페이지로 돌아가기 </a>
						
						
						<form class="form-search search-404">
							<div class="input-append">
								<input type="text" class="span2 search-query">
								<button type="submit" class="btn btn-primary">Search</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- === END CONTENT === -->




	<!-- ==== FOOTER START ==== -->
	<c:import url ="../../common/footer.jsp"/>
<!-- ==== FOOTER END ==== -->


</body>
</html>