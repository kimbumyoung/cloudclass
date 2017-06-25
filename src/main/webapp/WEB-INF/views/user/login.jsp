<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/header.jsp"%>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script src="http://s.codepen.io/assets/libs/modernizr.js" type="text/javascript"></script>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
  <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css'> 
<title>Insert title here</title>

<style>

html,
body {
  width: 100%;
  height: auto;
  background-size: 100% 100%;
  background-image : url("/resources/images/book2.jpg");
  font-family: 'Open Sans', sans-serif;
  font-weight: 200;
}
.login {
   min-width:500px;
  position: relative;
  width: 30%;
  display: table;
  margin: 150px auto auto auto;
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
  width: 45px;
  height: 45px;
  display: block;
  margin: 0 auto -15px auto;
  background: #fff;
  border-radius: 100%;
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
  background: red;
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

<form class="login">
   
   <fieldset>
    
     <legend class="legend">Login</legend>
    
    <div class="input">
       <input type="text" name ="uid" id="uid" placeholder="ID" required />
      <span><i class="fa fa-user" aria-hidden="true"></i></span>

    </div>
    
    <div class="input">
       <input type="password" name="upw" id="upw" placeholder="Password" required />
      <span><i class="fa fa-lock"></i></span>
    </div>
    <div class="input text-center">
       <a href="https://nid.naver.com/nidlogin.login"><img align="middle" src="/resources/images/social.png"></a>
    </div>
    <hr>
    <div class="row input">
       <div class="col-md-9">
          <a href="/contact"><label>혹시 비밀번호를 잊어버리셨나요?</label></a>
       </div>
       <div class="col-md-3 text-right">
          <a href="/user/signUp" class="text-center"><label>회원가입</label></a>
       </div>
    </div>
    
    <button type="button" id="submit" class="submit"><i class="fa fa-arrow-right"></i></button>
    
     </fieldset>
  
     <div class="feedback">
        아이디와 패스워드를 확인 해주세요    <br />
    
     </div>
  
</form>
   
   <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>


   <script>
   
      $("#checkLabel").hide();
      $("#submit").on("click", function() {
         var uid = $("#uid").val();
         var upw = $("#upw").val();

         $.ajax({
            type : "post",
            url : "/user/login",
            headers : {
               "Content-Type" : "application/json",
               "X-HTTP-Method-Override" : "POST"
            },
            dataType : "text",
            data : JSON.stringify({
               uid : uid,
               upw : upw
            }),
            success : function(result) {
               console.log(result);
               if (result) {
                  self.location=result;
               } else {
                  /* $("#checkLabel").show(); */
                    $(this).find(".submit i").removeAttr('class').addClass("fa fa-check").css({"color":"#fff"});
                    $(".submit").css({"background":"#2ecc71", "border-color":"#2ecc71"});
                    $(".feedback").show().animate({"opacity":"1", "bottom":"-80px"}, 400);
                    $("input").css({"border-color":"#2ecc71"});
               }
            }
         })
      });
      $( ".input" ).focusin(function() {
           $( this ).find( "span" ).animate({"opacity":"0"}, 200);
         });

         $( ".input" ).focusout(function() {
           $( this ).find( "span" ).animate({"opacity":"1"}, 300);
         });

         $('#upw').keydown(function(key){
             if(key.keyCode == 13){// 검색창에서 enter치면 enter=13
                $('#submit').trigger('click');// 검색클릭
             }
          });
   </script>
</body>


</html>