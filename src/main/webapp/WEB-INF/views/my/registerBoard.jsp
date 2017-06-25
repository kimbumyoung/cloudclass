<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>

.card {
   padding-top: 20px;
   margin: 10px 0 20px 0;
   background-color: rgba(214, 224, 226, 0.2);
   border-top-width: 0;
   border-bottom-width: 2px;
   -webkit-border-radius: 3px;
   -moz-border-radius: 3px;
   border-radius: 3px;
   -webkit-box-shadow: none;
   -moz-box-shadow: none;
   box-shadow: none;
   -webkit-box-sizing: border-box;
   -moz-box-sizing: border-box;
   box-sizing: border-box;
}

.card .card-heading {
   padding: 0 20px;
   margin: 0;
}

.card .card-heading.simple {
   font-size: 20px;
   font-weight: 300;
   color: #777;
   border-bottom: 1px solid #e5e5e5;
}




.card .card-heading.image img {
   display: inline-block;
   width: 46px;
   height: 46px;
   margin-right: 15px;
   vertical-align: top;
   border: 0;
   -webkit-border-radius: 50%;
   -moz-border-radius: 50%;
   border-radius: 50%;
}

.card .card-heading.image .card-heading-header {
   display: inline-block;
   vertical-align: top;
}

.card .card-heading.image .card-heading-header h3 {
   margin: 0;
   font-size: 14px;
   line-height: 16px;
   color: #262626;
}


.card .card-body {
   padding: 0 20px;
   margin-top: 20px;
}

.card .card-media {
   padding: 0 20px;
   margin: 0 -14px;
}

.card .card-media img {
   max-width: 100%;
   max-height: 100%;
}

.card .card-actions {
   min-height: 30px;
   padding: 0 20px 20px 20px;
   margin: 20px 0 0 0;
}

.card .card-comments {
   padding: 20px;
   margin: 0;
   background-color: #f8f8f8;
}

.card .card-comments .comments-collapse-toggle {
   padding: 0;
   margin: 0 20px 12px 20px;
}


.card-comments .media-heading {
   font-size: 13px;
   font-weight: bold;
}

.card.people {
   position: relative;
   display: inline-block;
   width: 170px;
   height: 300px;
   padding-top: 0;
   margin-left: 20px;
   overflow: hidden;
   vertical-align: top;
}

.card.people:first-child {
   margin-left: 0;
}

.card.people .card-top {
   position: absolute;
   top: 0;
   left: 0;
   display: inline-block;
   width: 170px;
   height: 150px;
   background-color: #ffffff;
}

.card.people .card-top.green {
   background-color: #53a93f;
}

.card.people .card-top.blue {
   background-color: #427fed;
}

.card.people .card-info {
   position: absolute;
   top: 150px;
   display: inline-block;
   width: 100%;
   height: 101px;
   overflow: hidden;
   background: #ffffff;
   -webkit-box-sizing: border-box;
   -moz-box-sizing: border-box;
   box-sizing: border-box;
}



.card.people .card-bottom {
   position: absolute;
   bottom: 0;
   left: 0;
   display: inline-block;
   width: 100%;
   padding: 10px 20px;
   line-height: 29px;
   text-align: center;
   -webkit-box-sizing: border-box;
   -moz-box-sizing: border-box;
   box-sizing: border-box;
}

.card.hovercard {
   position: relative;
   padding-top: 0;
   overflow: hidden;
   text-align: center;
   background-color: rgba(214, 224, 226, 0.2);
 
}

.card.hovercard .cardheader {
   background: url("http://lorempixel.com/850/280/nature/4/");
   background-size: cover;
   height: 135px;
}

.card.hovercard .avatar {
   position: relative;
   top: -50px;
   margin-bottom: -50px;
}
.headerimg { width:100%; height:200px; overflow:hidden;  }

.card.hovercard .avatar img {
   width: 120px;
   height: 120px;
   max-width: 120px;
   max-height: 120px;
   -webkit-border-radius: 50%;
   -moz-border-radius: 50%;
   border-radius: 55%;
   border: 5px solid rgba(255, 255, 255, 0.5);
}

.card.hovercard .info {
   padding: 4px 8px 10px;
}

.card.hovercard .info .title {
   margin-bottom: 4px;
   font-size: 17px;
   line-height: 1;
   color: black;
   vertical-align: middle;
}

/* 수강생보기버튼 */
button {
	border: 1px solid #fc7700;
	background: white;
	height: 35px;
	color: #fc7700;
	font-weight: bold;
	border-radius: 7px;
}
/* 수강생보기버튼 */


.popup{
overflow: hidden;
height: 100%;
display: block;
left: 0px;
top: 0px;
width: 100%;
z-index: 100;
position: fixed;
background-color: rgba(0,0,0,0.7);
}
.popupImage{

height: 50px;
width: 100%;

}


