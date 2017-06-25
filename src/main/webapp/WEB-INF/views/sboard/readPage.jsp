<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../include/header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CloudClass - ReadPage</title>
<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
<div class="row" style="margin-top:100px;">
	<div class="col-md-3"></div>
	<div class="col-md-6">
		<form role="form" method="post">
			<input type='hidden' name='bno' value="${sboardVO.bno}">
			<input type='hidden' name='page' value="${cri.page}">
			<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
			<input type='hidden' name='searchType' value="${cri.searchType}">
			<input type='hidden' name='keyword' value="${cri.keyword}">
		</form>
		<div class="row">
			<div class="col-md-2">
				<div class="panel panel-default">
					<div class="panel-body" id="im" style="height: 130px">
					
					</div>
				</div>
			</div>
			<div class="col-md-10">
				<div class="panel panel-default">
					<div class="panel-body">
						<h4><label>${sboardVO.title}</label></h4>
						<div>작성자 : ${sboardVO.writer}</div>
						<div>이메일 : ${sboardVO.email}</div>
						<div>등록일 : <fmt:formatDate pattern="yyyy-MM-dd" value="${sboardVO.regdate}" /> / 조회수 : ${sboardVO.viewcnt}</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-bordered" style="table-layout:fixed">
				<tr>
					<th class="success" style="text-align:center" colspan="4">수 강 요 청 서</th>
				</tr>
				<tr>
					<td class="active">수강 기간</td>
					<td>${sboardVO.term}</td>
					<td class="active">수강생 성별</td>
					<td>${sboardVO.sex}</td>
				</tr>
				<tr>
					<td class="active">희망 횟수</td>
					<td>${sboardVO.lessoncnt}</td>
					<td class="active">수업 형태</td>
					<td>${sboardVO.lesson}</td>
				</tr>
				<tr>
					<td class="active">수업 시간</td>
					<td>${sboardVO.lessontime}</td>
					<td class="active">수업 레벨</td>
					<td>${sboardVO.level }</td>
				</tr>
				<tr>
					<td class="active">희망 요일</td>
					<td>${sboardVO.hopedate}</td>
					<td class="active">희망 지역</td>
					<td>${sboardVO.area}</td>
				</tr>
				<tr>
					<td class="active">희망 장소</td>
					<td>${sboardVO.place}</td>
				</tr>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
					<pre>${sboardVO.content}</pre>
			</div>
		</div>
		
		 <c:if test="${sboardVO.uid eq login.uid}">
		<div class="row text-right">
			<div class="col-md-12" >
				<button class="btn btn-default" type="submit" id="modifyBtn">수정</button>
				<button class="btn btn-default" type="submit" id="removeBtn">삭제</button>
				<button class="btn btn-default" type="submit" id="listBtn">목록보기</button>
			</div>
		</div>
		</c:if> 
	</div>
	<div class="col-md-3"></div>
</div>
<div class="row">
	<div class="col-md-3"></div>
	<div class="col-md-6">
		<div class="row">
			<div class="col-md-12">
				<div class="box-header">
					<h4 class="box-title">댓글 등록 </h4>
				</div>
			</div>
		</div>
		<div class="row-fluid">
			<div class="col-md-10">
				<div class="box-body short-div">
				
					<input class="form-control" type="hidden" value="${login.uid}" id="newReplyWriter">
				</div>
				<div class="short-div">
					<textarea class="form-control" placeholder="댓글 내용" id="newReplyText"></textarea>
				</div>
			</div>
			<div class="col-md-2">
				<div class="box-footer">
					<button type="submit" class="btn btn-primary" id="replyAddBtn" style="width:100%;height:50px;">등록</button>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-3"></div>
</div>
<div class="row" style="margin-top:10px">
	<div class="col-md-3"></div>
	<div class="col-md-6">
		<ul class="timeline list-group">
			<li class="time-label hidden" id="repliesDiv">댓글 목록</li>
		</ul>
		<div class='text-center'>
			<ul id="pagination" class="pagination pagination-sm no-margin">
			</ul>
		</div>
	</div>
	<div class="col-md-3"></div>
</div>

