<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@include file="include/header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<style>
#categoryImg ul {
list-style: none;
text-align:center;
}

#categoryImg li{
   width:100px;
   height:100px;
   display:inline;
   margin: 50px;
}
#categoryImg a{
   display:inline-block;
}
#categoryImg img{
   width:100px;
   height:100px;
}
#categoryImg img:hover{
   width:100px;
   height:100px;
   transform: rotate(10deg);
}
#categoryImg div{
   padding:10px;
   font-size:2em;
   color:black;
   font-weight:300;
}
#categoryImg div:hover{
   padding:10px;
   font-size:2em;
   font-weight:500;
}


/* 게시판 CSS */
.card {
   padding-top: 20px;
   margin: 10px 0 20px 0;
   background-color: rgba(214, 224, 226, 0.2);
   border-top-width: 0;
   border-bottom-width: 2px;
   -webkit-border-radius: 3px;
   -moz-border-radius: 3px;
   border-radius: 3px;
   -webkit-box-shadow: none;
   -moz-box-shadow: none;
   box-shadow: none;
   -webkit-box-sizing: border-box;
   -moz-box-sizing: border-box;
   box-sizing: border-box;
}

.card .card-heading {
   padding: 0 20px;
   margin: 0;
}

.card .card-heading.simple {
   font-size: 20px;
   font-weight: 300;
   color: #777;
   border-bottom: 1px solid #e5e5e5;
}




.card .card-heading.image img {
   display: inline-block;
   width: 46px;
   height: 46px;
   margin-right: 15px;
   vertical-align: top;
   border: 0;
   -webkit-border-radius: 50%;
   -moz-border-radius: 50%;
   border-radius: 50%;
}

.card .card-heading.image .card-heading-header {
   display: inline-block;
   vertical-align: top;
}

.card .card-heading.image .card-heading-header h3 {
   margin: 0;
   font-size: 14px;
   line-height: 16px;
   color: #262626;
}

.card .card-heading.image .card-heading-header span {
   font-size: 12px;
   color: #999999;
}

.card .card-body {
   padding: 0 20px;
   margin-top: 20px;
}

.card .card-media {
   padding: 0 20px;
   margin: 0 -14px;
}

.card .card-media img {
   max-width: 100%;
   max-height: 100%;
}

.card .card-actions {
   min-height: 30px;
   padding: 0 20px 20px 20px;
   margin: 20px 0 0 0;
}

.card .card-comments {
   padding: 20px;
   margin: 0;
   background-color: #f8f8f8;
}

.card .card-comments .comments-collapse-toggle {
   padding: 0;
   margin: 0 20px 12px 20px;
}

.card .card-comments .comments-collapse-toggle a, .card .card-comments .comments-collapse-toggle span
   {
   padding-right: 5px;
   overflow: hidden;
   font-size: 12px;
   color: #999;
   text-overflow: ellipsis;
   white-space: nowrap;
}

.card-comments .media-heading {
   font-size: 13px;
   font-weight: bold;
}

.card.people {
   position: relative;
   display: inline-block;
   width: 170px;
   height: 300px;
   padding-top: 0;
   margin-left: 20px;
   overflow: hidden;
   vertical-align: top;
}

.card.people:first-child {
   margin-left: 0;
}

.card.people .card-top {
   position: absolute;
   top: 0;
   left: 0;
   display: inline-block;
   width: 170px;
   height: 150px;
   background-color: #ffffff;
}

.card.people .card-top.green {
   background-color: #53a93f;
}

.card.people .card-top.blue {
   background-color: #427fed;
}

.card.people .card-info {
   position: absolute;
   top: 150px;
   display: inline-block;
   width: 100%;
   height: 101px;
   overflow: hidden;
   background: #ffffff;
   -webkit-box-sizing: border-box;
   -moz-box-sizing: border-box;
   box-sizing: border-box;
}

.card.people .card-info .title {
   display: block;
   margin: 8px 14px 0 14px;
   overflow: hidden;
   font-size: 16px;
   font-weight: bold;
   line-height: 18px;
   color: #404040;
}

.card.people .card-info .desc {
   display: block;
   margin: 8px 14px 0 14px;
   overflow: hidden;
   font-size: 12px;
   line-height: 16px;
   color: #737373;
   text-overflow: ellipsis;
}

.card.people .card-bottom {
   position: absolute;
   bottom: 0;
   left: 0;
   display: inline-block;
   width: 100%;
   padding: 10px 20px;
   line-height: 29px;
   text-align: center;
   -webkit-box-sizing: border-box;
   -moz-box-sizing: border-box;
   box-sizing: border-box;
}

