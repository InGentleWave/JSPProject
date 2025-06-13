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
								<th></th>
								<th>값</th>
								<th>설명</th>
							</tr>
							<!-- 
								# 클라이언트 IP
								- 0:0:0:0:0:0:0:1
								- IPv6(Internet Protocol version 6)의 루프백(LoopBack) 주소로 IPv4의 루프백 주소인
								  127.0.0.1과 같은 역할을 합니다.
								- 즉, 자기 자신을 가리키는 주소입니다.
							 -->
							<tr>
								<td width="20%">클라이언트 IP</td>							
								<td width="20%"><%=request.getRemoteAddr() %></td>							
								<td width="60%">웹 브라우저의 IP 주소를 가져옵니다.</td>							
							</tr>
							<!-- 
								# 요청 정보 길이
								- 요청 본문(Body) 영역에 포함되어 있는 데이터의 길이를 바이트 단위로 변환
								- 클라이언트가 서버로 전송한 데이터 본문 크기를 나타냄
							 -->
							<tr>
								<td>요청 정보 길이</td>
								<td><%=request.getContentLength() %></td>
								<td>웹 브라우저의 요청 본문의 길이를 가져옵니다.</td>
							</tr>
							<tr>
								<td>요청 정보 인코딩</td>
								<td><%=request.getCharacterEncoding() %></td>
								<td>웹 브라우저의 문자 인코딩을 가져옵니다.</td>
							</tr>
							<tr>
								<td>요청 정보 콘텐츠 유형</td>
								<td><%=request.getContentType() %></td>
								<td>웹 브라우저의 콘텐츠 유형을 가져옵니다.</td>
							</tr>
							<tr>
								<td>요청 정보 프로토콜</td>
								<td><%=request.getProtocol() %></td>
								<td>웹 브라우저의 요청 프로토콜을 가져옵니다.</td>
							</tr>
							<tr>
								<td>요청 정보 전송방식</td>
								<td><%=request.getMethod() %></td>
								<td>웹 브라우저의 HTTP 요청 메소드(GET,POST)를 가져옵니다.</td>
							</tr>
							<!-- 
								# 요청 URL
								- 프로토콜을 포함한 전체 주소
							 -->
							<tr>
								<td>요청 URL</td>
								<td><%=request.getRequestURL() %></td>
								<td>웹 브라우저의 요청한 URL 경로를 가져옵니다.</td>
							</tr>
							<!-- 
								# 요청 URI
								- 프로토콜과 도메인(ROOT)을 제외한 나머지 경로
							 -->
							<tr>
								<td>요청 URI</td>
								<td><%=request.getRequestURI() %></td>
								<td>웹 브라우저의 요청한 URI 경로를 가져옵니다.</td>
							</tr>
							<tr>
								<td>컨텍스트 경로</td>
								<td><%=request.getContextPath() %></td>
								<td>현재 JSP 페이지의 웹 애플리케이션 컨텍스트 경로를 가져옵니다.</td>
							</tr>
							<tr>
								<td>서버 이름</td>
								<td><%=request.getServerName() %></td>
								<td>서버 이름을 가져옵니다.</td>
							</tr>
							<tr>
								<td>서버 포트</td>
								<td><%=request.getServerPort() %></td>
								<td>실행 중인 서버 포트 번호를 가져옵니다.</td>
							</tr>
							<tr>
								<td>쿼리문(QueryString)</td>
								<td><%=request.getQueryString() %></td>
								<td>웹 브라우저의 전체 요청 파라미터 문자열[물음표(?) 다음 URL에 할당된 문자열]을 가져옵니다.</td>
							</tr>
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