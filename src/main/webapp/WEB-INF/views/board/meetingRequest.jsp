<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
  label{
    font-size:20px;
  }

</style>

</head>
<body>


<br>
<br>
<br>
<br>
<br>
<center><span style="font-size: 30px; font-weight: bold;">신청자 정보 입력</span></center>
 <hr style="border: 1px solid #fc7700">
 <br>
<div class="row">


<form role="meetingForm" method="post">
         <div class="form-group" >
         
         <div class="row"> <!-- 이름, 이메일 입력 받는 가로 1줄 -->
           <div class ="col-md-1"></div> <!-- 맨 왼쪽 세로 1줄 -->
               <!-- 이름 입력 -->
                 <div class="col-md-2 title" >
                     <label for="name">이름</label> 
                 </div>
                 
                 <div class="col-md-3" >
                 <!-- <input type="text" class="form-control" id="name"  value="${login.uname}"> -->
                 ${login.uname}
               </div>
                 
                 <!-- 이메일 입력 -->
                 <div class="col-md-2 title" >
                 <label for="email">이메일</label> 
               </div>
               
               <div class="col-md-3" >
                 <!-- <input type="text" class="form-control" id="email"  value="${login.email}"> -->
                 ${login.email}
               </div>
           <div class ="col-md-1"></div> <!-- 맨 오른쪽 세로 1줄 -->
         </div><!-- end of /div row -->
         
         
         <br> <!-- 한 줄 개행 -->
         
         
         <div class="row"> <!-- 소속, 전화번호 입력 받는 가로 1줄 -->
        <div class ="col-md-1"></div> <!-- 맨 왼쪽 세로 1줄 -->
            <!-- 소속 입력 -->
            <div class="col-md-2 title">
                <label for="job">직업</label> 
            </div>
            
            <div class="col-md-3">
              <input type="text" class="form-control" id="job" name="job" placeholder="직업 입력">
            </div>
            
            <!-- 전화번호 입력 -->
            <div class="col-md-2 title" >
              <label for="tel">전화번호(필수)</label> 
            </div>
            
            <div class="col-md-3" >
              <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" placeholder="연락처 입력" >
            </div>
              
        <div class ="col-md-1"></div> <!-- 맨 오른쪽 세로 1줄 -->
      </div><!-- end of /div row -->
         
         
      <br> <!-- 한 줄 개행 -->
         
               
       <div class="row"> <!-- 참여 신청 알림 가로 1줄 -->
        <div class ="col-md-1"></div> <!-- 맨 왼쪽 세로 1줄 -->
            <!-- 체크박스 -->
            <div class="col-md-2 title" >
                <label for="ckcbox">참여 신청 알림</label> 
            </div>
            
            <div class="col-md-8" >
              <div class="checkbox">
                <div class="col-md-3"><label><input type="checkbox"  value=""><img src="${pageContext.request.contextPath}/resources/images/intro/kakaoo.png" style="width: 70px; height: 40px;"></label></div>
                <div class="col-md-3"><label><input type="checkbox"  value=""><img src="${pageContext.request.contextPath}/resources/images/intro/twitr.png" style="width: 70px; height: 40px;"></label></div>
                <div class="col-md-3"><label><input type="checkbox"  value=""><img src="${pageContext.request.contextPath}/resources/images/intro/face.png" style="width: 70px; height: 40px;"></label></div>
               </div> 

               </div> 
              
                
          
              
        <div class ="col-md-1"></div> <!-- 맨 오른쪽 세로 1줄 -->
        </div>
       <br><center><span style="color: red; font-weight: bold;">* 회원님의 SNS에 참여신청을 알려보세요.</span> </center>
      </div><!-- end of /div row -->
      
      
  <hr>
    
      <div class="row"> <!-- 버튼 정렬한  가로 1줄 -->
        <div class ="col-md-5"></div> <!-- 맨 왼쪽 세로 5줄 -->
          
          <div class="col-md-2">
             <button type="button" class="btn btn-warning" id="complete">신청완료</button>
             <button type="button" class="btn btn-warning" id=cancel>취소하기</button>
          </div>    
        <div class ="col-md-5"> <!-- 가져와야 하는 데이터. -->
              <input type="hidden" name="uid" value="${login.uid}">
              <input type="hidden" name="bno" value="${bno}"> 
        </div> <!-- 맨 오른쪽 세로 5줄 -->
      </div><!-- end of /div row -->
      
         </div> <!-- end of /div form-group -->
</form>

	<br>
	<br>
</div>


<script>
 $("#complete").on("click",function(){
   var formObj = $("form[role='meetingForm']");
   formObj.attr("action","/board/meetingComplete");
   formObj.submit();
   alert('신청이 완료되었습니다.');
});
 
 $("#cancel").on("click",function(){
     alert('신청을 취소하셨습니다.');
 });

</script>

</body>   
</html>