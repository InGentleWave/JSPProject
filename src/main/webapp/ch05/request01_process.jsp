<%@page import="java.util.Map"%>
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
						<%
							// 폼에서 한글 입력을 정상적으로 처리할 때 필요합니다.
							// 폼 페이지에서 입력한 한글을 처리하도록 request 내장 객체의 setCharacterEncoding() 메소드의
							// 문자 인코딩 유형을 'UTF-8'로 작성합니다.
							request.setCharacterEncoding("UTF-8");
							
							// 0. getParameter() 메소드로 넘겨받은 파라미터 꺼내기
							// 입력된 아이디와 비밀번호를 폼 태그로부터 전송받도록 request 내장 객체의 getParameter() 메소드를 작성합니다.
							String userId = request.getParameter("id");
							String userPw = request.getParameter("pw");
							
							out.println("<h5>getParameter() 메소드로 출력</h5>");
							out.println("<p>아이디 : " + userId + "</p>");
							out.println("<p>비밀번호 : " + userPw + "</p>");
							out.println("<hr/>");
							
							// 1. getParameterNames() 메소드로 넘겨받은 파라미터 꺼내기
							// request로 넘어온 파라미터의 key(input 요소의 name 값)들을 꺼낸다.
							// Enumeration은 컬렉션 Set의 Iterator의 형태와 비슷하다.
							Enumeration<String> enumer = request.getParameterNames();
							
							out.println("<h5>getParameterNames() 메소드로 출력</h5>");
							// hasMoreElements() 메소드를 통해 키가 있는지 여부를 확인한다.
							while (enumer.hasMoreElements()){
								// nextElement() 메소드를 통해 키를 꺼낸다.
								String key = enumer.nextElement();
								String value = request.getParameter(key);
								out.println("<p>KEY : " + key + ", VALUE : "+value +"</p>");
							}
							out.println("<hr/>");
							
							// 2. getParameterMap() 메소드로 넘겹다은 파라미터 꺼내기
							out.println("<h5>getParameterMap() 메소드로 출력</h5>");
							// request로 넘어온 파라미터의 Key를 Map 타입을 꺼낸다.
							Map<String, String[]> paramMap = request.getParameterMap();
							// value 값으로 String[] 타입이 들어오므로 idx를 설정하여 값을 출력한다.
							out.println("<p>아이디 : " + paramMap.get("id")[0] + "</p>");
							out.println("<p>비밀번호 : " + paramMap.get("pw")[0] + "</p>");
							out.println("<hr/>");
						%>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>