<%@ page import="kr.or.ddit.index.IndexRepository" %>
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
						<!-- 
							문제)
							ch05_test.jsp에서 전송받은 모든 데이터를 taglib를 이용하여 출력해주세요.
							
							[예시]
							아이디 : a001
							비밀번호 : 1234
							이름 : 홍길동
							성별 : 남자
							핸드폰번호 : 010-1234-1234
							주소 : 대전시 중구 오류동 123
							
							[출력을 완료하였다면 5초 뒤에 www.naver.com 홈페이지로 이동시켜주세요]
							- 헤더 정보를 이용해도 좋습니다.
							- 스크립트를 이용해도 좋습니다.
							- 자유롭게!!
						 -->
					<!-- c:forEach 써먹기 위한 배열 변수 선언 및 pageContext에 저장하기 -->
						 <%
						 	String[] keys 	= { "아이디","비밀번호","이름" };
						 	String[] values = {	request.getParameter("id"),
						 						request.getParameter("pw"),
						 						request.getParameter("name") };
						 	pageContext.setAttribute("keys",keys);
						 	pageContext.setAttribute("values",values);
						 %>
						 <c:forEach begin="0" end="2" step="1" var="i">
						 	<p>${keys[i] } : ${values[i] }</p>
						 </c:forEach>
					<!-- c:choose로 성별 나타내기 -->
						 <p>성별 : 
						 	<c:choose>
						 		<c:when test="${param.gender.equals('M') }">남자</c:when>
						 		<c:otherwise>여자</c:otherwise>
					 		</c:choose>
						 </p>
					<!-- c:set후 EL표현식 사용 -->
						 <c:set value="${param.tel }" var="tel"/>
						 <p>핸드폰번호 : ${param.tel }</p>
					<!-- c:out으로 바로 출력하기 -->
						 <p>주소 : <c:out value="${param.addr }"/></p>
					<!-- 헤더 정보를 이용한 5초 후 리다이렉트 -->
<%-- 						 <% --%>
<!-- 					 	response.setHeader("Refresh","5; url=http://www.naver.com"); -->
<%-- 						 %> --%>
					<!-- 스크립트 DOMContentLoaded 이벤트 + setTimeout(function,time) 이용한 5초 후 리다이렉트 -->
						 <script>
						 	document.addEventListener("DOMContentLoaded",setTimeout(function(){
					 			window.location.href="http://www.naver.com";
					 		},5000));
						 </script>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>