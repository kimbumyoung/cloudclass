<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cloud Class - 자유게시판</title>

<!-- 부트스트랩 cdn -->
<script>
$(document).ready(function(){
         $('#searchBtn').on("click",function(event){ // 검색 버튼 클릭 시
           
           self.location ="list" 
                             + '${pageMaker.makeQuery(1)}' //makeQuery는 검색 조건이 없는 상황에서 사용하는 메소드 
                             //?page=1&perPageNum=10
                             + "&searchType=" 
                             + $("select option:selected").val()
                             + "&keyword="
                             + $("#keywordInput").val();
         });
         
         $('#newBtn').on("click",function(evt){ //
             self.location ="register"; 
         });
    }); // end of document.ready()
</script>

<!-- ########## 스타일시트 설정. ########## -->
<style>
.table {
   width: 100%;
}

</style>
<!-- ########## 헤더페이지 삽입. ########## -->

</head>

<!--###################################################################### 자유게시판 리스트 -->



<body>

         
   <section id="portfolio"> <!-- ############ section쓰면 배경 회색됨 ############ -->
   <div class="container"> <!-- ################# 컨테이너 시작 #################### -->

   <!-- ########## 페이지 소개글 삽입. ########## -->
 	  <div class="row text-center clearfix">
          <div class="col-sm-8 col-sm-offset-2">
               <h3 class="title-one">커뮤니티</h3>
               <hr style="border-top: 2px solid #fc7700">
               <br>
          </div>
      </div>

      <!-- ################# 검색창 #################### -->
      <div class="row">
         <!-- 하나의 커다란 가로영역 선언 -->
         <div class="col-md-2"></div>
         <!-- 가운데 세로 8개 중에 왼쪽 세로 2개 영역 -->
         <div class="col-md-8" style="text-align: center">
            <!--  가운데 세로 8개 중에 가운데 세로 8개 영역 -->
            <div class="input-group " style="margin-bottom: 30px">
               <!-- 셀렉바/검색창/버튼 포함 div -->
               <div class="input-group-btn" style="width: 20%">
                  <!-- 셀렉바 div -->
                  <select class="form-control" id="select" name="searchType">
                     <option value="n"
                        <c:out value="${cri.searchType == null? 'selected':''}"/>>
                        -----</option>
                     <option value="t"
                        <c:out value="${cri.searchType eq 't'? 'selected':''}"/>>
                        제목</option>
                     <option value="c"
                        <c:out value="${cri.searchType eq 'c'? 'selected':''}"/>>
                        내용</option>
                     <option value="w"
                        <c:out value="${cri.searchType eq 'w'? 'selected':''}"/>>
                        작성자</option>
                     <option value="tc"
                        <c:out value="${cri.searchType eq 'tc'? 'selected':''}"/>>
                        제목 또는 내용</option>
                     <option value="cw"
                        <c:out value="${cri.searchType eq 'cw'? 'selected':''}"/>>
                        내용 또는 작성자</option>
                     <option value="tcw"
                        <c:out value="${cri.searchType eq 'tcw'? 'selected':''}"/>>
                        제목 또는 내용 또는 작성자</option>
                  </select>
               </div>
               <input type="text" class="form-control" name="keyword"
                  id="keywordInput" placeholder="검색어를 입력하세요." value='${cri.keyword}'>
               <span class="input-group-btn"><button
                     class="btn btn-default" id='searchBtn'>검색</button></span> <span
                  class="input-group-btn"><button class="btn btn-default"
                     id='newBtn'>글쓰기</button></span>
            </div>
         </div>
         <!--  가운데 세로 8개 중에 가운데 세로 8개 영역 닫음.-->
         <div class="col-md-2"></div>
         <!-- 가운데 세로 8개 중에 오른쪽 세로 2개 영역 -->
      </div>
      <!-- row끝 -->

      <!-- ########## 게시글을 출력하는 테이블 영역 ########## -->
      <table class="table table-striped" style="text-align: center">
         <thead >
            <tr>
               <td style="width: 10%"><b>#</b></td>
               <td style="width: 55%"><b>제목</b></td>
               <td style="width: 15%"><b>작성자</b></td>
               <td style="width: 10%"><b>작성일</b></td>
               <td style="width: 10%"><b>조회</b></td>
            </tr>
         </thead>
         <tbody >
            <c:forEach items="${list}" var="FreeBoardVO">
               <tr>
                  <td>${FreeBoardVO.bno}</td>
                  <td td style="text-align: left"><a
                     href='/FreeBoard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${FreeBoardVO.bno}'>${FreeBoardVO.title}<strong>&nbsp;[${FreeBoardVO.replycnt}]</strong></a></td>

                  <td>${FreeBoardVO.uname}</td>
                  <td><fmt:formatDate pattern="yyyy-MM-dd"
                        value="${FreeBoardVO.regdate}" /></td>
                  <td><span>${FreeBoardVO.viewcnt}</span></td>
               </tr>
            </c:forEach>
         </tbody>
      </table>





      <!-- ######### 페이지메이커 #########-->
      <div class="container" style="text-align: center">
         <ul class="pagination pagination-sm">
            <c:if test="${pageMaker.prev}">
               <li><a
                  href="list${pageMaker.makeSearch(pageMaker.startPage-1)}">&laquo;</a></li>
            </c:if>

            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
               var="idx">
               <li <c:out value="${pageMaker.cri.page == idx?'class=active':''}"/>>
                  <a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
               </li>
            </c:forEach>

            <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
               <li><a href="list${pageMaker.makeSearch(pageMaker.endPage+1)}">&raquo;</a></li>
            </c:if>
         </ul>
      </div>
      <!-- 페이지 메이커 div 닫음. -->

   </div>
   <!-- #################################################컨테이너 끝 --> </section>
</body>
</html>