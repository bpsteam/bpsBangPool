<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row" id="topListA">
    </div>
    <script>
        function topListA(){
			$.ajax({
				url: "topList.at",
				dataType: "json",
				success: function(data){
					$div = $("#topListA");
					$div.html("");
					
					
					for(var i in data){
						
						$div2 = $('<div class="col-md-3">');
						if(data[i].bCode = 'RMBCODE'){
							$a = $('<a>').attr('href',"bdetail.rm?rbId="+data[i].refbId);
							$span2 = $('<img src="${contextPath}/resources/attboarduploads/'+data[i].renameFileName+'" style="max-width:100%; height:180px">' );
						}else if(data[i].bCode = 'HMBCODE'){
							$a = $('<a>').attr('href',"bdetail.hm?hbId="+data[i].refbId);
							$span2 = $('<img src="${contextPath}/resources/attboarduploads/'+data[i].renameFileName+'" style="max-width:100%; height:180px">' );
						}else if(data[i].bCode = 'FMBCODE'){
							$a = $('<a>').attr('href',"bdetail.fm?fbId="+data[i].refbId);
							$span2 = $('<img src="${contextPath}/resources/attboarduploads/'+data[i].renameFileName+'" style="max-width:100%; height:180px">' );
						}else if(data[i].bCode = 'SBCODE'){
							$a = $('<a>').attr('href',"ddetailShowing2.sb?sbid="+data[i].refbId);
							$span2 = $('<img src="${contextPath}/resources/attboarduploads/'+data[i].renameFileName+'" style="max-width:100%; height:180px">' );
						}else{
							$a = $('<a>').attr('href',"bdetail.fr?frbId="+data[i].refbId);
							$span2 = $('<img src="${contextPath}/resources/attboarduploads/'+data[i].renameFileName+'" style="max-width:100%; height:180px">' );
						}
						
						$a.append($span2)
						$div2.append($a);
						
						$div.append($div2);
						
						
					}
				}
			});
		}
		
		$(function(){
			topListA();
			
			setInterval(function(){
				topListA();
			}, 100000);
		});
	</script>
</body>
</html>