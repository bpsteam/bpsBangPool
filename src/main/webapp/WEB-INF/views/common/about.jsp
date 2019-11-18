<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사이트 소개</title>
</head>
<body>
<!-- ==== HEADER START ==== -->
	<c:import url ="../common/header.jsp"/>
<!-- ==== HEADER END ==== -->

 <!-- === BEGIN CONTENT === -->
        
        
        <div id="content">
            
            
            
            <div class="container background-white ">
        
                <div class="row margin-vert-30">
				<!-- Main Column -->
				<div class="col-sm-12">
					<div class="tab-content">
						<div class="at-title">
							<div class="at-container" style="display:inline">
								<div class="page-title col-md-9" style="font-size:30px">
								<strong><i class="fa fa-leaf"></i> Introduction</strong>
								</div>
								<div class="page-desc hidden-xs col-md-3" style="text-align: right">사이트 소개</div>
								<div class="clearfix"></div>
							</div>
						</div>
						<div class="margin-bottom-20">
							<hr>
						</div>
						
						<div class="col-sm-8 col-sm-offset-2 ">
						<img style="witdh:60%" src="${contextPath }/resources/assets/img/bps/bp_about_img.png">
						
						</div>


					</div>
				</div>
				<!-- End Main Column -->

			



			</div>
            </div>
        
        <!--     <div class="margin-bottom-30">
                <hr>
            </div> -->
        
        </div>
        <!-- === END CONTENT === -->
 



<!-- ==== FOOTER START ==== -->
	<c:import url ="../common/footer.jsp"/>
<!-- ==== FOOTER END ==== -->


</body>
</html>