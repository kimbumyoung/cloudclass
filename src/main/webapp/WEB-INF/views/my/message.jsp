<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

.chat
{
    list-style: none;
    margin: 0;
    padding: 0;
}

.head{

background: white;
}
.chat li
{
    margin-bottom: 10px;
    padding-bottom: 5px;

}

.chat li.left .chat-body
{
    margin-left: 60px;
}

.chat li.right .chat-body
{
    margin-right: 60px;
}


.chat li .chat-body p
{
    margin: 0;
    color: #777777;
}

.chat li p {
 	margin: 0;
    color: #777777;
}


.panel .slidedown .glyphicon, .chat .glyphicon
{
    margin-right: 5px;
}

.panel-body
{
    overflow-y: scroll;
    height: 700px;
}

::-webkit-scrollbar-track
{
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
    background-color: #F5F5F5;
}

::-webkit-scrollbar
{
    width: 12px;
    background-color: #F5F5F5;
}

::-webkit-scrollbar-thumb
{
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
    background-color: #fc9f00;
}
.userimage{
	width:50px;
	height: 50px;

}

</style>
</head>
<body>
    	<br>
    	<center style="font-size: 25px; font-weight: bold">메세지</center>
    	<hr style="border-top: 2px solid #fc7700; width: 50%"> 
<!-- 채팅 유저 목록  -->
    <div class="row" id="chatRoom" style="display: none; ">
        <div class="col-md-9">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <span class="glyphicon glyphicon-comment"></span>Message
                    <div class="btn-group pull-right">
                        <button type="button" class="btn btn-default btn-xs dropdown-toggle"  data-toggle="dropdown">
                            <span class="glyphicon glyphicon glyphicon-remove"></span>
                        </button>
                    </div>
                </div>
            <ul class="list-group" id="chatRoomList">
         
         
         	</ul>
            </div>
        </div>
     </div>
    <!--  채팅 유저 목록         -->
   
<!-- chatUI -->
    <div class="row" id="chatWindow" style="display:none">
        <div class="col-md-9">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <span class="glyphicon glyphicon-comment"></span> Message
                    <div class="btn-group pull-right">
                        <button type="button" class="btn btn-default btn-xs dropdown-toggle" id="chatExit">
                            <span class="glyphicon glyphicon-chevron-down"></span>
                        </button>
                    </div>
                </div>
                <div class="panel-body">
                    <ul class="chat">
                  
                    </ul>
                </div>
                
                <div class="panel-footer">
                    <div class="input-group">
                        <input id="btn-input" type="text" class="form-control input-sm" name="chatInput" placeholder="Type your message here..." />
                        <span class="input-group-btn">
                            <button class="btn btn-warning btn-sm" id="btn-chat">
                                Send</button>
                        </span>
                    </div>
                </div>
                
            </div>
        </div>
    </div> 
           
           