.popupText{

font-weight: bold;
font-size: 17px;
margin-top: 10px;

}

.popupMain{

background: white;
width: 40%;
min-height: 500px;
margin: auto;
top:50%;
left:50%;
transform:translate(-50%, -50%);
position:absolute;
}

.popupClick{
font-size : 17px;
color: white;
background-color : #fc7700;
border: 1px solid #fc7700;
border-radius: 5px;
}

.boardList{
text-align: center;
}

</style>
</head>
<body>

    <!-- style="visibility: hidden;" -->
    <div class="row" id="registerBoardContent">
    	<div class="popup" style="display: none;">
    	
    	
    	<div  class="popupMain">
    	
    	<div class="list-group" style="center">
 	 	<p class="list-group-item" style="background-color:#fc7700; color:white; font-size: 15px;"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;&nbsp;수강생 현황 <a href="#" style="color: white;"><span style="float: right; font-size: 20px" class="glyphicon glyphicon-remove removeExit"></span></a></p>
  		<div class="listcontent col-sm-12">
  		
  		</div>
  		
		</div>	 
    
    	</div>
		</div>
		
		
    	<div class="col-sm-12"> 
        	 
        		<div class="row">
        			<div class="col-sm-3"></div>
        		   <div class="col-sm-6"> 
        		   <div style="text-align: center;">
        		   <br>
        		    <center><blockquote style="font-size:25; font-weight: bold">등록한 강의</blockquote></center>
        		   <hr style="border-top: 2px solid #fc7700"> </div>
        		   </div>
        		<div class="col-sm-3"></div>
        		</div>
        	  
        	
        	</div>
			<br>
    	<div class="col-sm-12 ">
    		<div class="row list" >
				
			</div>
			
    	</div>
    	
    	</div>

<script>
var imagePath;
myImageCheck();
listShow();

function myImageCheck() { //MyPage 이미지 보여주기 
    $.ajax({
       type : "get",
       url : "/my/uimageGet/${login.uid}",
       dataType : "text",
       success : function(uimage) {
          if (uimage) { //등록된 이미지가 있으면 
        	  imagePath = uimage;
          }
       }
    });
 };



function listShow() {
   var str='';
   $.ajax({
      url : "/my/myBoardList?uid=${login.uid}",
      type : "get",
      dataType : "text",
      success : function(result) {
          var userList = JSON.parse(result);
      
         for(var i=0; i<userList.length; i++){
        	 str+="<div class='col-sm-4 boardList'><div class='card hovercard' style='box-shadow: 0px 1px 1px #333'><a href='/board/boardRead?bno="+userList[i].bno+"'><div><img class='headerimg'src='/displayFile/board?fileName="+userList[i].coverImagePath+"'></div>";
        	 str+="<div class='avatar'>";
        	  if(imagePath){
        		 str+= "<img src='/displayFile/my?fileName="+imagePath+"'class='img-circle userimage' >"
        	  }
        	  else{
        		  str+="<img src='../resources/images/user/userBlank.png' class='img-circle userimage'>";  /* 수정필요 */
        	  }
        	  
        	 str+="</div>";
        	 str+="<div class='info'><div class='title'>"+userList[i].title+"</div></div></div></a><a href='#' data-bno='"+userList[i].bno+"' class='popupClick'>수강생 현황</a></div>";
       		 
         }
         
         $(".list").html(str);
      }
    
   });
}


$("#registerBoardContent").on("click",".popupClick",function(event){
	var bno = $(this).attr("data-bno");
	
	$.ajax({
		url:"/my/applyuserList",
		type:"get",
		data: {
			bno: bno
		},
		  dataType : "text",
		success: function(data){
			var ulist = JSON.parse(data);
			if(ulist){
				var str ="";
			 	for(var i=0; i<ulist.length; i++){
					
					str+= "<div class='row list-group-item' style='text-align: center;'><div class='col-sm-2'>";
					if(ulist[i].uimage){
					str+="<img src='/displayFile/my?fileName="+ulist[i].uimage+"'class='img-circle popupImage'>"
					}
					else{
						str+= "<img src='../resources/images/user/userBlank.png' class='img-circle popupImage'>";
					}
					
					str+= "</div><div class='col-sm-2 popupText'>"+ulist[i].uname+"</div><div class='col-sm-2 popupText'>"+ulist[i].job+"</div><div class='col-sm-3 popupText'>"+ulist[i].email+"</div>";
					
					str+="<div class='col-sm-3 popupText'>"+ulist[i].phoneNumber+"</div></div>";
				} 
			 	
			 	$(".listcontent").html(str);
			}

		}
		
	});
	
	popupOpen();
});




function popupOpen(){
	$(".popup").fadeIn("slow");
}


$(".removeExit").on("click",function(){
	$(".popup").fadeOut("slow");
});


   

</script>
</body>
</html>