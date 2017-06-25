<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="../include/header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CloudClass - Register</title>
</head>
<body>
<div style="margin-top:100px;" class="row">
	<div class="col-md-3"></div>
	<div class="col-md-6">
		<form role="form" method="post">
			<div class="box-body">
			
			
				<input type="hidden" value="${login.uid}" name="uid">
				<input type="hidden" value="${login.uname}" name="writer">
				
				<div class="panel panel-warning">
					<div class="panel-heading"><h4>게시글 제목을 입력하세요.</h4><h6>ex) [카테고리] OOO 가르쳐주실분 있나요? </h6></div>
					<input type="text" name='title' class="form-control" placeholder="자유롭게 작성하셔도 좋습니다.">
				</div>
				
				<div class="panel panel-warning">
					<div class="panel-heading"><h4>대상자의 성별을 알려주세요.</h4></div>
					<div class="list-group">
						<div class="list-group-item"><label for="male"><input name="sex" type="radio" value="남" id="male"> 남</label></div>
						<div class="list-group-item"><label for="female"><input name="sex" type="radio" value="여" id="female"> 여</label></div>			
					</div>
				</div>
				<div class="panel panel-warning">
					<div class="panel-heading"><h4>희망하는 수업 레벨을 선택해주세요.</h4></div>
					<div class="list-group">
						<div class="list-group-item"><label for="lv1"><input name="level" type="radio" value="입문" id="lv1"> 입문</label></div>
						<div class="list-group-item"><label for="lv2"><input name="level" type="radio" value="초급" id="lv2"> 초급</label></div>
						<div class="list-group-item"><label for="lv3"><input name="level" type="radio" value="중급" id="lv3"> 중급</label></div>
						<div class="list-group-item"><label for="lv4"><input name="level" type="radio" value="고급" id="lv4"> 고급</label></div>
					</div>
				</div>
				<div class="panel panel-warning">
					<div class="panel-heading"><h4>희망하는 수업 형태를 선택해주세요.</h4></div>
					<div class="list-group">
						<div class="list-group-item"><label for="lesson1"><input name="lesson" type="radio" value="개인" id="lesson1"> 개인</label></div>
						<div class="list-group-item"><label for="lesson2"><input name="lesson" type="radio" value="그룹" id="lesson2"> 2명이상 그룹</label></div>
						<div class="list-group-item"><label for="lesson3"><input name="lesson" type="radio" value="무관" id="lesson3"> 무관</label></div>
						<div class="list-group-item"><label for="lesson4"><input name="lesson" type="radio" value="직접입력" id="lesson4"> 기타 (직접입력)</label>
						<input type="text" id="lessonInput" class="form-control" readonly="readonly"></div>
					</div>
				</div>
				<div class="panel panel-warning">
					<div class="panel-heading"><h4>수강 기간을 선택해주세요.</h4></div>
					<div class="list-group">
						<div class="list-group-item"><label for="term1"><input name="term" type="radio" value="1개월" id="term1"> 1 개월</label></div>
						<div class="list-group-item"><label for="term2"><input name="term" type="radio" value="2개월" id="term2"> 2 개월</label></div>
						<div class="list-group-item"><label for="term3"><input name="term" type="radio" value="3개월" id="term3"> 3 개월</label></div>
						<div class="list-group-item"><label for="term4"><input name="term" type="radio" value="원데이클래스" id="term4"> 원데이 클래스</label></div>
						<div class="list-group-item"><label for="term5"><input name="term" type="radio" value="직접입력" id="term5"> 기타 (직접입력)</label>
						<input type="text" id="termInput" class="form-control" readonly="readonly"></div>
					</div>
				</div>
				<div class="panel panel-warning">
					<div class="panel-heading"><h4>수강 기간 동안 희망하는 수업 횟수를 정해주세요.</h4></div>
					<div class="list-group">
						<div class="list-group-item"><label for="week1"><input name="lessoncnt" type="radio" value="주 1회" id="week1"> 주 1회</label></div>
						<div class="list-group-item"><label for="week2"><input name="lessoncnt" type="radio" value="주 2회" id="week2"> 주 2회</label></div>
						<div class="list-group-item"><label for="week3"><input name="lessoncnt" type="radio" value="주 3회" id="week3"> 주 3회</label></div>
						<div class="list-group-item"><label for="week4"><input name="lessoncnt" type="radio" value="2주 1회" id="week4"> 격주 1회</label></div>
						<div class="list-group-item"><label for="week5"><input name="lessoncnt" type="radio" value="1 day" id="week5"> 원데이 클래스</label></div>
						<div class="list-group-item"><label for="week6"><input name="lessoncnt" type="radio" value="직접입력" id="week6"> 기타 (직접입력)</label>
						<input type="text" id="lessoncntInput" class="form-control" readonly="readonly"></div>
					</div>
				</div>
				<div class="panel panel-warning">
					<div class="panel-heading"><h4>회당 수강 시간을 정해주세요.</h4></div>
					<div class="list-group">
						<div class="list-group-item"><label for="time1"><input name="lessontime" type="radio" value="1시간" id="time1"> 1시간</label></div>
						<div class="list-group-item"><label for="time2"><input name="lessontime" type="radio" value="2시간" id="time2"> 2시간</label></div>
						<div class="list-group-item"><label for="time3"><input name="lessontime" type="radio" value="3시간" id="time3"> 3시간</label></div>
						<div class="list-group-item"><label for="time4"><input name="lessontime" type="radio" value="4시간" id="time4"> 4시간</label></div>
						<div class="list-group-item"><label for="time5"><input name="lessontime" type="radio" value="직접입력" id="time5"> 기타 (직접입력)</label>
						<input type="text" id="lessontimeInput" class="form-control" readonly="readonly"></div>
					</div>
				</div>
				<div class="panel panel-warning">
					<div class="panel-heading"><h4>수강 가능 요일을 선택해주세요.</h4><h6>(중복선택가능)</h6></div>
					<div class="list-group">
					<div class="list-group-item"><label><input name="hopedate" type="checkbox" value="월" id="mon"> 월요일</label></div>
					<div class="list-group-item"><label><input name="hopedate" type="checkbox" value="화" id="tue"> 화요일</label></div>
					<div class="list-group-item"><label><input name="hopedate" type="checkbox" value="수" id="wed"> 수요일</label></div>
					<div class="list-group-item"><label><input name="hopedate" type="checkbox" value="목" id="thu"> 목요일</label></div>
					<div class="list-group-item"><label><input name="hopedate" type="checkbox" value="금" id="fri"> 금요일</label></div>
					<div class="list-group-item"><label><input name="hopedate" type="checkbox" value="토" id="sat"> 토요일</label></div>
					<div class="list-group-item"><label><input name="hopedate" type="checkbox" value="일" id="sun"> 일요일</label></div>
					</div>
				</div>
			
				<div class="panel panel-warning">
					<div class="panel-heading"><h4>희망 장소를 제안해주세요.</h4></div>
					<div class="list-group">
						<div class="list-group-item"><label for="s_area"><input name="place" type="radio" value="수강생 지정" id="s_area"> 제 위치로 강사가 오길바랍니다.</label></div>
						<div class="list-group-item"><label for="t_area"><input name="place" type="radio" value="강사 지정" id="t_area"> 강사님 위치로 제가 가겠습니다.</label></div>
					</div>
				</div>
				<div class="panel panel-warning">
					<div class="panel-heading"><h4>서비스가 필요한 지역을 선택해주세요.</h4></div>
					<select id="selectArea" name="area" class="form-control"> 
		                <option  value="서울">서울</option> 
		                <option  value="세종">세종</option> 
		                <option  value="인천">인천</option> 
		                <option  value="강원">강원</option> 
		                <option  value="경기">경기</option> 
		                <option  value="충북">충북</option> 
		                <option  value="충남">충남</option> 
		                <option  value="경북">경북</option> 
		                <option  value="대전">대전</option> 
		                <option  value="대구">대구</option> 
		                <option  value="전북">전북</option> 
		                <option  value="경남">경남</option> 
		                <option  value="울산">울산</option> 
		                <option  value="광주">광주</option> 
		                <option  value="부산">부산</option> 
		                <option  value="전남">전남</option> 
		                <option  value="제주">제주</option>
		            </select>	
				</div>

				<div class="panel panel-warning">
					<div class="panel-heading"><h4>기타 필요한 전달 사항을 입력하세요.</h4><h6>(ex. 시작날짜/상세지역/희망파트/준비물상태/기타...)</h6></div>
					<textarea class="form-control" name="content" rows="4" placeholder="(선택)"></textarea>
				</div>
			</div>
			
			<div class="box-footer" style="text-align:center">
				<button id="submitBtn" type="button" class="btn btn-primary" style="width:50%">등록하기</button>
			</div>
		</form>
	</div>
	<div class="col-md-3"></div>
