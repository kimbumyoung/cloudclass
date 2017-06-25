<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
body {
   margin-top: 100px;
   background: white;
}

/* Profile container */
.profile {
   margin: 20px;
}

/* Profile sidebar */
.profile-sidebar {
   padding: 20px 0 10px 0;
   background: #fff;
}

.profile-userpic img {
   float: none;
   margin: 0 auto;
   width: 50%;
   height: 50%;
   -webkit-border-radius: 50% !important;
   -moz-border-radius: 50% !important;
   border-radius: 50% !important;
}

.profile-usertitle {
   text-align: center;
   margin-top: 20px;
}

.profile-usertitle-name {
   color: #5a7391;
   font-size: 16px;
   font-weight: 600;
   margin-bottom: 7px;
}
/*
.profile-usertitle-job {
   text-transform: uppercase;
   color: #5b9bd1;
   font-size: 12px;
   font-weight: 600;
   margin-bottom: 15px;
}
*/
.profile-userbuttons {
   text-align: center;
   margin-top: 10px;
}

.profile-userbuttons .btn {
   text-transform: uppercase;
   font-size: 11px;
   font-weight: 600;
   padding: 6px 15px;
   margin-right: 5px;
}

.profile-userbuttons .btn:last-child {
   margin-right: 0px;
}

.profile-usermenu {
   margin-top: 30px;
}

.profile-usermenu ul li {
   border-bottom: 1px solid #f0f4f7;
}

.profile-usermenu ul li:last-child {
   border-bottom: none;
}

.profile-usermenu ul li a {
   color: #93a3b5;
   font-size: 14px;
   font-weight: 400;
   height: 60px;
}

.profile-usermenu ul li a i {
   margin-right: 8px;
   font-size: 14px;
}

.profile-usermenu ul li a:hover {
   background-color: #fc7700;
   color: white;
}

.profile-usermenu ul li.active {
   border-bottom: none;
}

.profile-usermenu ul li.active a {
   color: white;
   background-color: #fc7700;
   margin-left: -2px;
}
    /*  ######## 프로필사진 이미지버튼 스타일 태그  */
      .file_input_textbox{
                  float:left;
                  hight:29px;
                  
               }
               .file_input_div{
                position:relative;
                /*width:80px;
                height:36px;*/
                /*overflow:hidden;*/
                text-align:center;
               }
               
               .file_input_hidden{
               font-size:29px;
               position:absolute;
               right:0px;
               top:0px;
               opacity:0;
               filter:alpha(opacity=0);
               -ms-filter:alpha(opacity=0);
               cursor:pointer;
               }
               
 /*    ######## 프로필사진 이미지버튼 스타일 태그  */

/* Profile Content */


#myImage {
   height: 300px;
   width: 220px;
}

body{
background-color: D9D9D9;
}
#myPageContent{
min-height : 850px;

}

</style>

<script type="text/javascript" src="/resources/js/upload.js"></script>

</head>

