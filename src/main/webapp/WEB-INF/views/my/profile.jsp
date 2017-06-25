<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.pbtn {
   border: 1px solid #fc7700;
   background: white;
   height: auto;
   color: #fc7700;
   border-radius: 7px;
   box-shadow: 1px 1px 1px #333;
}

.pbtn:hover{
   background: #fc7700;
   color: white;
}
.exit{
   height: 35px;
}
tr{
  height: 60px;
  font-size: 20px;
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
        		    <center><blockquote style="font-size:25; font-weight: bold">회원 정보</blockquote></center>
        		   <hr style="border-top: 2px solid #fc7700"> </div>
        		   </div>
        		<div class="col-sm-3"></div>
        		</div>
        	  
        	
        	</div>
        	<br>
    
          
            <hr> 
            <!-- ### 회원 정보 테이블 ### -->
            <table class="table">
                   <tr>
                    <td><b>아이디</b></td>
                    <td>${login.uid}</td>
                    <td></td> <!-- 테이블 길이를 맞추기위한 빈 td -->
                   </tr>
                   <tr>
               <td><b>비밀번호</b></td>
               <td>${login.upw}</td>
               <td><button class="pbtn">수정</button></td>
              </tr>
              <tr>
               <td><b>이름</b></td>
               <td>${login.uname}</td>
               <td></td> <!-- 테이블 길이를 맞추기위한 빈 td -->
              </tr>
              <tr>
               <td><b>이메일</b></td>
               <td>${login.email}</td>
               <td><button class="pbtn">수정</button></td>
              </tr>
            <tr>
              <td></td> <!-- 테이블 길이를 맞추기위한 빈 td -->
              <td></td> <!-- 테이블 길이를 맞추기위한 빈 td -->
              <td></td> <!-- 테이블 길이를 맞추기위한 빈 td -->
            </tr>
             </table>
        <!-- ### end of /table ### -->
            
            <div class="col-md-5"></div>
            <div class="col-md-2">
              <button class="pbtn exit">회원탈퇴</button>
              </div>
            <div class="col-md-5"></div>

</body>
</html>