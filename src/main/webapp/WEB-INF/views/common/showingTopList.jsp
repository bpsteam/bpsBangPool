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
						/* $span3 = $('<figcaption>'); */
						
						/* $div = $('<li class="portfolio-item col-sm-4 col-xs-6 margin-bottom-40">');
						$a = $('<a>').attr('href',"shbdetail2.se?shbId="+data[i].shbId);
						$span = $('<figure class="animate fadeInLeft">');
						$span2 = $('<img alt="image1" style="width: 400px; height: 200px;" src="resources/buploadFiles/'+data[i].shbRenameFileName+'">'); */
						
						
						/* $fbWriter = $("<b>").text(data[i].fbWriter); */
						$sbTitle = $("<b>").text(decodeURIComponent(data[i].sbtitle.replace(/\+/g," ")));
						
						/* $span.append($fbWriter); */
						/* $span3.append($sbTitle); */
						$a.append($span);
						$span.append($span2);
						/* $span2.append($span3); */
						/* $li.append($span);
						$li.append($span2); */
						$div3.append($a);
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
			topList6();
			
			setInterval(function(){
				topList6();
			}, 100000);
		});
	</script>
</body>
</html>