.card.hovercard {
   position: relative;
   padding-top: 0;
   overflow: hidden;
   text-align: center;
   background-color: white;
}

.card.hovercard .cardheader {
   background: url("http://lorempixel.com/850/280/nature/4/");
   background-size: cover;
   height: 135px;
}

.card.hovercard .avatar {
   position: relative;
   top: -50px;
   margin-bottom: -50px;
}
.headerimg { width:100%; height:300px; overflow:hidden;  }

.card.hovercard .avatar img {
   width: 120px;
   height: 120px;
   max-width: 120px;
   max-height: 120px;
   -webkit-border-radius: 50%;
   -moz-border-radius: 50%;
   border-radius: 55%;
   border: 5px solid rgba(255, 255, 255, 0.5);
}

.card.hovercard .info {
   padding: 4px 8px 10px;
}

.card.hovercard .info .title {
   margin-bottom: 4px;
   font-size: 24px;
   line-height: 1;
   color: #262626;
   vertical-align: middle;
}

.card.hovercard .info .desc {
   overflow: hidden;
   font-size: 12px;
   line-height: 20px;
   color: #737373;
   text-overflow: ellipsis;
   white-space: nowrap;
   
}
.card.hovercard .info {
   height: 200px;
}

.card.hovercard .bottom {
   padding: 0 20px;
   margin-bottom: 17px;
}

.post-meta{
text-align: left;
list-style:none;
}

/* 게시판 CSS */

body{
overflow-x :hidden;
}

#boardButton{
width: 100%; 
height: 50px; 
background-color: white;
font-size: 20px;
font-style: oblique;
font-weight: bolder;
}

#boardButton:hover{
color: white;
background-color: #fc7700;
}

