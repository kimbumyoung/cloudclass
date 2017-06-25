<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cloud Class - 자유게시판</title>

<!-- 템플릿,부트스트랩과 jquery를 사용하기 위한 cdn -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script type="text/javascript" src="/resources/js/freeupload.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<!-- 템플릿사용 -->
<script id="template" type="text/x-handlebars-template">
  <li style="float:left; list-style:none; margin:10px;">
    <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
    
    <div class="mailbox-attachment-info">
     <a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
     <a href="{{fullName}}" class="delbtn"><span class="glyphicon glyphicon-remove"></span></a>
    </div>
  </li>
</script>


<!-- 
//원본 이미지를 가져오는 템플릿
<script id="template_getImage" type="text/x-handlebars-template">


<div contentEditable="true" id="orginalPicture">
  <img src="{{getLink}}" />
</div>
</script>
-->


<script>
$(document).ready(function(){
	
   $("#btn-cancle").on("click",function(){ //취소버튼을 누르면 다시 게시판 목록으로 이동.

	   self.location="/FreeBoard/list";
     });
});
</script>

<!-- 스타일시트 -->
  <style>
  
     #fileDrop{
      height:100px;
      border:1px solid black;
      background-size:50px;
      background-image : url('/resources/images/Add-File-icon.png');
      background-position:center;
      background-repeat:no-repeat;
    }
    
  </style>


</head>
<body>

<!-- 헤더파일 업로드 -->
<%@include file="../include/header.jsp"%>


<div class="row" style="margin-top:100px"> <!--  가로 큰거 하나 만들고 -->
	<div class="col-md-2"></div> <!--  그 가로 중에 왼쪽 두조각 주고 -->
	      <div class="col-md-8"> <!--  남은 조각중에 가운데 8조각을 처리할거야. -->

<!-- ######### form태그 시작 ######### -->
<form method="post" id="registerForm" class="form-horizontal"> 

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
      <textarea class="form-control" rows="10"  name="content" id="content" placeholder="내용을 입력하세요"></textarea>
    </div>
  </div>

  
  <!-- ##### 파일 업로드 영역 #####-->
  <div class="form-group">
      <label>▼ 업로드 하려는 파일을 올려놓으세요.</label><br>
      <div  id="fileDrop"></div>
  </div>
  
  
  <!-- ##### 파일 업로드된 리스트 영역 ###### --> 
  <div class="box-footer" >
      <div><hr></div>
      <ul class="mailbox-attachments clearfix uploadedList"></ul>
      <div style="text-align:center">
      <button type="submit" class="btn btn-warning">등록</button>
      <button type="button" class="btn btn-warning" id="btn-cancle">취소</button>
      </div>
  </div>
 
 

   <!-- ##### data를 넘겨줘야 하므로 히든처리 #####-->
  <input type="hidden" name="bno" value="${freeBoardVO.bno}" > 
  <input type="hidden" name="page" value="${cri.page}" >
  <input type="hidden" name="perPageNum" value="${cri.perPageNum}" > 
  <input type="hidden" name="searchType" value="${cri.searchType}" >
  <input type="hidden" name="keyword" value="${cri.keyword}" >
  <input type="hidden" name="writer" id="writer" value="${login.uid}"><!-- sessionID  -->
  
</form> 







<!-- 파일의 드래그 앤 드랍을 표현하는 부분. -->
<script>
    // 파일 리스트를 처리하는 템플릿 변수
    var template = Handlebars.compile($("#template").html());
    //원본이미지리 링크를 가져오는 템플릿 변수
    //var template_getImage = Handlebars.compile($("#template_getImage").html());
    
    $("#fileDrop").on("dragenter dragover",function(event){ 
        event.preventDefault();

      });
      
      $("#fileDrop").on("drop",function(event){
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
            //var html2 = template_getImage(fileInfo); // <img src="url">
            $(".uploadedList").append(html);           
            
            //content영역에 원본사진 추가하기.
            //$('#content').val($('#content').val() + html2+"<br>");
          } // end of success
        });
      });
      
      
      $(".uploadedList").on("click",".delbtn",function(event){ //사진 삭제
    	     event.preventDefault();   
      
    	     var that = $(this);
    	     console.log($(this).attr("href"));
    	     $.ajax({
    	      url:"/freeupload/deleteFile",
    	      type:"post",
    	      data:{fileName:$(this).attr("href")},
    	      dataType:"text",
    	      success:function(result){
    	         if(result=='deleted'){
    	        	 
    	        
    	        	 
    	            that.parent().parent("li").remove();
    	         }
    	      }// end of success
    	    });
    	     
    	});
      
   // form태그의 submit처리   
      $("#registerForm").submit(function(event){
    	  
        event.preventDefault();
        var that=$(this);
        var str="";
      
        $(".uploadedList .delbtn").each(function(index){
          str+="<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href")+"'>";
        });
        
        that.append(str);
        that.get(0).submit();
      }); 
</script>

</div> <!-- end of col md- 8 -->
<div class="col-md-2"></div> <!-- 오른쪽 md2 -->
</div><!-- end of row -->

</div>
</body>
</html>