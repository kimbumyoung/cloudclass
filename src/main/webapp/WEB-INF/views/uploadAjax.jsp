<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.fileDrop {
   width: 100%;
   height: 200px;
   border: 1px solid black;
}

small {
   margin-left: 3px;
   font-weight: bold;
   color: gray;
}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>




</head>
<body>

   <h3>Ajax File Upload</h3>
   <div class="fileDrop"></div>
   <div class="uploadedList"></div>

   <script>
      $(".fileDrop").on("dragenter dragover", function(event) {
         event.preventDefault();
      });
 
      $(".fileDrop").on("drop", function(event) {
         event.preventDefault();

         var files = event.originalEvent.dataTransfer.files;

         var file = files[0];
         console.log(file);

          var formData = new FormData();

         formData.append("file", file);

         $.ajax({

            type :'post',
            url :'/uploadAjax',
            data : formData,
            dataType : 'text',
            processData : false,
            contentType : false,
            success : function(data) {
              var str = "";
  
              if(checkImageType(data)){
            	  str = "<div>"+"<a href='displayFile?fileName="+getImageLink(data)+"'>"+"<img src='displayFile?fileName="+data+"'/>"+getImageLink(data)+"</a><small data-src="+data+">X</small></div></div>";
              }else{
            	  alert("img 파일을 올려주세요")
            /* 	  str = "<div><a href='displayFile?fileName="+data+"'>"+getOriginalName(data)+"</a></div>"; */
              }
              
              $(".uploadedList").append(str);
            }

         }); 

      });
      
      $(".uploadedList").on("click","small",function(event){
    	  
    	  var that = $(this);
    	  
    	  
    	  $.ajax({
    		url:"deleteFile",
    		type:"post",
    		data:{fileName:$(this).attr("data-src")},
    		dataType:"text",
    		success:function(result){
    			if(result=='deleted'){
    				that.parent("div").remove();
    			}
    		}
    		
    	  
    		  
    	  });
    	  
    	  
    	  
      });
      
      function getOriginalName(fileName) {
    	  if(checkImageType(fileName)){
    		  return;
    	  }
    	  var idx = fileName.indexOf("_")+1;
    	  return fileName.substr(idx);
		
	}
      
      
      function checkImageType(fileName){
    	  var pattern = /jpg|gif|png|jpeg/i;
    	  return fileName.match(pattern);
      }
      
      function getImageLink(fileName) {
    	  
    	  if(!checkImageType(fileName)){
    		  return;
    	  }
    	  
    	  var font= fileName.substr(0,12);
    	  var end = fileName.substr(14);
    	  
    	  return font+end;
		
	}
      
      
      
   </script>
</body>
</html>