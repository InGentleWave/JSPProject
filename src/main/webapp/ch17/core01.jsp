<%@page import="kr.or.ddit.index.IndexRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
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
                        <h1 class="page-title"><%=IndexRepository.getChapter("CH17") %></h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH17</li>
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
						<p>browser 변수 값 설정</p>
						<hr/>
						
						<!-- hd 변수에 변수 값으로 header를 설정하도록 태그르 작성 -->
						<c:set value="${header }" var="hd"/>
						User-Agent : <c:out value="${hd['User-Agent'] }"/><br/>
						Host : <c:out value="${hd['Host'] }"/><br/>
						Accept : <c:out value="${hd['Accept'] }"/><br/>
						Accept-Language : <c:out value="${hd['Accept-Language'] }"/><br/>
						Accept-Encoding : <c:out value="${hd['Accept-Encoding'] }"/><br/>
						Referer : <c:out value="${hd['Referer'] }"/><br/>
						Connection: <c:out value="${hd['Connection'] }"/><br/>
						
						<hr/>
						<!-- Header의 User-Agent 값을 따로 userAgent 변수에 저장한다. -->
						<c:set value="${header['User-Agent'] }" var="userAgent"/>
						userAgent : <c:out value="${userAgent }"/><br/>
						
						<p>browser 변수 값 제거 후</p>
						<c:remove var="userAgent"/>
						userAgent : <c:out value="${userAgent }"/><br/>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>