<div id="modifyModal" class="modal modal-primary fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"></button>
				<h4 class="modal-title hidden"></h4>
			</div>
			<div class="modal-body" data-rno>
				<p><input type="text" id="replytext" class="form-control"></p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
				<button type="button" class="btn btn-danger" id="replyDelBtn">Delete</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>




	<script>
	$(document).ready(function(){
		var formObj = $("form[role='form']");
		$("#modifyBtn").on("click",function(){
			formObj.attr("action","/sboard/modifyPage");
			formObj.attr("method","get");
			formObj.submit();
		});
		$("#removeBtn").on("click",function(){
			if(confirm("정말 삭제하시겠습니까?")==true){
				formObj.attr("action","/sboard/removePage");
				formObj.submit();	
			}
			else{
				return;
			}
		});
		$("#listBtn").on("click",function(){
			formObj.attr("method","get");
			formObj.attr("action","/sboard/list");
			formObj.submit();
		});
		getPage("/replies/"+bno+"/"+1);
	});
	</script>
	<script id="template" type="text/x-handlebars-template">
	{{#each .}}
	<li class="replyLi" data-rno={{rno}}>
		<div class="timeline-item">
			<i class="fa fa-comments bg-blue"></i>
			<span class="time">
				{{prettifyDate regdate}} : {{replyer}}
			</span>
			<h4 class="timeline-body form-control"><strong>{{replytext}}</strong></h4>
				
				<div class="timeline-footer text-right">
					<a class="btn btn-warning btn-xs"
					data-toggle="modal" data-target="#modifyModal"> 수정/삭제 </a>
				</div>
				
			</div>
		</div>
	</li>
	{{/each}}
	</script>
	<script>
	Handlebars.registerHelper("prettifyDate",function(timeValue){
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		var hour = dateObj.getHours();
		var minute = dateObj.getMinutes();
		var second = dateObj.getSeconds();
		return year+"/"+month+"/"+date+" - " +hour+":"+minute+":"+second;
	});
	var printData = function(replyArr,target,templateObject){
		var template = Handlebars.compile(templateObject.html());
		var html = template(replyArr);
		$(".replyLi").remove();
		target.after(html);
	}
	
	var bno = ${sboardVO.bno}; //해당게시물 번호
	var replyPage = 1;
	function getPage(pageInfo){
		$.getJSON(pageInfo,function(data){
			printData(data.list,$("#repliesDiv"),$('#template'));
			printPaging(data.pageMaker,$(".pagination"));
		});
	}
	var printPaging = function(pageMaker,target){
		var str = "";
		if(pageMaker.prev){
			str += "<li><a href='" + (pageMaker.startPage - 1) + "'> << </a></li>";
		}
		for(var i=pageMaker.startPage,len = pageMaker.endPage;i<=len;i++){
			var strClass = pageMaker.cri.page == i?'class=active':'';
			str += "<li " + strClass + "><a href='"+i+"'>"+i+"</a></li>";
		}
		if(pageMaker.next){
			str += "<li><a href='" + (pageMaker.endPage + 1) + "'> >> </a></li>";
		}
		target.html(str);
	};
	$("#repliesDiv").on("click",function(){
		if($(".timeline li").size() > 1){
			return;
		}
		getPage("/replies/"+bno+"/1")
	});
	$(".pagination").on("click","li a",function(event){
		event.preventDefault();
		replyPage = $(this).attr("href");
		getPage("/replies/"+bno+"/"+replyPage);
	});
	$("#replyAddBtn").on("click",function(){
		//var replyerObj = $("#newReplyWriter");
		var replytextObj = $("#newReplyText");
		var replyer =  $("#newReplyWriter").val();
		var replytext = replytextObj.val();
		
		$.ajax({
			type:'post',
			url:'/replies/',
			headers:{
				"Content-Type":"application/json",
				"X-HTTP-Method-Override":"POST"},
			dataType:'text',
			data: JSON.stringify({bno:bno,replyer:replyer,replytext:replytext}),
			success:function(result){
				console.log("result: "+result);
				if(result == 'SUCCESS'){
					alert("등록되었습니다.");
					replyPage = 1;
					getPage("/replies/"+bno+"/"+replyPage);
					replytextObj.val("");
				}
			}
		});
	});
	$(".timeline").on("click",".replyLi",function(event){
		var reply = $(this);
		$("#replytext").val(reply.find('.timeline-body').text());
		$(".modal-title").html(reply.attr("data-rno"));
	});
	$("#replyModBtn").on("click",function(){
		var rno = $(".modal-title").html();
		var replytext = $("#replytext").val();
		
		$.ajax({
			type:'put',
			url:'/replies/'+rno,
			headers: {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PUT" },
			data: JSON.stringify({replytext:replytext}),
			dataType:'text',
			success:function(result){
				console.log("result: " + result);
				if(result == 'SUCCESS'){
					alert("수정 되었습니다.");
					getPage("/replies/" + bno + "/" + replyPage);
					$("#modifyModal .close").click();
				}
			}
		});
		return false;
	});
	$("#replyDelBtn").on("click",function(){
		var rno = $(".modal-title").html();
		var replytext = $("#replytext").val();
		
		$.ajax({
			type:'delete',
			url:'/replies/' + rno,
			headers:{
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override": "DELETE"},
			dataType:"text",
			success:function(result){
				console.log("result :" + result);
				if(result == 'SUCCESS'){
					alert("삭제되었습니다.");
					getPage("/replies/" + bno + "/" + replyPage);
					$("#modifyModal .close").click();
				}
			}
		});
	});
	myImageCheck();
	   function myImageCheck() { //MyPage 이미지 보여주기 
	       $.ajax({
	          type : "get",
	          url : "/my/uimageGet/${sboardVO.uid}",
	          dataType : "text",
	          success : function(uimage) {
	             if (uimage) { //등록된 이미지가 있으면 
	                console.log(uimage);
	              var str = "<img width='100%' height='100%' src='/displayFile/my?fileName="+uimage+"' class='img-circle userimage'>";
	       
	                 $('#im').html(str);
	             }else{
	                   var s = "<img width='100%' height='100%' src='../resources/images/user/userBlank.png' alt='...' class='img-circle userimage'>";
	             }
	        
	          }
	       });
	    };
	
	</script>
</body>
</html>