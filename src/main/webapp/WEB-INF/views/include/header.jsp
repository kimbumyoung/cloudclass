<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<html lang="en">
<head>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <meta name="description" content="Creative One Page Parallax Template">
   <meta name="keywords" content="Creative, Onepage, Parallax, HTML5, Bootstrap, Popular, custom, personal, portfolio" />
   <meta name="author" content="">
   <title>모두의 강의, CloudClass</title>
   <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
   <link href="${pageContext.request.contextPath}/resources/css/prettyPhoto.css" rel="stylesheet">
   <link href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" rel="stylesheet">
   <link href="${pageContext.request.contextPath}/resources/css/animate.css" rel="stylesheet">
   <link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet">
   <link href="${pageContext.request.contextPath}/resources/css/responsive.css" rel="stylesheet">
   <!--[if lt IE 9]> <script src="js/html5shiv.js"></script>
   <script src="js/respond.min.js"></script> <![endif]-->
   <link rel="shortcut icon" href="images/ico/favicon.png">
   <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${pageContext.request.contextPath}/resources/images/ico/apple-touch-icon-144-precomposed.png">
   <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${pageContext.request.contextPath}/resources/images/ico/apple-touch-icon-114-precomposed.png">
   <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${pageContext.request.contextPath}/resources/images/ico/apple-touch-icon-72-precomposed.png">
   <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/resources/images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->
<body>
   <div class="preloader">
      <div class="preloder-wrap">
         <div class="preloder-inner">
            <div class="ball"></div>
            <div class="ball"></div>
            <div class="ball"></div>
            <div class="ball"></div>
            <div class="ball"></div>
            <div class="ball"></div>
            <div class="ball"></div>
         </div>
      </div>
   </div><!--/.preloader-->
   <header id="navigation">
      <div class="navbar navbar-inverse navbar-fixed-top" role="banner">
         <div class="container" style="vertical-align: text-bottom">
            <div class="navbar-header">
               <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                  <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
               </button>
               <!--<a class="navbar-brand" href="/"><h1><img style="width: 300px;height:auto" src="${pageContext.request.contextPath}/resources/images/logo5.png" alt="logo"></h1></a>-->
            </div>
            <div class="collapse navbar-collapse">
            <a class="navbar-brand" href="/"><h1><img style="width: 300px;height:auto" src="${pageContext.request.contextPath}/resources/images/logo5.png" alt="logo"></h1></a>
               <ul class="nav navbar-nav navbar-right" id="contents">
                  <li><a href="/">홈</a></li>
                  <li><a href="/intro">서비스 소개</a>
                  <li><a href="/board/boardList">강의 검색</a></li>
                  <li><a href="/board/boardRegister">강의 등록</a></li>
                  <li><a href="/sboard/list">강의 요청</a></li>
                  <li><a href="/FreeBoard/list">커뮤니티</a></li>
                  <c:if test="${login.uid==null}"><li><a href="/user/signUp">회원가입</a></li></c:if>
                  <c:if test="${login.uid != null}"><li><a href="/my/myPage">마이페이지</a></li></c:if>
                  <c:if test="${login.uid==null}"><li><a href="/user/login">로그인</a></li></c:if>
                  <li><a href="/contact">고객센터</a></li>
                  <c:if test="${login.uid != null}"><li><a href="/user/logout">로그아웃</a></li></c:if>
               </ul>
            </div>
         </div>
      </div><!--/navbar-->
   </header> <!--/#navigation-->
   <div style="height:70px;opacity: 0;">
   </div>

</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.isotope.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.prettyPhoto.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.parallax.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js"></script>
