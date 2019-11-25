<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.hahaha{float: right;}
	.hohoho{width: 180px;}
	.dadada{left: 0px; top: 0px; width:200px; height:100px; display:flex;}
</style>
</head>
<body>
	<ul class="post-list" style ="padding-left: 0px; width: 100%;" id="topList1">
                                    
    </ul>
    <script>
        function topList(){
			$.ajax({
				url: "topList.rm",
				dataType: "json",
				success: function(data){
					$ul = $("#topList1");
					$ul.html("");
					
					var rbWriter;
					var rbTitle;
					
					
					
					for(var i in data){
						
						$li = $('<li class="ellipsis">');
						$a = $('<a>').attr('href',"bdetail.rm?rbId="+data[i].rbId);
						/* $span = $('<span class="gray font-12 hahaha">'); */
						$span2 = $('<span class="subject_title hohoho">');
						
						
						/* $rbWriter = $("<b>").text(data[i].rbCreateDate); */
						$rbTitle = $("<b>").text(decodeURIComponent(data[i].rbTitle.replace(/\+/g," ")));
						
						$li.append($a);
						/* $span.append($rbWriter); */
						$span2.append($rbTitle);
						/* $a.append($span); */
						$a.append($span2);
						/* $li.append($span);
						$li.append($span2); */
						$ul.append($li);
						
						
						/* var $tr = $('<span class="pull-right gray font-12">');
						var $tr2 = $('<span class="subject_title">');
						var $rbTitle = $("<b>").text(decodeURIComponent(data[i].rbTitle.replace(/\+/g," ")));
						var $rbWriter = $("<b>").text(data[i].rbWriter); */
						
						/* $tr.append($rbTitle); */
						
						/* $tr.append($rbWriter);
						$tr2.append($rbTitle);
						
						$tableBody.append($tr);
						$tableBody.append($tr2); */
					}
				}
			});
		}
		
		$(function(){
			topList();
			
			setInterval(function(){
				topList();
			}, 100000);
		});
	</script>
</body>
</html>