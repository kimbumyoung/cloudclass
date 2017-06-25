<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cloud Class - 자유게시판</title>

<!-- 템플릿,부트스트랩과 jquery를 사용하기 위한 cdn -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>

<!-- 스타일시트 -->
  <style>
    .fileDrop{
      height:100px;
      border:1px solid black;
      background-size:50px;
      background-image : url('/resources/images/Add-File-icon.png');
      background-position:center;
      background-repeat:no-repeat;
    }
  </style>

<script>
$(document).ready(function(){
   var formObj = $("form[role='form']");
   
   console.log(formObj);
   
   $("#btn-save").on("click",function(){//수정완료
	  
	   var str = "";
	   $(".uploadedList .delbtn").each(function(index) { //제출 할시 input 형태로 파일들을 만들어준다.
	      
	      str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href")+"'>";
	      console.log(str);
	   });

	   imageDelete(); //수정완료 했을시 폴더에 있는 사진 삭제 
	   $("form").append(str);

	   $("form").get(0).submit();

	   }); //수정완료버튼 끝
 
   $("#btn-cancel").on("click",function(){ //수정취소
	   self.location="/FreeBoard/list?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}";
     });
});

</script>
</head>


<body>
<!-- ######### 헤더페이지 삽입 ##### -->
<%@include file="../include/header.jsp"%>


<div class="row" style="margin-top:100px"> <!--  가로 큰거 하나 만들고 -->
  <div class="col-md-2"></div> <!--  그 가로 중에 왼쪽 두조각 주고 -->
        <div class="col-md-8"> <!--  남은 조각중에 가운데 8조각을 처리할거야. -->

<!-- ######### form태그 시작 ######### -->
<form role="form" action="modifyPage" method="post" class="form-horizontal">


  <!-- ###### 제목 입력.###### -->
  <div class="form-group">
      <label for="title" class="col-md-1 control-label">제 목</label>
      <div class="col-md-9">
       <input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력하세요" value="${freeBoardVO.title}">
      </div>
  </div> 

  <!-- ###### 작성자 출력.###### -->
  <div class="form-group">
    <label class="col-md-1 control-label">작성자</label>
    <div class="col-md-9"><h5>${login.uid}</h5></div>  
  </div>

  <!-- ###### 내용 입력.###### -->
  <div class="form-group" >
    <label for="content" class="col-md-1 control-label">내용</label>
    <div class="col-md-9">
      <textarea wrap="hard" class="form-control" rows="10"  name="content" id="content">${freeBoardVO.content}</textarea>
    </div>
  </div>
  
  
  
  
    <!-- 파일 업로드 영역 -->
  <div class="form-group">
      <label for="exampleInputEmail1">▼ 업로드 하려는 파일을 올려놓으세요.</label>
      <div class="fileDrop"></div>
  </div>
  

 <!-- 파일 업로드된 리스트 영역 -->
  ▼첨부파일목록
    <ul class="mailbox-attachments clearfix uploadedList"></ul>
    
    
<script src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript" src="/resources/js/freeupload.js"></script>  
<!-- 템플릿사용 -->
<script id="templateAttach" type="text/x-handlebars-template">
  <li data-src='{{fullName}}' style="float:left; list-style:none; margin:10px;>
    <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
    <div class="mailbox-attachment-info">
     <a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
    <a href="{{fullName}}" class="delbtn"><span class="glyphicon glyphicon-remove"></span></a>
    </div>
  </li>
</script>
    

    
    
    
<!-- 조회 페이지에서 첨부파일에 대한 템플릿과 자바스크립트 -->
<script>

    var bno=${freeBoardVO.bno};
    var arr = []; //삭제버튼을 누르면 삭제한 경로를 arr에 담는다. 
    
    var template=Handlebars.compile($("#templateAttach").html());
    //var template=Handlebars.compile($("#template").html());
    
    $.getJSON("/FreeBoard/getAttach/"+bno,function(list){
      
      $(list).each(function(){

        var fileInfo = getFileInfo(this);
        
        var html = template(fileInfo);
        $(".uploadedList").append(html);
      });
    });
</script>
    
 <div style="text-align:center">
  <input type="button" class="btn btn-warning" value="저장" id="btn-save"> 
  <input type="button" class="btn btn-warning" value="취소" id="btn-cancel"> 
</div>
  <!-- data를 넘겨줘야 하므로 히든처리 -->
  <input type="hidden" name="bno" value="${freeBoardVO.bno}" > 
  <input type="hidden" name="writer" value="${freeBoardVO.writer}" >
  <input type="hidden" name="page" value="${cri.page}" >
  <input type="hidden" name="perPageNum" value="${cri.perPageNum}" > 
  <input type="hidden" name="searchType" value="${cri.searchType}" >
  <input type="hidden" name="keyword" value="${cri.keyword}" >
  
</form> <!-- end of form -->



<!-- 파일의 드래그 앤 드랍을 표현하는 부분. -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript" src="/resources/js/freeupload.js"></script>  



<script>
    var template = Handlebars.compile($("#templateAttach").html());
   
    
    $(".fileDrop").on("dragenter dragover",function(event){ 
        event.preventDefault();
      });
      
      $(".fileDrop").on("drop",function(event){
        event.preventDefault();
         var files = event.originalEvent.dataTransfer.files;
        var file = files[0];
        //console.log(file);
        var formData = new FormData();
        formData.append("file",file);
        
        $.ajax({
          url:'/freeupload/uploadAjax',
          data:formData,
          dataType:'text',
          processData:false,
          contentType:false,
          type:'POST',
          success:function(data){
            
           
            var fileInfo = getFileInfo(data);
            var html = template(fileInfo);
            
            console.log(data);
            console.log(checkImageType(data));
            $(".uploadedList").append(html); 
          }
        });
      });
      
      

      $(".uploadedList").on("click",".delbtn",function(event){ //사진 삭제
      
      event.preventDefault();   
        
        var that = $(this);
        
        arr.push($(this).attr("href"));
        
        that.parent().parent("li").remove(); //화면에 있는 image만 삭제한다, submit 할시 image 완전삭제

      });
      
      
      function imageDelete() { //폴더에 있는 사진 삭제
    	   
    	   for(var i=0; i<arr.length; i++){
    	      
    	        $.ajax({
    	            url:"/freeupload/deleteFile",
    	            type:"post",
    	            data:{fileName:arr[i]},
    	            dataType:"text",
    	            success:function(result){
    	               if(result=='deleted'){
    	                  
    	               }
    	            }
    	            
    	           });
    	   }
    	   
    	}

      
</script>

      <div class="col-md-8">
<div class="col-md-2"></div>
</div>


</body>
</html>