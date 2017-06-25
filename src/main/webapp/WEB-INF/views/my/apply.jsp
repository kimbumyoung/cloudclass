<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
h4 {
   color: gray;
   font-size: 15px;
   
}

.cancelBtn {
   border: 1px solid #fc7700;
   background: white;
   height: 35px;
   color: #fc7700;
   font-weight: bold;
   border-radius: 7px;
   box-shadow: 0px 1px 1px #333;
}

.cancelBtn:HOVER {
   background: #fc7700;
   color: white;
}

.applyContent {
   border: 1px solid #fc7700;
   margin-bottom: 20px;
   width: 97%;
   margin-left: 1.5%;
}
.coverImg{
height: 180px;
} 
.jenung {
   font-size: 30px;
}

li{
list-style: none;
}

#applyUL{
padding: 0px;
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
        		    <center><blockquote style="font-size:25; font-weight: bold">신청한 강의</blockquote></center>
        		   <hr style="border-top: 2px solid #fc7700"> </div>
        		   </div>
        		<div class="col-sm-3"></div>
        		</div>
        	  
        	
        	</div>
  
   <ul class="row" id="applyUL">

   </ul>




   <script>
      getList();

      function getList() {
         $.ajax({
            url : "/my/applyList?uid=${login.uid}",
            type : "get",
            dataType : "text",
            success : function(result) {
               var applyList = JSON.parse(result);
               var str = "";
               for (var i = 0; i < applyList.length; i++) {
                  str+="<li data-bno='"+applyList[i].bno+"'><div class='col-sm-12 applyContent'><div class='row' style='margin: 10px'><div class='col-sm-4'><img src='/displayFile/board?fileName="+applyList[i].coverImagePath+"' class='coverImg' width='100%''></div>";
                  str+="<div class='col-sm-8'><div class='row'><div class='col-sm-12'><span class='glyphicon glyphicon-user icon'></span>&nbsp;&nbsp;<spanclass='textSet'>작성자 :"+applyList[i].writer+"</span></div>";
                  str+="<div class='col-sm-12'><h4>"+applyList[i].title+"</h4></div><div class='col-sm-8'></div><div class='col-sm-4'><br> <br><button class='cancelBtn'>수강 취소</button></div></div></div></div></div></li>";
               }
               $("#applyUL").html(str);
            }
         });
      }

      $("#applyUL").on("click",".cancelBtn",function() {

         $.ajax({
            url : "/my/applyCancel",
            type : "post",
            headers : {
               "Content-Type" : "application/json",
               "X-HTTP-Method-Override" : "POST"
            },
            data : JSON.stringify({
               bno : $(this).closest("li").attr("data-bno"),
               uid : '${login.uid}'
            }),
            success : function(result) {
               if (result == "SUCCESS") {
                  getList();
               
               }
            }

         });
      });
   </script>




</body>
</html>