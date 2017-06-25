<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@include file="include/header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>contact</title>
<!-- 구글지도 -->
</head>
<body onload="initialize()">
   <section id="myMap" style="padding:0">
      <div class="row text-center">
         <div class="col-md-12" >
	<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3161.80365178372!2d127.00833431578218!3d37.583240979794766!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMzfCsDM0JzU5LjciTiAxMjfCsDAwJzM3LjkiRQ!5e0!3m2!1sko!2skr!4v1479980087708" width="100%" height="50%" frameborder="0" style="border:0" allowfullscreen></iframe>
         </div>
      </div>
   </section>
   <section id="contact">
      <div class="container">
         <div class="row text-center clearfix">
            <div class="col-sm-8 col-sm-offset-2">
               <div class="contact-heading">
                  <h2 class="title-one">문의하기</h2>
                  <p><b>무엇이든 자유롭게 문의해주세요!!</b></p><p><small>(단, 답변을 위해 메일을 정확히 입력)</small></p>
               </div>
            </div>
         </div>
      </div>
      <div class="container">
         <div class="contact-details">
            <div class="pattern"></div>
            <div class="row text-center clearfix">
               <div class="col-sm-6">
                  <div class="contact-address">
                     <address>
                        <p>
                           <span>Cloud</span>Class
                        </p>
                        <strong>서울 특별시 성북구 삼선동2가 389<br>
                           한성대학교 탐구관 204호
                        </strong><br> <small>( cloudclass 010-1234-5678 )</small>
                     </address>
                     <div class="social-icons">
                        <a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i
                           class="fa fa-twitter"></i></a> <a href="#"><i
                           class="fa fa-google-plus"></i></a><a href="#"><i
                           class="fa fa-dribbble"></i></a> <a href="#"><i
                           class="fa fa-linkedin"></i></a>
                     </div>
                  </div>
               </div>
               <div class="col-sm-6">
                  <div id="contact-form-section">
                     <div class="status alert alert-success" style="display: none"></div>
                     <h4><span class="glyphicon glyphicon-envelope"></span>E-MAIL</h4>
                     <form id="contact-form" class="contact" name="contact-form"
                        method="post">
                        <div class="form-group">
                           <input type="text" name="name" class="form-control name-field"
                              required="required" placeholder="이름">
                        </div>
                        <div class="form-group">
                           <input type="email" name="emailaddress"
                              class="form-control mail-field" required="required"
                              placeholder="이메일">
                        </div>
                        <div class="form-group">
                           <textarea name="message" id="message" required="required"
                              class="form-control" rows="8" placeholder="메시지"></textarea>
                        </div>
                        <div class="form-group">
                           <button type="submit" class="btn btn-primary">보내기</button>
                        </div>
                     </form>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!--/#contact-->
</body>
</html>