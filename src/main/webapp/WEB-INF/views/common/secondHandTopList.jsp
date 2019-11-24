<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="topList5">
    </div>
    <script>
        function topList5(){
			$.ajax({
				url: "topList.se",
				dataType: "json",
				success: function(data){
					$div = $("#topList5");
					$div.html("");
					
					/* var fbWriter;
					var fbTitle; */
					for(var i in data){
						
						$div2 = $('<div class="col-md-2 portfolio-item margin-bottom-40 audio dadada">').css('overflow','unset');
						$div3 = $('<div>');
						$a = $('<a>').attr('href',"shbdetail2.se?shbId="+data[i].shbId);
						$span = $('<figure>');
						$span2 = $('<img alt="image1" src="resources/buploadFiles/'+data[i].shbRenameFileName+'" style="width:100%; height:100%;">');
						
						
						/* $fbWriter = $("<b>").text(data[i].fbWriter);
						$fbTitle = $("<b>").text(decodeURIComponent(data[i].fbTitle.replace(/\+/g," "))); */
						
						$a.append($span);
						/* $span.append($fbWriter);
						$span2.append($fbTitle); */
						$span.append($span2);
						$div3.append($a);
						/* $li.append($span);
						$li.append($span2); */
						$div2.append($div3);
						$div.append($div2);
						
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
			topList5();
			
			setInterval(function(){
				topList5();
			}, 100000);
		});
	</script>
</body>
</html>