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
                        <h1 class="page-title"><%=IndexRepository.getChapter("CH05") %></h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH05</li>
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
							// 헤더 정보는 여러 KEY를 가지고 다양한 정보를 제공합니다.
							// Refresh 응답 헤더는 페이지가 완전히 로드된 후 지정된 시간이 지나면 웹 브라우저가 페이지를 새로 고치거나
							// 리다이렉션 하도록 지시할 수 있습니다. HTML에서 사용하는 것과 동일합니다.
							
							// Refresh <meta http-equiv="refresh" content="...">와 같이 meta 태그를 활용해서 설정할 수 있다.
							// Refresh: '<time>','<time>, url=<url>','<time>; url=<url>'의 형태로도 활용할 수 있다.
							// ex) '5; url=http://example.com'
							// 위 형태를 사용하기 위해선 파라미터의 값이 int 타입이 아닌 문자열의 형태 이므로 setIntHeader()는 사용 불가
							
							// 5초마다 JSP 페이지가 갱신되도록 response 내장 객체의 setIntHeader() 메소드를 작성
							response.setIntHeader("Refresh",10);
						%>
						<!-- 5초마다 JSP 페이지가 갱신된 시작을 출력하도록 표현문 태그를 작성 -->
						<%=new java.util.Date() %>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>