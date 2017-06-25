<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/header.jsp"%>
<link rel="stylesheet" type="text/css"
   href="${contextPath}/resources/css/datepicker3.css" />
<script type="text/javascript"
   src="${contextPath}/resources/js/bootstrap-datepicker.js"></script>
<script type="text/javascript"
   src="${contextPath}/resources/js/bootstrap-datepicker.kr.js"></script>
<script type="text/javascript"
   src="${contextPath}/resources/js/jquery.timepicker.min.js"></script>
<link rel="stylesheet" type="text/css"
   href="${contextPath}/resources/css/jquery.timepicker.css" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.fileDrop {
   width: 80%;
   height: 200px;
   border: 1px solid black;
   background-color: lighthslategrey;
   margin: auto;
}

small {
   margin-left: 3px;
   font-weight: bold;
   color: gray;
}

p {
   color: black;
   font-size: 15px;
   font-weight: bold;
}

#myImage {
   width: 100%;
   height: 250px;
}

.centerStyle {
   text-align: center;
}
</style>
</head>
<body
   style="background: url(/resources/images/bgbgbg2.png); background-repeat: no-repeat; background-size: 100% 100%;">

   <div class="container" style="border: 5px solid #FAFAFA;background-color: white">
      <form role="form" method="post">
         <div>
           <center><span style="font-size: 35px; font-weight: bold; padding-top: 50px">강의 등록</span><center>
            <hr style="border: 1px solid #fc7700">
         </div>

         <div class="container-fluid" style="color:black">
            <div class="row content">
               <div class="col-sm-3 sidenav">

                  <img src="../resources/images/user/userBlank.png" id="myImage"
                     class="img-circle">

               </div>

               <div class="col-sm-9">

                  <p>강의 제목</p>
                  <input class="form-control" type="text" name="title"> <br>
                  <div class="row">
                     <div class="col-sm-3">
                        <p>시작날짜</p>
                        <input type="text" id="dateStart" name="dateStart"
                           class="form-control centerStyle" placeholder="날짜선택">
                     </div>

                     <div class="col-sm-3">
                        <p>종료날짜</p>
                        <input type="text" id="dateEnd" name="dateEnd"
                           class="form-control centerStyle" placeholder="날짜선택">
                     </div>
                     <div class="col-sm-3">
                        <p>시작시간</p>
                        <input type="text" name="lessonTimeStart"
                           class="form-control centerStyle" placeholder="시간선택"
                           id="lessonTimeStart">
                     </div>
                     <div class="col-sm-3">
                        <p>종료시간</p>
                        <input type="text" name="lessonTimeEnd"
                           class="form-control centerStyle" placeholder="시간선택"
                           id="lessonTimeEnd">
                     </div>
                  </div>

                  <br>
                  <div class="row">

                     <div class="col-sm-3">
                        <p>수강인원</p>
                        <input type="text" name="number" class="form-control"
                           placeholder="인원">
                     </div>
                     <div class="col-sm-3">
                        <p>강의지역</p>
                        <select id="lesson_location" name="lesson_location"
                           class="form-control">
                           <option value="서울">서울</option>
                           <option value="세종">세종</option>
                           <option value="인천">인천</option>
                           <option value="강원">강원</option>
                           <option value="경기">경기</option>
                           <option value="충북">충북</option>
                           <option value="충남">충남</option>
                           <option value="경북">경북</option>
                           <option value="대전">대전</option>
                           <option value="대구">대구</option>
                           <option value="전북">전북</option>
                           <option value="경남">경남</option>
                           <option value="울산">울산</option>
                           <option value="광주">광주</option>
                           <option value="부산">부산</option>
                           <option value="전남">전남</option>
                           <option value="제주">제주</option>
                        </select>
                     </div>

                     <div class="col-sm-3">
                        <p>강의 카테고리</p>
                        <select id="category" name="category" class="form-control">
                           <option value="헬스/필라테스">헬스/필라테스</option>
                           <option value="주식투자">주식투자</option>
                           <option value="메이크업">메이크업</option>
                           <option value="영상편집">영상편집</option>
                           <option value="영어">영어</option>
                           <option value="스피치/발표">스피치/발표</option>
                           <option value="파워포인트">파워포인트</option>
                           <option value="댄스">댄스</option>
                           <option value="프로그래밍">프로그래밍</option>
                           <option value="디자인">디자인</option>
                           <option value="베이킹">베이킹</option>
                           <option value="미술">미술</option>
                           <option value="취업">취업</option>
                           <option value="공예">공예</option>
                           <option value="공연">공연</option>
                           <option value="문서">문서</option>
                        </select>

                     </div>

                  </div>

               </div>

            </div>


            <div class="col-sm-12">


               <input type="hidden" id="uid" name="uid" value="${login.uid}"><br>
               <input type="hidden" name="writer" value="${login.uname}">



              	  <span style="font-size: 25px; font-weight: bold;">강사 소개</span><span style="color:grey;font-size:0.5em"> (자유롭게 작성해도 좋습니다.)</span>
                 <hr style="border: 1px solid #fc7700">
                 <textarea class="form-control" name="career" rows="20" id="t_intro"></textarea>
               	<br>

               
                  <span style="font-size: 25px; font-weight: bold;">강의 소개</span><span style="color:grey;font-size:0.5em"> (자유롭게 작성해도 좋습니다.)</span>
                  <hr style="border: 1px solid #fc7700">
                  <textarea class="form-control" name="content" rows="30" id="l_intro"></textarea>
               	<br>


              <span style="font-size: 25px; font-weight: bold;">커버 사진 등록(필수)</span>
               <hr style="border: 1px solid #fc7700">
               <div>
                  <img src="" id="coverImage"> <input type="hidden"
                     name="coverImagePath" id="coverImagePath" value="">
                  <div class="caption">
                     <input class="form-control" type="file" id="coverInput">
                  </div>
               </div>
               <br>

               <div>
                  <span style="font-size: 25px; font-weight: bold;">사진 등록</span> <span style="color:grey;font-size:0.5em">(사각형안에 사진파일을 드래그 해보세요)</span>
                   <hr style="border: 1px solid #fc7700">
                  <div class=fileDrop></div>
                  <ul class="row uploadedList"></ul>
               </div>
               <div class="text-center" style="margin:30px">
               <button type="button" class="btn btn-primary" style="width:40%"> 등록 </button>
               </div>
            </div>


         </div>
      </form>
   </div>






   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
   <script type="text/javascript" src="/resources/js/upload.js"></script>
   <script id="template" type="text/x-handlebars-template">
