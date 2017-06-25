<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>>
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
#title {
	margin-top: 100px;
}

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
<body>

	<div class="container"
		style="border: 5px solid #FAFAFA; background-color: white">
		<form role="form" method="post">
			<input type="hidden" id="uid" name="uid" value="${login.uid}"><br>
			<input type="hidden" name="writer" value="${login.uname}"> 
			<input type="hidden" id="perPageNum" name="perPageNum" value="${cri.perPageNum}">
			<input type="hidden" id="page" name="page" value="${cri.page}">
			<input type="hidden" id="searchType" name="searchType"value="${cri.searchType}">
			<input type="hidden" id="keyword" name="keyword" value="${cri.keyword}">

		<div>
				<center> <span style="font-size: 35px; font-weight: bold; padding-top: 50px">강의 수정</span><center>
						<hr style="border: 1px solid #fc7700">
			</div>
			<div class="container-fluid" style="color: black">
				<div class="row content">
					<div class="col-sm-3 sidenav">

						<img src="../resources/images/user/userBlank.png" id="myImage"
							class="img-circle">
					</div>
					<div class="col-sm-9">

						<p>강의 제목</p>
						<input class="form-control" type="text" name="title"
							value="${boardVO.title}"> <br>
						<div class="row">
							<div class="col-sm-3">
								<p>시작날짜</p>
								<input type="text" id="dateStart" name="dateStart"
									class="form-control centerStyle" value="${boardVO.dateStart}"
									placeholder="날짜선택">
							</div>

							<div class="col-sm-3">
								<p>종료날짜</p>
								<input type="text" id="dateEnd" name="dateEnd"
									class="form-control centerStyle" value="${boardVO.dateEnd}"
									placeholder="날짜선택">
							</div>
							<div class="col-sm-3">
								<p>시작시간</p>
								<input type="text" name="lessonTimeStart"
									class="form-control centerStyle" placeholder="시간선택"
									id="lessonTimeStart" value="${boardVO.lessonTimeStart}">
							</div>
							<div class="col-sm-3">
								<p>종료시간</p>
								<input type="text" name="lessonTimeEnd"
									class="form-control centerStyle" placeholder="시간선택"
									id="lessonTimeEnd" value="${boardVO.lessonTimeEnd}">
							</div>
						</div>

						<br>
						<div class="row">

							<div class="col-sm-3">
								<p>수강인원</p>
								<input type="text" name="number" value="${boardVO.number}"
									class="form-control" placeholder="인원">
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


					<span style="font-size: 25px; font-weight: bold;">강사 소개</span><span
						style="color: grey; font-size: 0.5em"> (자유롭게 작성해도 좋습니다.)</span>
					<hr style="border: 1px solid #fc7700">
					<textarea class="form-control" name="career" rows="20" id="t_intro">${boardVO.career}</textarea>
					<br> <span style="font-size: 25px; font-weight: bold;">강의
						소개</span><span style="color: grey; font-size: 0.5em"> (자유롭게 작성해도
						좋습니다.)</span>
					<hr style="border: 1px solid #fc7700">
					<textarea class="form-control" name="content" rows="30" id="l_intro">${boardVO.content}</textarea>
					<br>

					 <span style="font-size: 25px; font-weight: bold;">커버 사진 등록</span>
					 <hr style="border: 1px solid #fc7700">
					<div class="row">
						<div class="col-sm-6 col-md-4">
							<div class="thumbnail">
								<img src="/displayFile/board?fileName=${boardVO.coverImagePath}"
									id="coverImage"> <input type="hidden"
									name="coverImagePath" id="coverImagePath"
									value="${boardVO.coverImagePath}">

								<div class="caption">
									<input type="file" id="coverInput">
								</div>
							</div>
						</div>
					</div>

					<div>
			<span style="font-size: 25px; font-weight: bold;">사진 등록</span> <span style="color:grey;font-size:0.5em">(사각형안에 사진파일을 드래그 해보세요)</span>
					 <hr style="border: 1px solid #fc7700">	
						<div class=fileDrop></div>
						<ul class="row uploadedList">
						</ul>

					</div>
		</form>



	</div>


	<button type="button" id="modifyBtn" class="btn btn-primary">수정완료</button>
	<button type="button" id="backBtn" class="btn btn-primary">수정취소</button>
	
	<%-- <input type="hidden" value="${boardVO.uid}" id="uid"> --%>



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
		var bno = '${boardVO.bno}';
		var arr = []; //삭제버튼을 누르면 삭제한 경로를 arr에 담는다. 

		$("#lesson_location").val('${boardVO.lesson_location}').attr(
				"selected", "selected"); //수정값 select
		$("#category").val('${boardVO.category}').attr("selected", "selected"); //수정값 select

		/*  datePicker & timePicker */
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

		/*  datePicker & timePicker */

		//var template = Handlebars.compile($("#templateAttach").html());
		var template = Handlebars.compile($("#template").html())
		myImageShow(); //myImage 출력

		$.getJSON("/board/getAttach/" + bno, function(list) {
			$(list).each(function() {
				var path = "board";
				var fileInfo = getFileInfo(this, path);

				var html = template(fileInfo);

				$(".uploadedList").append(html);

			});
		});

		function myImageShow() { //MyPage 이미지 보여주기 
			$.ajax({
				type : "get",
				url : "/my/uimageGet/" + $("#uid").val(),
				dataType : "text",
				success : function(uimage) {
					var path = "my";
					var fileInfo = getFileInfo(uimage, path);
					console.log(fileInfo.imgsrc);
					$("#myImage").attr("src", fileInfo.imgsrc);

				}

			});
		};

		//var template = Handlebars.compile($("#template").html());

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

		$("#modifyBtn").on(
				"click",
				function(event) { //수정완료 버튼 

					event.preventDefault();
					alert("ss")

					var str = "";

					$(".uploadedList .delbtn").each(
							function(index) { //제출 할시 input 형태로 파일들을 만들어준다.

								str += "<input type='hidden' name='files["
										+ index + "]' value='"
										+ $(this).attr("href") + "'>";
								console.log(str);
							});

					imageDelete(); //수정완료 했을시 폴더에 있는 사진 삭제 
					$("form").append(str);

					$("form").get(0).submit();

				}); //수정완료버튼 끝

		$("#backBtn").on(
				"click",
				function() { //수정취소 버튼 

					self.location = "/board/boardRead?bno=" + bno + "&page="
							+ $("#page").val() + "&perPageNum="
							+ $("#perPageNum").val() + "&searchType="
							+ $("#searchType").val() + "&keyword="
							+ $("#keyword").val();

				});

		$(".uploadedList").on("click", ".delbtn", function(event) { //사진 삭제
			alert("클릭됨")
			event.preventDefault();

			var that = $(this);

			arr.push($(this).attr("href"));

			that.parent("li").remove(); //화면에 있는 image만 삭제한다, submit 할시 image 완전삭제

		});

		function imageDelete() { //폴더에 있는 사진 삭제

			for (var i = 0; i < arr.length; i++) {

				$.ajax({
					url : "/deleteFile/board",
					type : "post",
					data : {
						fileName : arr[i]
					},
					dataType : "text",
					success : function(result) {
						if (result == 'deleted') {

						}
					}

				});
			}

		}

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