</style>
</head>
<body>
    <section id="home">
      <div class="home-pattern"></div>
      <div id="main-carousel" class="carousel slide" data-ride="carousel">
         <ol class="carousel-indicators">
            <li data-target="#main-carousel" data-slide-to="0" class="active"></li>
            <li data-target="#main-carousel" data-slide-to="1"></li>
            <li data-target="#main-carousel" data-slide-to="2"></li>
         </ol>
         <!--/.carousel-indicators-->
         <div class="carousel-inner">
            <div class="item active"
               style="background-image: url(${pageContext.request.contextPath}/resources/images/slider/slide3.jpg)">
               <div class="carousel-caption">
                  <div>
                     <h2 class="heading animated bounceInDown">누구나 강사가 될 수 있다?</h2>
                     <p class="animated bounceInUp">당신의 재능이 발휘되는 곳 , CloudClass </p>
                     <a class="btn btn-default slider-btn animated fadeIn" href="/board/boardRegister">재능 등록</a>
                  </div>
               </div>
            </div>
            <div class="item"
               style="background-image: url(${pageContext.request.contextPath}/resources/images/slider/slide2.jpg)">
               <div class="carousel-caption">
                  <div>
                     <h2 class="heading animated bounceInDown">내가 제안하는 강의와 취미!</h2>
                     <p class="animated bounceInUp">나에게 딱 맞는 C2C 교육서비스 , CloudClass</p>
                     <a class="btn btn-default slider-btn animated fadeIn" href="/sboard/register">강의 요청</a>
                  </div>
               </div>
            </div>
            <div class="item"
               style="background-image: url(${pageContext.request.contextPath}/resources/images/slider/slide1.jpg)">
               <div class="carousel-caption">
                  <div>
                     <h2 class="heading animated bounceInRight">취미 공유와 함께 늘어나는 인맥~</h2>
                     <p class="animated bounceInLeft">동네 친구와 친해지는 소소한 커뮤니티, CloudClass</p>
                     <a class="btn btn-default slider-btn animated bounceInUp"
                        href="/FreeBoard/list">커뮤니티</a>
                  </div>
               </div>
            </div>
         </div>
         <!--/.carousel-inner-->

         <a class="carousel-left member-carousel-control hidden-xs"
            href="#main-carousel" data-slide="prev"><i
            class="fa fa-angle-left"></i></a> <a
            class="carousel-right member-carousel-control hidden-xs"
            href="#main-carousel" data-slide="next"><i
            class="fa fa-angle-right"></i></a>
      </div>
   </section>
   <!-- home -->
   
   <section id="category" class="text-center" style="padding:0">
      <div>
         <div class="row">
            <div class="col-md-12" style="margin-top:100px;margin-bottom:100px">
               <div style="font-size:2em; font-weight: bold;">CATEGORY</div>
               <div>ㅡ</div>
               <div> 모든 강의,  CloudClass에 있습니다. </div>
               <br>
               <br>
               <div id="categoryImg">
               <ul>
                  <li><a href="/board/boardList"><img src="${pageContext.request.contextPath}/resources/images/category/trainning.png"><div>헬스</div></a></li>
                  <li><a href="/board/boardList"><img src="${pageContext.request.contextPath}/resources/images/category/chef.png"><div>요리</div></a></li>
                  <li><a href="/board/boardList"><img src="${pageContext.request.contextPath}/resources/images/category/coding.png"><div>프로그래밍</div></a></li>
                  <li><a href="/board/boardList"><img src="${pageContext.request.contextPath}/resources/images/category/dance.png"><div>댄스</div></a></li>
                  <li><a href="/board/boardList"><img src="${pageContext.request.contextPath}/resources/images/category/drone.png"><div>드론</div></a></li>
                  <li><a href="/board/boardList"><img src="${pageContext.request.contextPath}/resources/images/category/investment.png"><div>금융</div></a></li>
                  <li><a href="/board/boardList"><img src="${pageContext.request.contextPath}/resources/images/category/speach.png"><div>스피치</div></a></li>
                  <li><a href="/board/boardList"><img src="${pageContext.request.contextPath}/resources/images/category/dot.png"><div>etc</div></a></li>
               </ul>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- 카테고리 -->
     <section style="background-color: #d4d6d4" class="text-center">
      <div class="container">
         <div class="row">
            <div class="col-md-12">
             <div style="font-size:2em; font-weight: bold;">최근에 올라온 강의</div>
               <div>ㅡ</div>
               <div> 추천강의를 살펴보세요. </div>
				<c:forEach items="${list}" var="boardVO">
				 <div class="col-sm-4" id="box"> <!-- ### 강의 목록 멤버 ###-->
                  <a href="/board/boardRead?bno=${boardVO.bno}">
                        <div class="card hovercard" style="box-shadow: 0px 1px 1px #333;"> 
                           <div class="doyoen">
                              <img class="headerimg"
                                 src="/displayFile/board?fileName=${boardVO.coverImagePath}">
                           </div>
                           <div class="avatar">
                              <c:choose>
                              <c:when
                                 test="${boardVO.uimage eq null || boardVO.uimage ==''}">
                                 <img alt="" src="../resources/images/user/userBlank.png"
                                    class="img-circle userimage" >
                              </c:when>
                              <c:otherwise>
                                 <center>
                                    <img alt="" src="/displayFile/my?fileName=${boardVO.uimage}"
                                       class="img-circle userimage" >
                                 </center>
                              </c:otherwise>
                           </c:choose>
                              
                           </div> <!-- ## end of /avatar ## -->

                           <div class="info" style="color: #fc7700">
                              <div class="title">
                                 <h3>${boardVO.title}</h3>
                              </div>
                              <div class="desc">
                              <!-- ###### 컨텐츠 글씨 줄이기. <h>태그 없애면 default값으로 줄여진다.######-->
                                 ${boardVO.content}
                              </div>
                              <hr style="border: 0.5px solid gray; opacity: 0.5">
                              <!-- 게시판제목 -->
                              <ul class="post-meta" >
                                 <li><i class="fa fa-pencil-square-o"></i><strong>
                                               강사:</strong>${boardVO.writer}</li>
                                 <!-- 등록자이름 -->
                                 <li><i class="fa fa-clock-o"></i><strong>
                                               강의 등록일:</strong>${boardVO.regdate}</li>
                                 <!-- 등록 날짜 -->
                              
                                 <!-- ##### 수강생 현황 수정 할 것##### -->
                                 <li><i class="fa fa-user "></i><strong>
                                                수강생 현황:</strong>${boardVO.applynum}/${boardVO.number}</li>
                              </ul>
                           </div>
                        </div>
                  </a>
                         </div> <!-- end of div col-sm-4 -->
				</c:forEach>
            </div>
            <div class="col-sm-12">
            <br>
            <br>
            <button type="button" id="boardButton">다른 강의 보기</button>
            </div>
         </div>
      </div>
   </section>
   
   
   
   <section>
      <div class="container">
         <div class="row">
            <div class="col-md-12">
               <div class="text-center"><img src="${pageContext.request.contextPath}/resources/images/category.png"></div>
            </div>
         </div>
      </div>
   </section>
   <!-- 카테고리 그림 -->
  
   <%@include file="include/footer.jsp"%>
 
</body>

<script>
$("#boardButton").on("click",function(){
	location.href="/board/boardList";
});

</script>
</html>