<li class="center-block col-xs-6 col-md-3" style="list-style: none">
<img src="{{imgsrc}}" class="img-thumbnail" alt="Attachment">
<a href="{{getLink}}"><span class="label label-warning">{{fileName}}</span></a>
<a href="{{fullName}}" class="delbtn"><span class="glyphicon glyphicon-remove"></span></a>
</li>
</script>
   <script>
      $(document).ready(function(){
         $('#t_intro').val("수상 경력 : "+"\r\n\r\n" +"실무 경력 : " + "\r\n\r\n" + "SNS 링크 : ");
         $('#l_intro').val("수업 수준 : [ex 입문/초급/중급/고급]" +"\r\n\r\n" + "수업 형태 : [ex 1:1 / 그룹]" +"\r\n\r\n" + 
               "기간별 횟수 및 요일 : [ex 주 2회 / 수,금]" +"\r\n\r\n" + "상세 위치 : [ex 강남 oo스터디룸]" + "\r\n\r\n" + "준비물 : [ex 재료 or 재료비]" + "\r\n\r\n" +
               "세부 커리큘럼 : [ex 1주차계획... , 2주차계획...]"+"\r\n\r\n" + "모집대상 : [ex 무관/30대이상]")
      });
   </script>
   <script>
      $("#dateStart").datepicker({
         format : "yyyy-mm-dd",
         language : "kr",
      });

      $("#dateEnd").datepicker({
         format : "yyyy-mm-dd",
         language : "kr",
      });

      $("#lessonTimeStart").timepicker({
         step : 30, //시간간격 : 5분
         timeFormat : "H:i" //시간:분 으로표시
      });
      $("#lessonTimeEnd").timepicker({
         step : 30, //시간간격 : 5분
         timeFormat : "H:i" //시간:분 으로표시
      });

      myImageShow();

      function myImageShow() { //등록자 MyImage 출력 
         $.ajax({
            type : "get",
            url : "/my/uimageGet/" + $("#uid").val(),
            dataType : "text",
            success : function(uimage) {
               if (uimage) { //등록된 이미지가 있으면 
                  var path = "my";
                  var fileInfo = getFileInfo(uimage, path);
                  $("#myImage").attr("src", fileInfo.imgsrc);
               }
            }
         });
      };

      var template = Handlebars.compile($("#template").html());

      $(".fileDrop").on("dragenter dragover", function(event) {
         event.preventDefault();
      });

      $(".fileDrop").on("drop", function(event) { //사진을 Drop 했을시 
         event.preventDefault();

         var files = event.originalEvent.dataTransfer.files;

         var file = files[0];

         console.log(file);
         var formData = new FormData();

         formData.append("file", file);

         $.ajax({
            type : "post",
            url : "/uploadAjax",
            data : formData,
            dataType : 'text',
            processData : false,
            contentType : false,
            success : function(data) {
               if (data) {
                  var path = "board";
                  var fileInfo = getFileInfo(data, path);
                  var html = template(fileInfo);
                  $(".uploadedList").append(html);
               } else {
                  alert("Image File Please");
               }
            }
         });
      });

      $("button").on(
            "click",
            function(event) { //게시글 등록 버튼 

               event.preventDefault();

               var str = "";

               $(".uploadedList .delbtn").each(
                     function(index) {

                        str += "<input type='hidden' name='files["
                              + index + "]' value='"
                              + $(this).attr("href") + "'>";
                        console.log(str);

                     });

               $("form").append(str);

               $("form").get(0).submit();

            });

      $(".uploadedList").on("click", ".delbtn", function(event) { //사진 삭제
         alert("클릭됨")
         event.preventDefault();

         var that = $(this);

         $.ajax({
            url : "/deleteFile/board",
            type : "post",
            data : {
               fileName : $(this).attr("href")
            },
            dataType : "text",
            success : function(result) {
               if (result == 'deleted') {
                  that.parent("li").remove();
               }
            }

         });

      });

      $("#coverInput").change(function(event) { //커버이미지
         var formData = new FormData();
         formData.append("file", $("#coverInput")[0].files[0]);//파일의 정보를 formData에 삽입 

         $.ajax({ //image 파일 폴더에 생성
            type : "post",
            url : "/uploadAjax",
            dataType : "text",
            data : formData,
            processData : false,
            contentType : false,
            success : function(result) {

               if (result) {
                  var path = "board";
                  var fileInfo = getFileInfo(result, path);
                  $("#coverImage").attr("src", fileInfo.imgsrc);

                  if ($("#coverImagePath").val() != "") //기존 coverImage가 들어있다면 
                  {
                     coverImageDelete($("#coverImagePath").val());
                     //$("#coverImage").attr("alt")
                  }
                  $("#coverImagePath").val(fileInfo.fullName);

               } else {
                  alert("Image File please");
               }

            }
         });
      });

      function coverImageDelete(coverImagePath) {
         $.ajax({
            url : "/deleteFile/board",
            type : "post",
            data : {
               fileName : coverImagePath
            },
            dataType : "text",
            success : function(result) {
               console.log("교체성공");
            }
         });
      }
   </script>


</body>
</html>