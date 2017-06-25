<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/header.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cloud Class - 강의 요청</title>

<style>
.table {
   width: 100%;
}

</style>

<!-- SBOard 리스트 -->


</head>
<body>
   <!-- ########## 페이지 소개글 삽입. ########## -->

   <section id="portfolio">
      <div class="container" style="text-align: center">
         <!-- #####################컨테이너 시작######### -->
	  <div class="row text-center clearfix">
          <div class="col-sm-8 col-sm-offset-2">
               <h3 class="title-one">강의요청</h3>
               <hr style="border-top: 2px solid #fc7700">
               <br>
          </div>
      </div>

         <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
               <div class="input-group" style="margin-bottom: 30px">
                  <div class="input-group-btn" style="width: 20%">
                     <select name="searchType" class="form-control">
                        <option value="n"
                           <c:out value="${cri.searchType == null?'selected':''}" />>
                           ---</option>
                        <option value="t"
                           <c:out value="${cri.searchType eq 't'?'selected':''}" />>
                           제목</option>
                        <option value="c"
                           <c:out value="${cri.searchType eq 'c'?'selected':''}" />>
                           내용</option>
                        <option value="w"
                           <c:out value="${cri.searchType eq 'w'?'selected':''}" />>
                           작성자</option>
                        <option value="tc"
                           <c:out value="${cri.searchType eq 'tc'?'selected':''}" />>
                           제목 또는 내용</option>
                     </select>
                  </div>
                  <input class="form-control" type="text" name="keyword"
                     id="keywordInput" value='${cri.keyword}' placeholder="검색어를 입력하세요."> <span
                     class="input-group-btn"><button class="btn btn-default"
                        id='searchBtn'>검색</button></span> <span class="input-group-btn"><button
                        class="btn btn-default" id='newBtn'>글쓰기</button></span>
               </div>
            </div>
            <div class="col-md-2"></div>
         </div>





         <table class="table table-striped" style="text-align: center">
         <thead>
            <tr>
               <td style="width: 10%"><b>#</b></td>
               <td style="width: 40%"><b>제목</b></td>
               <td style="width: 15%"><b>요일</b></td>
               <td style="width: 15%"><b>작성자</b></td>
               <td style="width: 10%"><b>작성일</b></td>
               <td style="width: 10%"><b>조회</b></td>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="sboardVO">
               <tr>
                  <td>${sboardVO.bno}</td>
                  <td style="text-align: left"><a
                     href='/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${sboardVO.bno}'>
                        ${sboardVO.title} <c:if test="${sboardVO.replycnt>0}">[${sboardVO.replycnt}]</c:if>
                  </a></td>
                  <td>${sboardVO.hopedate}</td>
                  <td>${sboardVO.writer}</td>
                  <td><fmt:formatDate pattern="yyyy-MM-dd"
                        value="${sboardVO.regdate}" /></td>
                  <td>${sboardVO.viewcnt}</td>
               </tr>
            </c:forEach>
               </tbody>

         </table>
         <div>
            <ul class="pagination">
               <c:if test="${pageMaker.prev}">
                  <li><a
                     href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">&laquo;</a></li>
               </c:if>
               <c:forEach begin="${pageMaker.startPage}"
                  end="${pageMaker.endPage}" var="idx">
                  <li
                     <c:out value="${pageMaker.cri.page == idx?'class=active':''}"/>><a
                     href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
               </c:forEach>
               <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                  <li><a
                     href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">&raquo;</a></li>
               </c:if>
            </ul>
         </div>
      </div>
      <!-- #####################컨테이너 끝######### -->
   </section>
   <script>
      $(document).ready(
            function() {
               $('#searchBtn').on(
                     "click",
                     function(event) {
                        self.location = "list"
                              + '${pageMaker.makeQuery(1)}'
                              + "&searchType="
                              + $("select option:selected").val()
                              + "&keyword="
                              + $('#keywordInput').val();
                     });
               $('#newBtn').on("click", function(evt) {
                  self.location = "register";
               });
               $('#keywordInput').keydown(function(key) {
                  if (key.keyCode == 13) {// 검색창에서 enter치면 enter=13
                     $('#searchBtn').trigger('click');// 검색클릭
                  }
               });
            });
   </script>

</body>
</html>