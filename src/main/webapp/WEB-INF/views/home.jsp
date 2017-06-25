<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
<input type="hidden" name="cmd" value="_s-xclick">
<input type="hidden" name="hosted_button_id" value="FCTBVMYA4TEN6">
<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
<img alt="" border="0" src="https://www.paypalobjects.com/ko_KR/i/scr/pixel.gif" width="1" height="1">
</form>



<a href="/sboard/list">학생게시판</a> <br>
<a href="/user/login">로그인</a><br>
<a href="/user/signUp">회원가입</a><br>
<a href="/my/myPage">마이페이지</a><br>
<a href="/board/boardList">강사게시판</a><br>
<a href="/board/boardRegister">강사등록</a><br>

</body>
</html>
