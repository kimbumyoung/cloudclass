<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="../include/header.jsp"%>
<title>Insert title here</title>

<style>
 
   #degari {
      font-size: 30px;
   }
 
   #tablecon {
      border: 1px solid yellow;
   }
 #pi {
    font-size: 30px;
 }
 #star {
    color: B80808;
    font-size: 15px;
    font-weight: bold;
 }
</style>
</head>
<body>
  <div class="container">
     <div id="degari">수강<span style="color: A11F1F">신청 완료</span> </div>
     <hr style="border: 2px solid #A4A4A4">
   <div class="row">      
      <div class="col-md-4"></div>
      <div class="col-md-4" id="pi">   
         <div class="row" >
            <div class="col-md-3"></div>
            <div class="col-md-6">감사합니다.</div>
            <div class="col-md-3"></div>
         </div>
         <p>${boardVO.title} 강의를 아래와 같이 신청하였습니다.</p>
      </div>
      <div class="col-md-4"></div>
   </div>   
   
   
      <table class="table table-striped">
    <tbody>
      <tr>
        <th>강의명</th>
        <td>${boardVO.title}</td>
      </tr>
      <tr>
        <th>강의날짜</th>
        <td>${boardVO.dateStart} ~ ${boardVO.dateEnd}</td>
      </tr>
      <tr>
        <th>강의시간</th>
        <td>${boardVO.lessonTimeStart} ~ ${boardVO.lessonTimeEnd}</td>
      </tr>
      <tr>
        <th>이름</th>
        <td>${login.uname}</td>
      </tr>
      <tr>
        <th>이메일</th>
        <td>${login.email}</td>
      </tr>
      <tr>
        <th>직업</th>
        <td>${userVO.job}</td>
      </tr>
      <tr>
        <th>전화번호</th>
        <td>${userVO.phoneNumber}</td>
      </tr>
    </tbody>
  </table>

   <div class="row">
      <div class="col-md-4"></div>
      <div class="col-md-4" id="star">*신청내역은 마이페이지에서 확인해 주시기 바랍니다.</div>
      <div class="col-md-4"></div>
         
   </div><br>
   
      <div class="row">
         <div class="col-md-4"></div>
         <div class="col-md-2">
           <button type="button" id="check" class="btn btn-primary btn-lg" style="width: 130px">확인</button>
          </div>
          <div class="col-md-2">
           <button type="button" id="moveMyPage" class="btn btn-success btn-lg" style="width: 130px">마이페이지</button>   
          </div>
         <div class="col-md-2"></div>
      </div>
   
  </div><br><br>
   <%@include file="../include/footer.jsp"%>
</body>

<script>

$("#check").on("click",function(){
	location.replace("/board/boardRead?bno=${boardVO.bno}");
});
$("#moveMyPage").on("click",function(){
	location.replace("/board/boardRead?bno=${boardVO.bno}");
});



</script>

</html>