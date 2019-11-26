<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="topList6">
    </div>
    <script>
        function topList6(){
			$.ajax({
				url: "topList.sb",
				dataType: "json",
				success: function(data){
					$div = $("#topList6");
					$div.html("");
					
					/* var fbWriter; */
					var sbTitle;
					console.log(data);
					for(var i in data){
						
						$div2 = $('<div class="col-md-2 portfolio-item margin-bottom-40 audio dadada">').css('overflow','unset');
						$div3 = $('<div>');
						$a = $('<a>').attr('href',"ddetailShowing2.sb?sbid="+data[i].sbid);
						$span = $('<figure>');
						$span2 = $('<img alt="image1" src="resources/showinguploadFiles/'+data[i].renameFileName+'" style="width:100%; height:100%;">' );
						
						
						
						$sbTitle = $("<b>").text(decodeURIComponent(data[i].sbtitle.replace(/\+/g," ")));
						
						$a.append($span);
						$span.append($span2);
						
						$div3.append($a);
						$div2.append($div3);
						$div.append($div2);
						
						
					}
				}
			});
		}
		
		$(function(){
			topList6();
			
			setInterval(function(){
				topList6();
			}, 100000);
		});
	</script>
</body>
</html>