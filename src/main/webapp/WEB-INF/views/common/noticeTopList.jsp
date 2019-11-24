<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul class="tick animate fadeInRight" id="topList4">
    </ul>
    <script>
        function topList4(){
			$.ajax({
				url: "topList.no",
				dataType: "json",
				success: function(data){
					$ul = $("#topList4");
					$ul.html("");
					
					var nTitle;
					
					for(var i in data){
						
						$li = $('<li class="ellipsis">');
						$a = $('<a>').attr('href',"ndetail2.no?nId="+data[i].nId);
						$span = $('<span class="gray font-12 hahaha">');
						$span2 = $('<span class="subject_title hohoho">');
						
						
						$nTitle = $("<b>").text(decodeURIComponent(data[i].nTitle.replace(/\+/g," ")));
						
						$li.append($a);
						$span2.append($nTitle);
						$a.append($span);
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
			topList4();
			
			setInterval(function(){
				topList4();
			}, 100000);
		});
	</script>
</body>
</html>