<%@page import="kr.or.ddit.index.IndexRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
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
						<p>java 문자열 검색</p>
						<!-- 설정된 문자열에 검색 문자열 java가 포함되었는지 확인하도록 fn:contains 태그를 작성합니다. -->
						<p>Hello, Java Server Page! => ${fn:contains('Hello, Java Server Page!', 'java') }</p>
						<!-- 설정된 문자열에 검색 문자열 java가 포함되었는지 확인하도록 fn:containsIgnoreCase 태그를 작성합니다. -->
						<p>Hello, Java Server Page! => ${fn:containsIgnoreCase('Hello, Java Server Page!', 'java') }</p>
						
						<p>java 문자열 시작과 끝</p>
						<!-- 설정된 문자열 'Hello'가 문장의 시작인지 확인하도록 fn:startsWith 태그를 작성합니다. -->
						<p>Hello, Java Server Page! => ${fn:startsWith('Hello, Java Server Page!', 'Hello') }</p>
						<!-- 설정된 문자열 'Page!'가 문장의 끝인지 확인하도록 fn:endsWith 태그를 작성합니다. -->
						<p>Hello, Java Server Page! => ${fn:endsWith('Hello, Java Server Page!', 'Page!') }</p>
						
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>