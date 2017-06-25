<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

#title {
   margin-top: 100px;
}

#myImage {
   height: 260px;
   width: 80%;
}

.icon {
   color: #f4B99FF;
}

.textSet {
   font-size: 17px;
   font-weight: bold;
   color: #fc7700;
}

/*chat*/
.chat {
   list-style: none;
   margin: 0;
   padding: 0;
}

.head {
   background: white;
}

.chat li {
   margin-bottom: 10px;
   padding-bottom: 5px;
}

.chat li.left .chat-body {
   margin-left: 60px;
}

.chat li.right .chat-body {
   margin-right: 60px;
}

.chat li .chat-body p {
   margin: 0;
   color: #777777;
}

.chat li p {
   margin: 0;
   color: #777777;
}

.panel .slidedown .glyphicon, .chat .glyphicon {
   margin-right: 5px;
}

.panel-body {
   overflow-y: scroll;
   height: 300px;
}

::-webkit-scrollbar-track {
   -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
   background-color: #F5F5F5;
}

::-webkit-scrollbar {
   width: 12px;
   background-color: #F5F5F5;
}

::-webkit-scrollbar-thumb {
   -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, .3);
   background-color: #fc9f00;
}

</style>
</head>
<%@include file="../include/header.jsp"%>
<body style="background: url(/resources/images/bgbgbg2.png);background-repeat: no-repeat;background-size: 100% 100%;">

   <div class="container" style="background-color: white;box-shadow: 1px 1px 1px #333">

      <div class="row" style="border: 5px solid #FAFAFA">
         <div class="col-sm-4">
            <div class="row">
               <div class="col-sm-12 text-center">
                  <img src="../resources/images/user/userBlank.png" id="myImage" class="img-circle">
                  <hr>
                  <a href="kakaotalk" name="snsbtn"><img src="/resources/images/sns/kakaotalk.png" style="width:100px;height:auto;box-shadow: 1px 1px 1px #333"></a>
                  <a href="twitter" name="snsbtn"><img src="/resources/images/sns/twitter.png" style="width:100px;height:auto;box-shadow: 1px 1px 1px #333"></a>
                  <a href="facebook" name="snsbtn"><img src="/resources/images/sns/facebook.png" style="width:100px;height:auto;box-shadow: 1px 1px 1px #333"></a>   
               </div>
            </div>
         </div>
         <div class="col-sm-8">
            <div class="row">
               <div class="page-header">
                  <h1>
                     <small><span style="color: #4195f5" class="glyphicon glyphicon-cloud icon"></span>
                        &nbsp; &nbsp;</small>${boardVO.title }</h1>
               </div>

               <div class="col-sm-12">
                  <span class="glyphicon glyphicon-calendar icon"></span>&nbsp;&nbsp;<span
                     class="textSet">강의기간</span>&nbsp;&nbsp;&nbsp;
                  ${boardVO.dateStart} ~ ${boardVO.dateEnd}

               </div>
               <div class="col-sm-12">
                  <span class="glyphicon glyphicon-time icon"></span>&nbsp;&nbsp;<span
                     class="textSet">강의시간</span>&nbsp;&nbsp;&nbsp;
                  ${boardVO.lessonTimeStart} ~ ${boardVO.lessonTimeEnd}

               </div>
               <div class="col-sm-12">
                  <span class="glyphicon glyphicon-map-marker icon"></span>&nbsp;&nbsp;<span
                     class="textSet">강의지역</span>&nbsp;&nbsp;&nbsp;
                  ${boardVO.lesson_location}

               </div>
               <div class="col-sm-12">
                  <span class="glyphicon glyphicon-user icon"></span>&nbsp;&nbsp;<span
                     class="textSet">신청인원</span>&nbsp;&nbsp;&nbsp; 총
                  ${boardVO.number}명
               </div>
               <div class="col-sm-12">
                  <hr>
               </div>
               <div class="col-sm-12">
                  <h4>선착순 | 총 ${boardVO.number}명 | 현재 ${boardVO.applynum} 명 신청 완료!
                  </h4>
                  <div class="text-right">
                  <button type="button" id="meetingRequest" class="btn btn-warning" style="width:30%;background-color: #4195f5;border-color:#4195f5;box-shadow: 1px 1px 1px #333">신청하기</button>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <hr style="border:1px solid lightgrey">

      <div class="row boardContent" style="border: 5px solid #FAFAFA">
         <div class="col-sm-12 text-right">
            <c:if test="${boardVO.uid eq login.uid}">
               <button type="button" id="modifyBtn" class="btn btn-default" style="box-shadow: 1px 1px 1px #333">수정</button>
               <button type="button" id="removeBtn" class="btn btn-default" style="box-shadow: 1px 1px 1px #333">삭제</button>
            </c:if>
         </div>
         <div class="col-sm-12" style="margin: 0px">
           
             <span style="font-size: 25px; font-weight: bold;">강사 소개</span>
                 <hr style="border: 1px solid #fc7700">
               <pre style="background-color: white; margin-bottom: 0px">${boardVO.career}</pre>
         		<br>
           		<br>
                <span style="font-size: 25px; font-weight: bold;">강의 소개</span>
                 <hr style="border: 1px solid #fc7700">
               <pre style="background-color: white; margin-bottom: 0px" >${boardVO.content}</pre>
            
         </div>

         
   
         
         
         <input type="hidden" value="${login.uname}" id="replyer"> <input
            type="hidden" value="${boardVO.uid}" id="uid">


         <div class="col-sm-12">
            <div class="row">
				<br>
               <ul class="mailbox-attachments clearfix uploadedList"></ul>
               <!-- 사진내용UI -->
		
		<!-- chatUI -->
     
         <div class="col-sm-12">
             <br>
            <button type="button" id="chatStartBtn" class="btn btn-warning" style="box-shadow: 1px 1px 1px #333"> 채팅 문의 </button>
			

            <div class="row" id="chatWindow" style="display: none">
               <div class="col-md-12">
                  <div class="panel panel-primary">
                     <div class="panel-heading">
                        <span class="glyphicon glyphicon-comment"></span> 메시지
                        <div class="btn-group pull-right">
                           <button type="button"
                              class="btn btn-default btn-xs dropdown-toggle" id="chatExit">
                              <span class="glyphicon glyphicon-chevron-down"></span>
                           </button>
                        </div>
                     </div>
                     <div class="panel-body">
                        <ul class="chat">
                           <!-- chat 내용 -->


                        </ul>
                     </div>
                     <div class="panel-footer">
                        <div class="input-group">
                           <input id="btn-input" type="text" class="form-control input-sm"
                              name="chatInput" placeholder="메시지 입력" /> <span
                              class="input-group-btn">
                              <button class="btn btn-warning btn-sm" id="btn-chat">
                                 보내기</button>
                           </span>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <!-- chatUI -->
               <div class="page-header">
                  <h3>
                     <b>&nbsp;&nbsp;댓글</b>
                  </h3>
               </div>


               <ul id="treplies"></ul>
               <!-- 댓글내용UI -->

               <div class="row-fluid">
                  <!--  댓글 입력창 -->
                  <div class="col-md-10">
                     <div class="short-div" style="box-shadow: 1px 1px 1px #333">
                        <textarea class="form-control" placeholder="댓글 내용"
                           id="replytext" name="replytext"></textarea>
                     </div>
                  </div>
                  <div class="col-md-2">
                     <div class="box-footer">
                        <button type="button" class="btn btn-default" id="textinputbtn"
                           style="height: 50px;box-shadow: 1px 1px 1px #333">등록</button>
                     </div>
                  </div>
               </div>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
               <!--  댓글 입력창 -->



            </div>

         </div>

      </div>
   </div>
  </div>
   <div class="col-sm-12">
      <%@include file="../include/footer.jsp"%>
   </div>
   <form role="form" method="post">
      <input type="hidden" id="bnonum" value="${boardVO.bno}" name="bno">
      <input type="hidden" value="${cri.page}" name="page"> <input
         type="hidden" value="${cri.perPageNum}" name="perPageNum"> <input
         type="hidden" value="${cri.searchType}" name="searchType"> <input
         type="hidden" value="${cri.keyword}" name="keyword">
   </form>


   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
   <script type="text/javascript" src="/resources/js/upload.js"></script>
   <script id="templateAttach" type="text/x-handlebars-template"> 

   <li data-src='{{fullName}}' style="list-style: none">
   <div class="mailbox-attachment-info">
   <img src="{{imgsrc}}" class="thumbnail">
   </div>
   </li>

