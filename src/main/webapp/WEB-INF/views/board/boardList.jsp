<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<html>
<head>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="/resource/js/jquery.dotdotdot.js"></script>
<%@include file="../include/header.jsp"%>

<style>
/* 부트 */
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
      /* background-color: rgba(214, 224, 226, 0.2); */
      background: white;
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


/* 부트 */
#imageBox {
   border: 1px solid black;
   position: relative;
}


.beaner {
  background: url("/resources/images/boardlist/bgex.png");
  height: 450px;
  background-size: 100% 100%;
  opacity: 0.8;
  
  
}

#headimg {
	font-size: 40px;
  	color: white;
  	font-weight: bold;
}
#headimg1 {
	font-size: 30px;
  	color: white;
  	font-weight: bold;
}

body{ 
  /*부트스트랩 그리드를 사용하면 어쩔수 없이 스크롤바가 생기므로 가로 스크롤바 없애기*/
  background: url("/resources/images/bgbgbg2.png");
  overflow-x : hidden;
  background-size: 100% 100%;
  
}

.post-meta{
/*강사, 강의등록일, 수강생현황 CSS*/

list-style:none;
}

.post-meta li{
/*강사, 강의등록일, 수강생현황 CSS*/
float:left; /*이거 안먹힌다 수정.*/

}

.img_button {
       
        background: url("/resources/images/button_search.png") no-repeat;
        background-position: center;
        border: none;
        width: 50px;
        height: 35px;
        background-color: lightgray;
        /* cursor: pointer; */
      
      }

#box{
  border-radius:10px;
  
  
}

#searchTitle1{
font-size: 30px;
font-weight: bold;
font-color: 
}

#searchTitle2{
font-size: 35px;
font-weight: bold;
color: #fc7700;
}

</style>
</head>
<!--/head-->
<body>
   <!-- ##### 상단 대형 배너 ##### -->
   <div class="beaner">
      <div class="row">
      	<div class="col-md-12" style="text-align: center; margin-top: 10%">
      		<span id="headimg">가지고 있는 재능을 나눠주세요 </span>
      </div>
      <div class="col-md-12" style="text-align: center;">
      		<span id="headimg1">배움으로 삶을 풍요롭게 해보세요 </span>
      </div>
      </div>
   </div>
   
   <div class="col-sm-12" style="background: white;"> <!-- seach section -->
   <br>
   
   <!-- ##### 검색창 ##### -->
   	
     <div class="row">
     	<div class="col-sm-12">
     	<div class="row">
     		<div class="col-sm-4"></div>
     		<div class="col-sm-4"><span id="searchTitle1">Class</span>&nbsp;<span id="searchTitle2">검색</span></div>
     		<div class="col-sm-4"></div>
     		
     	</div>
     	<br>
     	</div> 
     
       <div class="col-sm-4" ></div>
       <div class="col-sm-4" role="search">
         <div class="input-group" >
            <input type="text" name="keyword" id="keywordInput"
               value="${cri.keyword}" class="form-control"  placeholder="강의 검색 " >
                <span class="input-group-btn">
              <input type="button" class="img_button" id="searchBtn" >
                </span>
         <!--  <span class="input-group-btn"><button type="button" class="btn btn-default" id="searchBtn" >검색</button></span> -->
         </div>
       </div> <!-- ##### end of /col-md-4 ##### -->
       <div class="col-sm-4" ></div>
     </div> <!-- ##### end of /row ##### -->

