<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@include file="../include/header.jsp"%>
<html>
<head>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Insert title here</title>
<script src="http://s.codepen.io/assets/libs/modernizr.js" type="text/javascript"></script>


  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

  <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css'>
<style>


.checkLabel{
   color: red;
}
* {
  -ms-box-sizing: border-box;
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  margin: 0;
  padding: 0;
  border: 0;
}
html,
body {
  width: 100%;
  height: 100%;
  background-image : url("/resources/images/signUpBack.jpg");
  background-size : 100% 100% ;
  font-family: 'Open Sans', sans-serif;
  font-weight: 200;
}
.signup {
   min-width:450px;
  position: relative;
  top: 40%;
  width: 30%;
  height: 30%
  display: table;
  margin: -150px auto 0 auto;
  background: #fff;
  border-radius: 4px;
  opacity: 0.9;
}
.legend {
  position: relative;
  width: 100%;
  display: block;
  background: #FF7700;
  padding: 15px;
  color: #fff;
  font-size: 20px;
}
.legend:after {
  content: "";
  background-image: url(http://simpleicon.com/wp-content/uploads/multy-user.png);
  background-size: 100px 100px;
  background-repeat: no-repeat;
  background-position: 152px -16px;
  opacity: 0.06;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
  position: absolute;
}
.input {
  position: relative;
  width: 90%;
  margin: 15px auto;
}
.input span {
  position: absolute;
  display: block;
  color: #d4d4d4;
  left: 10px;
  top: 8px;
  font-size: 20px;
}
.input input {
  width: 100%;
  border: 1px solid black;
  padding: 10px 5px 10px 40px;
  display: block;
  border: 1px solid #EDEDED;
  border-radius: 4px;
  transition: 0.2s ease-out;
  color: #a1a1a1;
}
.input input:focus {
  padding: 10px 5px 10px 10px;
  outline: 0;
  border-color: #FF7052;
}
.submit {
  width: 130px;
  height: 45px;
  display: block;
  margin: 0 auto -15px auto;
  background: #fff;
  border-radius: 10%;
  border: 1px solid #FF7052;
  color: #FF7052;
  font-size: 24px;
  cursor: pointer;
  box-shadow: 0px 0px 0px 7px #fff;
  transition: 0.2s ease-out;
}
.submit:hover,
.submit:focus {
  background: #FF7700;
  color: #fff;
  outline: 0;
}
.feedback {
  position: absolute;
  bottom: -70px;
  width: 100%;
  text-align: center;
  color: #fff;
  background: #2ecc71;
  padding: 10px 0;
  font-size: 12px;
  display: none;
  opacity: 0;
}
.feedback:before {
  bottom: 100%;
  left: 50%;
  border: solid transparent;
  content: "";
  height: 0;
  width: 0;
  position: absolute;
  pointer-events: none;
  border-color: rgba(46, 204, 113, 0);
  border-bottom-color: #2ecc71;
  border-width: 10px;
  margin-left: -10px;
}
   


</style>
</head>
<body>


<!-- 
<form role="form" method="post">

   <div class="form-group">
    <label for="exampleInputEmail1">아이디</label>
    <input type="text"  class="form-control" value="" name="uid" id="uid" placeholder="아이디 입력">
     <label id="checkUid" class="checkLabel">필수 정보입니다.</label>
   <label id="checkUid1" class="checkLabel">아이디 중복</label>
     <br>
     
     
     <label for="exampleInputPassword1">비밀번호</label>
    <input type="password" class="form-control"value="" name="upw" id="upw" placeholder="비밀번호 입력">
    <label  id="checkUpw" class="checkLabel">필수 정보입니다.</label><br>
    
    
    <label for="exampleInputEmail1">이름</label>
    <input type="text" class="form-control" value="" name="uname" id="uname" placeholder="이름 입력">
    <label  id="checkUname" class="checkLabel">필수 정보입니다.</label><br>
    
    
    <label for="exampleInputEmail1">이메일</label>
    <input type="email"  class="form-control" value="" name="email" id="email" placeholder="이메일 입력">
    <label  id="checkEmail" class="checkLabel">필수 정보입니다.</label><br>
     </div>

   <button type="button" id="signUp">가입신청</button>
   
</form>
 -->

  <form class="signup" role="form" method="post">
  
<fieldset>
    
   <legend class="legend">회원가입</legend>  
    <div class="input">
       <input type="text" class="form-control" value="" name="uid" id="uid" placeholder="ID" required />
      <span><i class="fa fa-user"></i></span>
     
     <label id="checkUid1" class="checkLabel">아이디 중복</label>
    </div>
    <hr>
    <div class="input">
       <input  type="password" class="form-control"value="" name="upw" id="upw" placeholder="Password" required />
      <span><i class="fa fa-lock"></i></span>
    </div>
    <hr>
    <div class="input">
       <input  type="text" class="form-control" value="" name="uname" id="uname" placeholder="이름" required />
      <span><i class="fa fa-cloud"></i></span>
      
    </div>
    <hr>
    <div class="input">
       <input type="email" class="form-control" value="" name="email" id="email"placeholder="E-mail" required />
      <span><i class="fa fa-envelope-o"></i></span>
      
    </div>
      
      
    <button type="submit" class="submit" id="signUp">등록하기
        <!--<i class="fa fa-arrow-right"></i>-->
       </button>
    
</fieldset>
  
  <div class="feedback">
  가입 성공! <br />
    연결중입니다....
  </div>
</form>








<script>
var formObj = $("form[role='form']");
$(".checkLabel").hide();


 $('#uid').blur(function(){
   IdCheck();
}); 
/*
$('#upw').blur(function(){
   if($("#upw").val() ==""){
      $("#checkUpw").text("필수 정보입니다.")
      $("#checkUpw").show();
   
      }else{
         $("#checkUpw").hide();
      }
}); 

$('#uname').blur(function(){

   if($("#uname").val() ==""){
      $("#checkUname").text("필수 정보입니다.")
      $("#checkUname").show();
   
      }else{
         $("#checkUname").hide();
      }
}); 
$('#email').blur(function(){

   if($("#email").val() ==""){
      $("#checkEmail").text("필수 정보입니다.")
      $("#checkEmail").show();
      
      }else{
         $("#checkEmail").hide();
      }
});  */



/* 
$("#signUp").on("click",function(){
   var temp = true;
   

   if($("#uid").val() ==""){
   $("#checkUid").text("필수 정보입니다.")
   $("#checkUid").show();
     temp = false;
   }else{
      $("#checkUid").hide();
   }

   if($("#upw").val() ==""){
   $("#checkUpw").text("필수 정보입니다.")
   $("#checkUpw").show();
   temp = false;
   }else{
      $("#checkUpw").hide();
   }

   if($("#uname").val() ==""){
   $("#checkUname").text("필수 정보입니다.")
   $("#checkUname").show();
   temp = false;
   }else{
      $("#checkUname").hide();
   }

   if($("#email").val() ==""){
   $("#checkEmail").text("필수 정보입니다.")
   $("#checkEmail").show();
   temp = false;
   }else{
      $("#checkEmail").hide();
   }
   
   if(!temp){
      return;
   }

   formObj.attr("action","/user/signUp");
   formObj.submit();
   
}); */


function IdCheck(){
   $.ajax({
      type : "post",
      url : "/user/signUpIdCheck",
      dataType : "text",
      data :{
         uid : $("#uid").val()
      },
      success : function(result) {
         if(result =="SUCCESS"){
            $("#checkUid1").hide();
            buttonStart();
         }
         else{
            $("#checkUid").hide();
            $("#checkUid1").text("이미 사용중인 아이디 입니다.")
            $("#checkUid1").show();
            buttonStop();
         }
      }
   });
}

function buttonStop() {
   $("#signUp").attr("disabled",true);
}
function buttonStart(){
   $("#signUp").attr("disabled",false);
}


$( ".input" ).focusin(function() {
     $( this ).find( "span" ).animate({"opacity":"0"}, 200);
   });

   $( ".input" ).focusout(function() {
     $( this ).find( "span" ).animate({"opacity":"1"}, 300);
   });

   $(".login").submit(function(){
     $(this).find(".submit i").removeAttr('class').addClass("fa fa-check").css({"color":"#fff"});
     $(".submit").css({"background":"#2ecc71", "border-color":"#2ecc71"});
     $(".feedback").show().animate({"opacity":"1", "bottom":"-80px"}, 400);
     $("input").css({"border-color":"#2ecc71"});
     return false;
   });



</script>




</body>
</html>