</script>

   <!-- ChatScript -->
   <script type="text/javascript"
      src="${pageContext.request.contextPath}/resources/js/sockjs.min.js"></script>

   <script>
    var ws = null;
   $("#chatStartBtn").on("click",function(){
      if('${login.uid}'){
         $("#chatStartBtn").hide();
         $("#chatWindow").show("slow");
         ws = new SockJS("http://220.67.235.150:8181/echo?other=${boardVO.uid}"); 
         
          ws.onopen = function () {

          };
             
             $('input[name=chatInput]').on('keydown', function(evt){
                  if(evt.keyCode==13){
                      message = {};
                      message.sender ='${login.uid}' ;
                      message.receiver='${boardVO.uid}';
                      message.messagecontent = $('input[name=chatInput]').val();
                      ws.send(JSON.stringify(message));
                      $('input[name=chatInput]').val('');
                  }
              });
             
             ws.onmessage = function (event) {
                 var data = (event.data).split(':');
                   var str ='';
                   if(data[0] == '${login.uid}'){
                      str = "<li class='right clearfix'><small class='text-muted'><span class='glyphicon glyphicon-time'></span>1 mins ago</small><p class='text-right'>"+data[1]+"</p></li>";
                   }
                   else{
                      str =  "<li class='left clearfix'><span class='chat-img pull-left'> <img src='http://placehold.it/50/55C1E7/fff&text=U' class='img-circle' /></span><div class='chat-body clearfix'><div class='header'><strong class='primary-font'>"+data[0]+"</strong> <small class='pull-right text-muted'><span class='glyphicon glyphicon-time'></span>12 mins ago</small></div><p>"+data[1]+"</p></div></li>";
                   }
                   
                    $('.chat').append(str);
                   $('.panel-body').scrollTop(9999999999999999);
             };
             

             
             $("#chatExit").on("click",function(){ //나가기 버튼을 눌르면 disconnect 함수 호출 
                  ws.onclose = onclose;
                  disconnect();
               });
                
               function disconnect(){ //소켓 해제 및 이벤트 처리
                  if(ws!=null){
                     $('.chat li').remove();
                     $('input[name=chatInput]').off('keydown');  //disconnect하면 keydown 이벤트 해제
                     $("#chatWindow").hide("slow");
                     $("#chatStartBtn").show("slow");
                     ws.close();
                  }
               };
               
      }else{
         alert("로그인 필수");
      }
         
      
   });
   