<body>


   <input type="hidden" value="${login.uid}" id="uid">
   
   <div class="container">
      <div class="row profile" > <!-- ##### 전체 영역 ######-->
         <div class="col-md-3" > <!-- ##### row 중 왼쪽의 3열 ######-->
            <div class="profile-sidebar" style="box-shadow: 0px 1px 1px #333;">
            
               <!-- SIDEBAR USERPIC -->
               <div class="profile-userpic" style="background-color: white;">
                  <img src="../resources/images/user/userBlank.png" class="img-responsive" alt="" id="myImage">
               </div>

               
               
               <!-- -##### 프로필 사진 이미지버튼##### -->
               <div> 
               <div class="file_input_div" style="text-align:center">
                     
                       <br>
                          <button type="button" class="btn btn-default" style="box-shadow: 1px 1px 1px #333;">
                            <span class='glyphicon glyphicon-camera' aria-hidden="true"></span>&nbsp프로필사진
                          </button>
                          
	                        <input type='file' name='uimage' id="uimage" class='file_input_hidden' onchange="javascript:document.getElementById('fileName').value=this.value"/>
	                </div> <!-- ###### end of /유저사진 ######-->
	               
                  <div style='display:none;'>
                     <!-- style='display:none;' -->
                         <input type='text' id='fileName' class='file_input_textbox' style="width:0px;" readonly>
                   </div>     

    <hr>
                  
                     
               </div>
               <!--###### end of 프로필사진  #######-->
               
               
               
               
               <!-- SIDEBAR USER TITLE -->
               <div class="profile-usertitle">
                  <div class="profile-usertitle-name" style="text-align:center">${login.uname}님 <br>CloudClass 방문을 <br>환영합니다.</div>
                  <button type="button" class="btn btn-default" id="logoutBtn" aria-label="Left Align" style="box-shadow: 1px 1px 1px #333;">
                    <span class='glyphicon glyphicon-log-out' aria-hidden="true"></span>&nbsp로그아웃
                  </button>
               </div> <!-- ###### end of /환영멘트 ######-->

               <!-- SIDEBAR MENU -->
               <div class="profile-usermenu">
                  <ul class="nav">
                     <li class="active"><a href="#" id="profileShow"> <i class="glyphicon glyphicon-home"></i> 프로필   </a></li>
                     <li><a href="#" id="registerShow"> <i class="glyphicon glyphicon-tags"></i> 등록한 강의</a></li>
                     <li><a href="#" id="applyShow"><i class="glyphicon glyphicon-user"></i> 신청한 강의</a></li>
                     <li><a href="#" id="requestShow"> <i class="glyphicon glyphicon-ok"></i> 강의 요청글</a></li>
                     <li><a href="#" id="messageShow"> <i class="glyphicon glyphicon-envelope"></i> 메세지</a></li>
           
                  </ul>
               </div><!-- END MENU -->
               
            </div> <!-- ###### end of /프로필 사이드바 ##### -->
            
         </div> <!-- ###### end of /왼쪽 3열 ##### -->
         <!-- content UI , 내용 영역 -->
            <div id="myPageContent" class="col-md-9" style="background-color: white; box-shadow: 0px 1px 1px #333;">
          
            </div>
    
    
      </div> <!-- ###### end of /row ##### -->
   </div> <!-- ###### end of /container ##### -->




   <form role="form" method="post">
      <input type="hidden" value="${login.uid}" id="uid1" name="uid">

   </form>

   

   <script>
   $("#myPageContent").load("profileShow");
      myImageShow(); //myPage 호출시 myImage 보여주기

      function myImageShow() { //MyPage 이미지 보여주기 
         $.ajax({
            type : "get",
            url : "/my/uimageGet/" + $("#uid").val(),
            dataType : "text",
            success : function(uimage) {
               if (uimage) { //등록된 이미지가 있으면 
                  var path = "my";
                  var fileInfo = getFileInfo(uimage, path);
                  $("#myImage").attr("alt", fileInfo.fullName);

                  $("#myImage").attr("src", fileInfo.imgsrc);

               }
            }

         });
      };

      $("#uimage").change(function(event) {

         var formData = new FormData();
         formData.append("file", $("input[name=uimage]")[0].files[0]);//파일의 정보를 formData에 삽입 

         $.ajax({ //image 파일 폴더에 생성
            type : "post",
            url : "/my/uimageUpload",
            dataType : "text",
            data : formData,
            processData : false,
            contentType : false,
            success : function(result) {
               if (result) {
                  uimageDelete();
                  uimageRegister(result);
               } else {
                  alert("Image File please");
               }
            }
         });
      });

      function uimageRegister(uimage) { //image 경로  Db에 등록

         $.ajax({
            type : "post",
            url : "/my/uimageRegister/" + $("#uid").val(),
            data : {
               "uimage" : uimage
            },
            dataType : "text",
            success : function(result) {
               if (result == "SUCCESS")
                  myImageShow(); //이미지 등록후 이미지 다시 show
            }
         });
      };

      function uimageDelete() {

         $.ajax({
            url : "/deleteFile/my",
            type : "post",
            data : {
               fileName : $("#myImage").attr("alt")
            },
            dataType : "text",
            success : function(result) {
               console.log("교체성공");
            }
         });
      };

      var formObj = $("form[role='form']");
      $("#logoutBtn").on("click", function() {

         formObj.attr("action", "/user/logout");
         formObj.attr("method","get");
         formObj.submit();

      });

      $("#profileShow").on("click",function(event){
          event.preventDefault();
         
         $("li").removeClass("active");
         $(this).parent().addClass("active");
         
         $("#myPageContent").load("profileShow");
      });
      
      $("#registerShow").on("click", function(event) {
        event.preventDefault();
         $("li").removeClass("active");
         $(this).parent().addClass("active");
         $("#myPageContent").load("registerShow");

      });
      
      $("#applyShow").on("click",function(event){
       event.preventDefault();
       $("li").removeClass("active");
        $(this).parent().addClass("active");
        $("#myPageContent").load("applyShow");
        
      });

      
      $("#requestShow").on("click",function(event){
         event.preventDefault();
         $("li").removeClass("active");
         $(this).parent().addClass("active");
         
         $("#myPageContent").load("requestShow")
         
      });
      
      $("#messageShow").on("click", function(event) {
         event.preventDefault();
         $("li").removeClass("active");
         $(this).parent().addClass("active");
         
         $("#myPageContent").load("messageShow");
      });
      
    
      
      
      
   </script>

</body>
</html>