</div>
<script>
$(document).ready(function(){
	// 기타 등록글 readonly ON/OFF
	$('input[name="lesson"]').change(function(){
		if($(this).val() == "직접입력"){
			$('#lessonInput').attr('readonly',false);
		}else{
			$('#lessonInput').attr('readonly',true);
			$('#lessonInput').val("");
		}
	});
	$('input[name="lessoncnt"]').change(function(){
		if($(this).val() == "직접입력"){
			$('#lessoncntInput').attr('readonly',false);
		}else{
			$('#lessoncntInput').attr('readonly',true);
			$('#lessoncntInput').val("");
		}
	});
	$('input[name="lessontime"]').change(function(){
		if($(this).val() == "직접입력"){
			$('#lessontimeInput').attr('readonly',false);
		}else{
			$('#lessontimeInput').attr('readonly',true);
			$('#lessontimeInput').val("");
		}
	});
	$('input[name="term"]').change(function(){
		if($(this).val() == "직접입력"){
			$('#termInput').attr('readonly',false);
		}else{
			$('#termInput').attr('readonly',true);
			$('#termInput').val("");
		}
	});
	
	//제출 버튼 이벤트 전처리
	$("#submitBtn").on("click",function(event){
		if($("#lesson4:checked")){
			$("#lesson4").val($("#lessonInput").val());
		}
		if($("#week6:checked")){
			$("#week6").val($("#lessoncntInput").val());
		}
		if($("#time5:checked")){
			$("#time5").val($("#lessontimeInput").val());
		}
		if($("#term5:checked")){
			$("#term5").val($("#termInput").val());
		}
		$("form").submit();
	});
});
</script>
</body>
</html>