</script>
   <!-- ChatScript -->



   <!-- sns script -->
   <script>      
$(document).ready(function(){   
   $("a[name=snsbtn]").on('click',function(event){
      event.preventDefault();
      var snstype = $(this).attr("href");
      console.log(snstype);
      sendSns(snstype,'http://35.161.56.38:8080/cloudclass/','텍스트 테스트');
   });
});

function sendSns(sns, url, txt){
    var o;
    var _url = encodeURIComponent(url);
    var _txt = encodeURIComponent(txt);
    var _br  = encodeURIComponent('\r\n');
 
    switch(sns)
    {
        case 'facebook':
            o = {
                method:'popup',
                url:'http://www.facebook.com/sharer/sharer.php?u=' + _url
            };
            break;
 
        case 'twitter':
            o = {
                method:'popup',
                url:'http://twitter.com/intent/tweet?text=' + _txt + '&url=' + _url
            };
            break;
 
        case 'me2day':
            o = {
                method:'popup',
                url:'http://me2day.net/posts/new?new_post[body]=' + _txt + _br + _url + '&new_post[tags]=epiloum'
            };
            break;
 
        case 'kakaotalk':
            o = {
                method:'web2app',
                param:'sendurl?msg=' + _txt + '&url=' + _url + '&type=link&apiver=2.0.1&appver=2.0&appid=dev.epiloum.net&appname=' + encodeURIComponent('Epiloum 개발노트'),
                a_store:'itms-apps://itunes.apple.com/app/id362057947?mt=8',
                g_store:'market://details?id=com.kakao.talk',
                a_proto:'kakaolink://',
                g_proto:'scheme=kakaolink;package=com.kakao.talk'
            };
            break;
 
        case 'kakaostory':
            o = {
                method:'web2app',
                param:'posting?post=' + _txt + _br + _url + '&apiver=1.0&appver=2.0&appid=dev.epiloum.net&appname=' + encodeURIComponent('Epiloum 개발노트'),
                a_store:'itms-apps://itunes.apple.com/app/id486244601?mt=8',
                g_store:'market://details?id=com.kakao.story',
                a_proto:'storylink://',
                g_proto:'scheme=kakaolink;package=com.kakao.story'
            };
            break;
 
        case 'band':
            o = {
                method:'web2app',
                param:'create/post?text=' + _txt + _br + _url,
                a_store:'itms-apps://itunes.apple.com/app/id542613198?mt=8',
                g_store:'market://details?id=com.nhn.android.band',
                a_proto:'bandapp://',
                g_proto:'scheme=bandapp;package=com.nhn.android.band'
            };
            break;
 
        default:
            alert('지원하지 않는 SNS입니다.');
            return false;
    }
 
    switch(o.method)
    {
        case 'popup':
            window.open(o.url);
            break;
 
        case 'web2app':
            if(navigator.userAgent.match(/android/i))
            {
                // Android
                setTimeout(function(){ location.href = 'intent://' + o.param + '#Intent;' + o.g_proto + ';end'}, 100);
            }
            else if(navigator.userAgent.match(/(iphone)|(ipod)|(ipad)/i))
            {
                // Apple
                setTimeout(function(){ location.href = o.a_store; }, 200);          
                setTimeout(function(){ location.href = o.a_proto + o.param }, 100);
            }
            else
            {
                alert('이 기능은 모바일에서만 사용할 수 있습니다.');
            }
            break;
    }
}
</script>

   <!-- sns script -->

   <script>
 var bno =${boardVO.bno};
 var template = Handlebars.compile($("#templateAttach").html());
 
 getAllList(); // read 할시 모든 댓글 출력
 myImageShow(); //myImage 출력
 
 $.getJSON("/board/getAttach/"+bno,function(list){ //사진출력
   $(list).each(function() {
      var path = "board";
      var fileInfo =getFileInfo(this,path);
      
      var html = template(fileInfo);
      
      $(".uploadedList").append(html);
      
   });        
 });
 