<!-- ##### 카테고리 검색 ##### -->
<br>
   <div class="row" style="background: white;">
      <div class="col-sm-4"></div>
      <div class="col-sm-2">
           <select id="categoryType" name="categoryType" value="${cri.keyword}"
            class="form-control">
               <option value="de" <c:out value="${cri.categoryType == null?'selected':''}"/>>전체 카테고리</option>
               <option value="a" <c:out value="${cri.categoryType eq 'a'?'selected':''}"/>>헬스/필라테스</option>
            <option value="b" <c:out value="${cri.categoryType eq 'b'?'selected':''}"/>>주식투자</option>
            <option value="c" <c:out value="${cri.categoryType eq 'c'?'selected':''}"/>>메이크업</option>
            <option value="d" <c:out value="${cri.categoryType eq 'd'?'selected':''}"/>>영상편집</option>
            <option value="e" <c:out value="${cri.categoryType eq 'e'?'selected':''}"/>>영어</option>
            <option value="f" <c:out value="${cri.categoryType eq 'f'?'selected':''}"/>>스피치/발표</option>
            <option value="g" <c:out value="${cri.categoryType eq 'g'?'selected':''}"/>>파워포인트</option>
            <option value="h" <c:out value="${cri.categoryType eq 'h'?'selected':''}"/>>댄스</option>
            <option value="i" <c:out value="${cri.categoryType eq 'h'?'selected':''}"/>>프로그래밍</option>
            <option value="j" <c:out value="${cri.categoryType eq 'h'?'selected':''}"/>>디자인</option>
            <option value="k" <c:out value="${cri.categoryType eq 'h'?'selected':''}"/>>베이킹</option>
            <option value="l" <c:out value="${cri.categoryType eq 'h'?'selected':''}"/>>미술</option>
            <option value="m" <c:out value="${cri.categoryType eq 'h'?'selected':''}"/>>취업</option>
            <option value="n" <c:out value="${cri.categoryType eq 'h'?'selected':''}"/>>공예</option>
            <option value="o" <c:out value="${cri.categoryType eq 'h'?'selected':''}"/>>공연</option>
            <option value="p" <c:out value="${cri.categoryType eq 'h'?'selected':''}"/>>문서</option>
            </select>
      </div>
      
      <div class="col-sm-2" role="search">
            <select class="form-control" name="searchType" id="searchType" >
               <option value="n"
                  <c:out value="${cri.searchType ==null?'selected':''}"/>>최신순</option>
               <option value="nn"
                  <c:out value="${cri.searchType eq 'nn'?'selected':''}"/>>지난순</option>
               <option value="nnn"
                  <c:out value="${cri.searchType eq 'nnn'?'selected':''}"/>>참여자순</option>
            </select>
      </div>
      <div class="col-sm-4"></div>
        
   </div>
   <br>
   <br>
</div> <!-- seach section -->

   <section id="blog">

      <div class="container">
        
         <div class="row text-center clearfix">
            <div class="col-sm-8 col-sm-offset-2">
            <br>
               <h2 class="title-one">강의 목록</h2>
               <hr style="border-top: 2px solid #fc7700">
              
            </div>
         </div>
         
         <div class="container">
            <div class="row">
          
               <c:forEach items="${list}" var="boardVO">
                    <div class="col-sm-4" id="box"> <!-- ### 강의 목록 멤버 ###-->
                  <a href="/board/boardRead?bno=${boardVO.bno}&page=${pageMaker.cri.page}&perPageNum=${pageMaker.cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}" id="ss">
                  
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

                           <div class="info">
                              <div class="title">
                                 <h3>${boardVO.title}</h3>
                              </div>
                              <div class="desc">
                              <!-- ###### 컨텐츠 글씨 줄이기. <h>태그 없애면 default값으로 줄여진다.######-->
                                 ${boardVO.content}
                              </div>
                              <hr style="border: 0.5px solid gray; opacity: 0.5">
                              <!-- 게시판제목 -->
                              <ul class="post-meta">
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
         </div>
         
      </div>


   </section>
   
   <div style="text-align:center;">
      <ul class="pagination">
         <c:if test="${pageMaker.prev}">

            <li><a
               href="boardList?page=${pageMaker.startPage-1}&searchType=${cri.searchType}&keyword=${cri.keyword}&categoryType=${cri.categoryType}">&laquo;</a></li>
         </c:if>

         <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
            var="index">

            <li
               <c:out value="${pageMaker.cri.page == index?'class=active':''}"/>>
               <a
               href="/board/boardList?page=${index}&searchType=${cri.searchType}&keyword=${cri.keyword}&categoryType=${cri.categoryType}">${index}</a>
            </li>

         </c:forEach>

         <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
            <li><a
               href="boardList?page=${pageMaker.endPage+1}&searchType=${cri.searchType}&keyword=${cri.keyword}&categoryType=${cri.categoryType} ">&raquo;</a></li>
         </c:if>
      </ul>
   </div>


   <!--/#blog-->

   <script>

   $('#searchBtn').on("click",function(event){
     self.location ="boardList?page="+${cri.page}+"&perPageNum="+${cri.perPageNum}+"&searchType="+$("#searchType option:selected").val()+"&categoryType=" + $("#categoryType option:selected").val() +"&keyword="+$('#keywordInput').val();
     
  }); 
      
   </script>
   
   <script>
   $(function() {
       $('.card.hovercard').hover(
        function() {
           $(this).find('.headerimg').animate({scale:'+=0.1'}, 500);
        },
        function() {
        
           $(this).find('.headerimg').animate({scale:'-=0.1'}, 500);
        }
       );
      });
   </script>
   

    

</body>
</html>