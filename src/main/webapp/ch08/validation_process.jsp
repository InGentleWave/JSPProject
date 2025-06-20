<%@page import="kr.or.ddit.index.IndexRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>쉽게 배우는 JSP 웹 프로그래밍</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
	<%@ include file="/pageModule/headPart.jsp" %>
</head>
<body>
	<%@ include file="/pageModule/header.jsp" %>

    <div class="breadcrumbs" style="padding-top:40px;">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title"><%=IndexRepository.getChapter("CH08") %></h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH08</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <section class="about-us section">
        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-lg-12 col-md-12 col-12">
                    <div class="content-left wow fadeInLeft" data-wow-delay=".3s">
						<!-- 내용을 입력해주세요 -->
						<%
							String id = request.getParameter("id");
							String pw = request.getParameter("pw");
							String id2 = request.getParameter("id2");
							String pw2 = request.getParameter("pw2");
						%>
						<h3>Javascript 버전</h3>
						<p>아이디 : <%=id %></p>
						<p>비밀번호 : <%=pw %></p>
						<hr/>
						
						<h3>jQuery 버전</h3>
						<p>아이디 : <%=id2 %></p>
						<p>비밀번호 : <%=pw2 %></p>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
<script>
$(function(){
	$("#testBtn").on("click", function(){
		let id = $("#testId").val();	// 아이디 값
		let pw = $("#testPw").val();	// 비밀번호 값
		
		if(id == null || id == ""){
			alert("아이디를 입력해주세요!");
			return;
		}
		if(pw == null || pw == ""){
			alert("비밀번호를 입력해주세요!");
			return;
		}
		
		$("#testForm").submit();
	})
})
</script>
</html>