function myImageShow() { //MyPage 이미지 보여주기 
   $.ajax({
      type:"get",
      url:"/my/uimageGet/"+$("#uid").val(),
      dataType:"text",
      success:function(uimage){
         console.log(uimage)
         var path = "my";
         var fileInfo =getFileInfo(uimage,path);
         console.log(fileInfo.imgsrc);
         $("#myImage").attr("src",fileInfo.imgsrc);
      }
   
   });
};

//댓글처리 
$("#textinputbtn").on("click",function(){
   
   var replyer = $("#replyer").val();
   var replytext = $("#replytext").val();
   
   console.log(replyer);
   console.log(replytext);
   
    $.ajax({
      type:"post",
      url:"/treplies/add",
      headers:{
         "Content-Type" : "application/json",
         "X-HTTP-Method-Override" : "POST"
      },
      dataType: 'text',
      data : JSON.stringify({
         bno : bno,
         replyer : replyer,
         replytext : replytext
      }),
      
      success : function(result){
         if(result =='SUCCESS'){
            console.log("성공");
            $("#replytext").val(" ");
            getAllList();
         }
      }
   }); 
   
});




function getAllList(){ //모든 댓글 출력
   
   $.getJSON("/treplies/all/" + bno, function(data) {
      
      var str = "";
      
      $(data).each(function(){         
         str+= "<li data-rno='"+this.rno+"' class='treplyli'><div class='timeline-item'><i class='fa fa-comments bg-blue'></i><span class='time'>" + " : "+this.replyer+"</span><h4 class='timeline-body form-control'><strong>"+this.replytext+"</strong></h4></div>";
         
         
         if($("#replyer").val() == this.replyer){
            
            str += "<button class='btn btn-default modifybutton' style='box-shadow: 1px 1px 1px #333'>수정</button> <button class='btn btn-default deletebutton' style='box-shadow: 1px 1px 1px #333'>삭제</button>";
         }
         str+="</li>"+"<li data-rno='"+this.rno+"'class='treplylimodify' hidden><div class='timeline-item'><i class='fa fa-comments bg-blue'></i><span class='time'>"+this.regdate+" : this.replyer</span><textarea class='form-control'>"+this.replytext+"</textarea></div><button class='btn btn-warning'>수정완료</button></li>";
      })
      $("#treplies").html(str);
   });
}


