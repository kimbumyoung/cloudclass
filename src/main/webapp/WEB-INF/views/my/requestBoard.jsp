<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#jaenun {
	border: 3px solid orange;
	width: 100%;
	height: 60px;
	font-size: 20px;
}

#list {
	font-size: 20px;
}

.lead {
	font-face: #FC7700;
}

tr{
text-align: center;
}
th{
text-align: center;
background-color: #ccc;
}
</style>
</head>
<body>




	
		<div class="col-sm-12"> 
        	 
        		<div class="row">
        			<div class="col-sm-3"></div>
        		   <div class="col-sm-6"> 
        		   <div style="text-align: center;">
        		   <br>
        		    <center><blockquote style="font-size:25; font-weight: bold">강의 요청글</blockquote></center>
        		   <hr style="border-top: 2px solid #fc7700"> </div>
        		   </div>
        		<div class="col-sm-3"></div>
        		</div>
        	  
     
     			<br>
        	</div>
        	
	<!-- ##### end of /container #####-->


	<table class="table table-hover list">


	</table>
	
	<script>
		listShow();
		function listShow() {
			var str = '<tr><th>제목</th><th>지역</th><th>희망날짜</th></tr>';

			$.ajax({
				url : "/my/myRequestBoardList?uid=${login.uid}",
				type : "get",
				dataType : "text",
				success : function(result) {
					var userList = JSON.parse(result);
					for (var i = 0; i < userList.length; i++) {

				 		str += "<tr>" + "<td><a href='/sboard/readPage?bno="
								+ userList[i].bno + "'>"+userList[i].title
								+ "</td><td>"+userList[i].area+"</td><td>"+userList[i].hopedate+"</td></tr>"; 
								
					}

					$(".list").html(str);
				}
			});
		}
	</script>
</body>
</html>