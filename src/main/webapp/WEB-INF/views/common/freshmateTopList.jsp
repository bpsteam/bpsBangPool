<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul class="post-list" id="topList3" style="padding-left:0px;">
    </ul>
    <script>
        function topList3(){
			$.ajax({
				url: "topList.fm",
				dataType: "json",
				success: function(data){
					$ul = $("#topList3");
					$ul.html("");
					
					var fbWriter;
					var fbTitle;
					
					
					
					for(var i in data){
						
						$li = $('<li class="ellipsis">');
						$a = $('<a>').attr('href',"bdetail2.fm?fbId="+data[i].fbId);
						/* $span = $('<span class="gray font-12 hahaha">'); */
						$span2 = $('<span class="subject_title hohoho">');
						
						
						/* $fbWriter = $("<b>").text(data[i].fbWriter); */
						$fbTitle = $("<b>").text(decodeURIComponent(data[i].fbTitle.replace(/\+/g," ")));
						
						$li.append($a);
						/* $span.append($fbWriter); */
						$span2.append($fbTitle);
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
			topList3();
			
			setInterval(function(){
				topList3();
			}, 100000);
		});
	</script>
</body>
</html>