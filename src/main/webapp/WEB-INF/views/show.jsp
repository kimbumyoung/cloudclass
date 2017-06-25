<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chat Room</title>
</head>
<body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/sockjs.min.js"></script>

<br>
<br>

<h1>Chat Room</h1>

<div id="chatMessage"></div>

	<div id='chatStatus'></div>
	<textarea name="chatMsg" rows="20" cols="50"></textarea>
	<p>
	메시지 입력 : <input type="text" name="chatInput">
 <script>
	
	 var ws = new SockJS("http://localhost:8181/echo"); 
	 	 
	    ws.onopen = function () {
	        $('#chatStatus').text('Info: connection opened.'); 
	        
	    };
	    
	    
	    $('input[name=chatInput]').on('keydown', function(evt){
            if(evt.keyCode==13){
                var msg = $('input[name=chatInput]').val();
                ws.send(msg);
                $('input[name=chatInput]').val('');
            }
        });
	    
	    ws.onmessage = function (event) {
	        $('textarea').append(event.data+'\n');
	    };
	    
	    ws.onclose = function (event) {
	        $('#chatStatus').text('Info: connection closed.');
	    };
</script> 
	
</body>
</html>