$("#treplies").on("click",".treplyli .modifybutton",function(){ //댓글 수정 보여주기

   $("#treplies").find(".treplyli").show();
   $("#treplies").find(".treplylimodify").hide();
   $(this).parent().hide();
   var rno = $(this).parent().attr("data-rno");
   $(this).parent().next().show("slow");
   
   
});

$("#treplies").on("click",".treplyli .deletebutton",function(){ //댓글 삭제

   var reply = $(this).parent();
   var rno = reply.attr("data-rno");
   
   $.ajax({
      
      type: "delete",
      url: "/treplies/"+rno,
      headers: {
      "Content-Type": "application/json",
      "X-HTTP-Method-Override": "DELETE",
      },
      dataType : "text",
      success: function(result){
         if(result=="SUCCESS"){
            getAllList();
         }
      }
      
   }); 
   
});


$("#treplies").on("click",".treplylimodify button",function(){ //댓글 수정 완료
   console.log("클릭확인완료");
   var reply = $(this).parent();
   var rno = reply.attr("data-rno");
   var replytext = reply.find("textarea").val();
   
   $.ajax({
   
      type: "PUT",
      url:"/treplies/"+rno,
      headers: {
         "Content-Type": "application/json",
         "X-HTTP-Method-Override": "PUT",
      },
      data: JSON.stringify({
         replytext : replytext
      }),
      dataType:"text",
      
      success: function(result) {
         
         if(result == "SUCCESS"){
            getAllList();
         }
      }
   });
});



//버튼 이벤트 처리
   var formObj = $("form[role='form']");

$("#removeBtn").on("click",function(){ //게시글 삭제
   
   $(".uploadedList li").each(function(index){
      $.post("/deleteFile/board",{fileName: $(this).attr("data-src")},function(){
         
      });
   });
   
   formObj.attr("action","/board/boardDelete");
   formObj.submit();
   
});

$("#modifyBtn").on("click",function(){ //게시글 수정
   
   formObj.attr("action","/board/boardModify");
   formObj.attr("method","get");
   formObj.submit();
});

/* 신청 서비스  */
 
$("#meetingRequest").on("click",function(){
   if('${login.uid}'){
      meetingRequestCheck();
   }
   else{
      alert("로그인 필수");
   }
   
});

function meetingRequestCheck(){ //이미 신청 했는지 체크

   $.ajax({
      url:"/board/meetingRequestCheck?bno="+${boardVO.bno}+"&uid=${login.uid}",
      type:"GET",
      dataType: "text",
      success: function(result){
         if(result){
            alert("이미 신청 하셨습니다.");
         }else{
            $(".boardContent").load("meetingRequest?bno="+'${boardVO.bno}');
         }
      }
   });
};


$("#myPageContent").load("messageShow");


/* 신청 서비스  */
</script>

</body>

</html>