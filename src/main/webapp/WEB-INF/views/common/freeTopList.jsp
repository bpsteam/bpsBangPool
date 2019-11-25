<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul class="post-list" style ="padding-left: 0px; width: 100%;" id="topList8">
    </ul>
    <script>
        function topList8(){
			$.ajax({
				url: "topList.fr",
				dataType: "json",
				success: function(data){
					$ul = $("#topList8");
					$ul.html("");
					
					var frbWriter;
					var frbTitle;
					
					
					
					for(var i in data){
						
						$li = $('<li class="ellipsis">');
						$a = $('<a>').attr('href',"frbdetail.fr?frbId="+data[i].frbId);
						/* $span = $('<span class="pull-right gray font-12">'); */
						$span2 = $('<span class="subject_title">');
						
						
						/* $frbWriter = $("<b>").text(data[i].frbCreateDate); */
						$frbTitle = $("<b>").text(decodeURIComponent(data[i].frbTitle.replace(/\+/g," ")));
						
						$li.append($a);
						/* $span.append($frbWriter); */
						$span2.append($frbTitle);
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
			topList8();
			
			setInterval(function(){
				topList8();
			}, 100000);
		});
	</script>
</body>
</html>