<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cloud Class - 자유게시판</title>

<!-- 부트스트랩과 jquery를 사용하기 위한 cdn  (제이쿼리 먼저/.) -->
<script  src="http://code.jquery.com/jquery.js"></script>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
 

<script>
$(document).ready(function(){
   var formObj = $("form[role='form']");
   
   console.log(formObj);
   
   $("#btn-modify").on("click",function(){
     formObj.attr("action","/FreeBoard/modifyPage");
     formObj.attr("method","get");
     formObj.submit();
   });
   
   $("#btn-remove").on("click",function(){
       formObj.attr("action","/FreeBoard/removePage");
       //formObj.attr("method","post");
       formObj.submit();
     });
   
   $("#btn-listAll").on("click",function(){
       formObj.attr("action","/FreeBoard/list");
       formObj.attr("method","get");
       formObj.submit();
     });
});
</script>

  
</head>


<body>



<%@include file="../include/header.jsp"%>


<form role="form" action="modifyPage" method="post">
  <input type="hidden" name="bno" value="${freeBoardVO.bno}">
  <input type="hidden" name="page" value="${cri.page}">
  <input type="hidden" name="perPageNum" value="${cri.perPageNum}">
  <input type="hidden" name="searchType" value="${cri.searchType}">
  <input type="hidden" name="keyword" value="${cri.keyword}">
</form>





<!-- 내용 -->

<div class="row" >


<div class="col-md-2"></div>
      <div class="col-md-8">



<div style="margin-top:100px">
  <div style="color:#fc7700"><span><h1><b>${freeBoardVO.title}</b></h1></span></div>
  <div style="margin-top:20px"><label> # </label><span>${freeBoardVO.bno}   </span><label> 작성자 </label><span>${freeBoardVO.uname}   </span><label> 조회수 </label><span>${freeBoardVO.viewcnt}   </span><label> 댓 글 </label><span>${freeBoardVO.replycnt}</span> </div>
</div>
<hr>
		<div>
		  <pre>${freeBoardVO.content}</pre>
		</div>
<hr>

 
<!-- #################################################### -->


 <!-- 파일 업로드된 리스트 영역 -->
  ▼첨부파일목록
    <ul class="mailbox-attachments clearfix uploadedList"></ul>
    
    
<script src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript" src="/resources/js/freeupload.js"></script>  
<!-- 템플릿사용 -->
<script id="templateAttach" type="text/x-handlebars-template">
  <li data-src='{{fullName}}' style="float:left; list-style:none; margin:10px;">
    <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
    <div class="mailbox-attachment-info">
     <a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
    </div>
  </li>
</script>


<!-- 조회 페이지에서 첨부파일에 대한 템플릿과 자바스크립트 -->
<script>
    var bno=${freeBoardVO.bno};
    var template=Handlebars.compile($("#templateAttach").html());
        
    
    
    $.getJSON("/FreeBoard/getAttach/"+bno,function(list){
      
      $(list).each(function(){

        var fileInfo = getFileInfo(this);
        
        var html = template(fileInfo);
        $(".uploadedList").append(html);
      });
    });
</script>

<div style="text-align:center">
	<c:if test="${freeBoardVO.writer eq login.uid}">
	<button class="btn btn-warning " type="button"  id="btn-modify">수정</button>
	<button class="btn btn-warning"type="button"  id="btn-remove">삭제</button>
	</c:if>
	<button class="btn btn-warning "type="button" id="btn-listAll">글목록</button>
</div>

<hr>




<!-- 댓글 리스트 -->
<ul id="replies">
</ul>








 <!-- 댓글수정부분 -->
  <div class="form-group form-horizontal" id ="modDiv" style="display:none" >
      <div class="col-md-7">
        <input type="text" class="form-control" id='replytext'>
      </div>
      <button class="btn btn-warning " type="button" id="replyModBtn">수정</button>
      <button class="btn btn-warning " type="button" id="replyDelBtn">삭제</button>
      <button class="btn btn-warning " type="button" id="closeBtn">취소</button>
      <input type="hidden" id="test" >
  </div> 