<!--  chatScript  -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/sockjs.min.js"></script>
<script>
   var userList =""; //채팅방 목록
   var noMessageCount =""; //메세지 개수 
   var imagePath="";
   
    userRoomShow();

   function userRoomShow(){
      $.ajax({ //채팅방 목록 출력 
         url: "/my/myMessageList/"+$("#uid").val(),
         type: "get",
         dataType: "text",
         success: function(result){
            userList = JSON.parse(result);
            console.log("t"+userList);
            noReadcount(); //개수를 가져온후 
         }
      });
   }
 
 function noReadcount(){ //메세지 개수 가져오기 
    $.ajax({ 
         url: "/my/noReadcount/"+$("#uid").val(),
         type: "get",
         dataType: "text",
         success: function(result){
            noMessageCount = JSON.parse(result); 
            userListShow(); //유저 출력 
            }
         
         });
   };
   
   function userListShow(){ //유저 리스트 보여주기 
	    var str="";
	    var other="";
	    
	    for(var i=0; i<userList.length; i++){
	         if($("#uid").val() == userList[i].receiver){
	            other= userList[i].sender;
	            console.log(other);
	            str+= "<li class='list-group-item'><label class='other'>"+other+"</label>";   
	         }else{
	            other = userList[i].receiver;
	            str+= "<li class='list-group-item'><label class='other'>"+other+"</label>";   
	         }
	         
	      for(var j=0; j<noMessageCount.length; j++){
	         if(other == noMessageCount[j].sender){
	            str += "<span class='badge' style='background-color:red'>"+noMessageCount[j].count+"</span>";
	         }
	       }
	      str+="</li>";
	    }
	      $("#chatRoom").show("slow");
	      $("#chatRoomList").html(str);
	      
	 }
   
   
 function messageCountReset(uid,sender){

   $.ajax({
      url:"/my/messageRead",
      type: "post",
      dataType: "text",
      data : {uid: uid, sender: sender},
      success: function(result){
         
      }
   
      }); 
   };
   
   
   function myImageCheck(other) { //MyPage 이미지 보여주기 
	    $.ajax({
	       type : "get",
	       url : "/my/uimageGet/"+other,
	       dataType : "text",
	       success : function(uimage) {
	          if (uimage) { //등록된 이미지가 있으면 
	        	  imagePath = "<img src='/displayFile/my?fileName="+uimage+"'class='img-circle userimage' >"
	          }
	          else{
	        	  imagePath+="<img src='../resources/images/user/userBlank.png' class='img-circle userimage'>";  /* 수정필요 */
	          }
	       }
	    });
	 };
	 
   
   
    $("#chatRoomList").on("click",".other",function(){ //채팅방 입장시
      $("#chatRoom").hide();
      $("#chatWindow").show("slow");
      
      var otherName = $(this).text(); //상대방 아이디
      myImageCheck(otherName);
      messageCountReset('${login.uid}',otherName); //메세지 초기화

       websock = new SockJS("http://220.67.235.150:8181/echo?other="+otherName); 
/*       websock = new SockJS("http://localhost:8080/echo?other=qjadud"); */
         websock.onopen = function () {

		};
          
         $('input[name=chatInput]').on('keydown', function(evt){
                    if(evt.keyCode==13){
                         message = {};
                         message.sender ='${login.uid}';
                         message.receiver= otherName;
                         message.messagecontent = $('input[name=chatInput]').val();
                         console.log(message);
                         websock.send(JSON.stringify(message));
                         $('input[name=chatInput]').val('');
                     }
             });
          
          websock.onmessage = function (event) {
        	  var data = (event.data).split(':');
        	  var str ='';
        	  if(data[0] == '${login.uid}'){
        		  str = "<li class='right clearfix'><small class='text-muted'><span class='glyphicon glyphicon-time'></span>1 mins ago</small><p class='text-right' style='font-weight: bold'>"+data[1]+"</p></li>";
        		 /* str = "<li class='right clearfix'><div class='chat-body clearfix'><div class='header'><small class='text-muted'><span class='glyphicon glyphicon-time'></span>13 mins ago</small><strong class='pull-right primary-font'>Bhaumik Patel</strong></div><p>"+data[1]+"</p></div></li>"; */
        	  }
        	  else{
        		  str =  "<li class='left clearfix'><span class='chat-img pull-left'>"+imagePath+"</span><div class='chat-body clearfix'><div class='header'><p>"+data[0]+"</p> <small class='pull-right text-muted'><span class='glyphicon glyphicon-time'></span>1 mins ago</small></div><strong class='primary-font'>"+data[1]+"</strong> </div></li>";
        	  }

              $('.chat').append(str);
		      $('.panel-body').scrollTop(9999999999999999);
              
          };
          
         
          $("#chatExit").on("click",function(){ //나가기 버튼을 눌르면 disconnect 함수 호출 
            websock.onclose = onclose;
            disconnect();
         });
          
         function disconnect(){ //소켓 해제 및 이벤트 처리
            if(websock!=null){
               /* $('#chatStatus').text('Info: connection closed.'); */
               $('.chat li').remove();
               $('input[name=chatInput]').off('keydown');  //disconnect하면 keydown 이벤트 해제
               $("#chatWindow").hide();
               userRoomShow(); 
               websock.close();
            }
         };
   }); 

/*   chatScript */

</script>     
      <!-- content UI -->


</body>
</html>