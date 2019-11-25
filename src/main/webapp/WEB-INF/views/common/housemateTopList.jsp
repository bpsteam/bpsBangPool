<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul class="post-list" style ="padding-left: 0px; width: 100%;" id="topList2">
    </ul> 
    <script>
        function topList2(){
			$.ajax({
				url: "topList.hm",
				dataType: "json",
				success: function(data){
					$ul = $("#topList2");
					$ul.html("");
					
					var hbWriter;
					var hbTitle;
					
					
					
					for(var i in data){
						
						$li = $('<li class="ellipsis">');
						$a = $('<a>').attr('href',"bdetail.hm?hbId="+data[i].hbId);
						/* $span = $('<span class="gray font-12 hahaha">'); */
						$span2 = $('<span class="subject_title hohoho">');
						
						
						/* $hbWriter = $("<b>").text(data[i].hbWriter); */
						$hbTitle = $("<b>").text(decodeURIComponent(data[i].hbTitle.replace(/\+/g," ")));
						
						$li.append($a);
						/* $span.append($hbWriter); */
						$span2.append($hbTitle);
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
			topList2();
			
			setInterval(function(){
				topList2();
			}, 100000);
		});
	</script>
</body>
</html>