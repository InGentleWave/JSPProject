<%@page import="java.util.Enumeration"%>
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
						<table class="table table-bordered">
							<tr>
								<th width="20%">헤더 KEY</th>
								<th>헤더 VALUE</th>
							</tr>
							<%
								// 모든 헤더 이름을 가져오도록 request 내장 객체의 getHeaderNames() 메소드를 작성하고
								// 이를 모두 저장하도록 Enumeration 객체 타입의 변수 en을 작성한다.
								Enumeration en = request.getHeaderNames();
							
								// Enumeration 객체 타입의 변수 en의 hasMoreElement() 메소드를 통해 저장된 헤더 이름이
								// 있을 때 까지 반복하도록 while 문을 작성함. 
								while(en.hasMoreElements()){
									// 현재 헤더 이름을 가져오도록 Enumeration 객체 타입의 변수 en의 nextElement()메소드를 작성함
									String headerName = (String)en.nextElement();
									// 설정된 헤더 이름의 값을 가져오도록 request 내장 객체의 getHeader()메소드를 작성함.
									String headerValue = request.getHeader(headerName);
									%>
									<!-- 
										현재 헤더 이름과 값을 출력하도록 표현문 태그를 작성합니다.
										출력정보는 해당 요청에 포함된 헤더 정보를 출력합니다.
									 -->
									<tr>
										<th><%=headerName %></th><td><%=headerValue %></td>
									</tr>
									<%
								}
								
								/*
									#User-Agent 정보
									[ 형태 : Mozilla 정보/버전 + 운영체제 정보 + 브라우저 렌더링 엔진 정보 + 브라우저 버전 정보]
									User-Agent는 위와 같이 사용자의 운영체제, 브라우저 정보 등을 가지고 있으므로 파일 다운로드,
									수집 정보 등을 핸들링 할 때 활용도가 높은 정보입니다.
									
									#Accept
									클라이언트가 서버로부터 어떤 ContentType(MimeType)의 데이터를 받을 수 있는지를
									서버에게 알려주는 역할을 합니다.
									즉, 클라이언트가 처리할 수 있는 데이터 형식을 서버에게 명시적으로 전달합니다.
									[ ex) Accept : text/html, application/xhtml+xml, application/xml;q=0.9...]
									- HTML 문서를 가장 선호하고 XHTML 문서를 다음 순서로 선호하고, XML 은 우선순위가 조금 하위... 등등
								*/
							%>
						</table>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>