<hr>

 <!-- 댓글입력부분 -->
  <div class="form-group form-horizontal">
      <input type="hidden" class="form-control" name="replyer" id="newReplyWriter" value="${login.uid}">
      <label for="newReplytext" class="col-md-1 control-label">댓 글</label>
      <div class="col-md-9">
        <input type="text" class="form-control" id="newReplytext">
      </div>
      <button class="btn btn-warning " type="button" id="replyAddBtn">댓글작성</button>
  </div> 


 
<div class="col-md-2"></div>
</div>



<script  src="http://code.jquery.com/jquery.js"></script>
<script>
   var bno='${freeBoardVO.bno}';
   getAllList();
    // ################전체목록에 대한 함수 처리############
   function getAllList(){ 
   
   $.getJSON("/freplies/all/"+bno,function(data){
     
     var str="";
     
     $(data).each(function(){
    	 str+="<li data-rno='"+this.rno+"' class='replyLi'>" + this.uname+" : "+this.replytext+"/"+ "<fmt:formatDate pattern='yyyy-MM-dd HH:mm' value='${freeBoardVO.regdate}'/>"+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
      
       if (this.replyer == '${login.uid}')
    	   {
    	  str+= "<button class='btn btn-warning btn-xs'>수정</button>";  
    	   }
    	  str+="</li>";
       
       
     });
     
     $("#replies").html(str);
    });
   }//end of getAllList()
   
   getAllList(); // 일단 페이지 로드되면 바로 보여주는걸로 설정.
   
   
   
   // ############################댓글 등록############################
   $("#replyAddBtn").on("click",function(){
     
     var replyer=$("#newReplyWriter").val();
     var replytext=$("#newReplytext").val();
    
     $.ajax({
       type:'post',
       url:'/freplies',
       headers:{
         "Content-Type" : "application/json",
         "X-HTTP-Method-Override" : "POST"
       },
       dataType:'text',
       data:JSON.stringify({
         bno:bno,
         replyer:replyer,
         replytext:replytext
        }),
        success : function(result){
          if(result=='SUCCESS'){
            
            getAllList(); // 전체 댓글 목록의 갱신
          }
        }    
     });
     $('#newReplytext[type="text"]').val(""); // 댓글입력후 input창 클리어
  
   });
   
   // ###############각 버튼에 대한 이벤트를 처리하는 작업##################
   $("#replies").on("click",".replyLi button",function(){
     var reply=$(this).parent();
     var rno=reply.attr("data-rno");
     //var replytext = reply.text();
     
    // $(".modal-title").html(rno); 필요없으니까 주석
     $("#replytext").val("");
     $("#test").val(rno);
     $("#modDiv").show("slow");
   });
   
   
// ##################댓글 삭제#################
   $("#replyDelBtn").on("click",function(){ 
	    var rno=$("#test").val();
       var replytext=$("#replytext").val();
       
       
       $.ajax({
         type:'delete',
         url:'/freplies/'+rno,
         headers:{
           "Content-Type" : "application/json",
           "X-HTTP-Method-Override" : "DELETE"
         },
         dataType:'text',
         success : function(result){
           console.log("result:"+result);
            if(result=='SUCCESS'){
            	
              $('#modDiv').hide("slow");
             getAllList(); // 전체 댓글 목록의 갱신
            }
          }    
       });
     });

// ##################댓글 수정#################
   $("#replyModBtn").on("click",function(){ 
       
       var rno=$("#test").val();
       var replytext=$("#replytext").val();
       
       
       $.ajax({
         type:'put',
         url:'/freplies/'+rno,
         headers:{
           "Content-Type" : "application/json",
           "X-HTTP-Method-Override" : "PUT"
         },
         data:JSON.stringify({replytext:replytext}),
         dataType:'text',
         success : function(result){
           console.log("result:"+result);
            if(result=='SUCCESS'){
              
              $('#modDiv').hide("slow");
              getAllList(); // 전체 댓글 목록의 갱신
            }
          }    
       });
     });
     
// ##################댓글 수정 취소#################
   $("#closeBtn").on("click",function(){     
	   $('#modDiv').hide("slow");
	   getAllList(); // 전체 댓글 목록의 갱신
   });  
</script>

</body>
</html>