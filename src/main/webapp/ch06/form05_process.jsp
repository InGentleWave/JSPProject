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
                        <h1 class="page-title"><%=IndexRepository.getChapter("CH06") %></h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH06</li>
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
						<table>
							<tr>
								<th>요청 파라미터 이름</th>
								<th>요청 파라미터 값</th>
							</tr>
							<%
								// 폼 페이지에서 입력된 데이터를 서버로 전송할 때 한글이 깨지지 않도록 문자 인코딩 유형을 "UTF-8"로 하여
								// request 내장 객체의 setCharacterEncoding() 메소드를 작성합니다.
								request.setCharacterEncoding("UTF-8");
								
								// 모든 입력 양식의 요청 파라미터 이름을 순서에 상관없이 Enumeration(열거형) 형태로 전달받음 
								Enumeration paramNames = request.getParameterNames();
								// Enumeration(열거형) 요소가 있으면 true를 반환하고, 그렇지 않으면 false를 반환
								// 전송된 요청 파라미터가 없을 때까지 반복
								while(paramNames.hasMoreElements()){
									// 폼 페이지에서 전송된 요청 파라미터의 이름을 가져옴
									String name = (String) paramNames.nextElement();
									out.println("<tr><td>"+name+ "</td>");
									
									// 폼 페이지에서 전송된 요청 파라미터의 값을 얻어옴
									String paramValue = request.getParameter(name);
									
									// name 이 hobby인 요소는 같은 name의 데이터가 여러 개 이므로 별도의 처리로 진행합니다.
									// getParameter("hobby")로 값을 꺼내면 여러 개의 데이터 중 1개의 데이터만 get
									// 그렇기 때문에 여러 개의 데이터를 꺼낼 수 있는 getParameterValues() 메소드로 꺼낸다.
									if(name.equals("hobby")){
										paramValue="";
										String[] hobbyArr = request.getParameterValues(name);
										for(int i =0; i<hobbyArr.length;i++){
											paramValue += hobbyArr[i]+" ";
										}
									}
									if(name.equals("gender")){
										String gender = request.getParameter("gender");
										if(gender.equals("M")){
											paramValue="남자";
										} else {
											paramValue="여자";
										}
									}
									out.println("<td>"+paramValue+"</td></tr>");
								}
								// 폼 페이지에서 입력된 아이디, 비밀번호, 이름, 핸드폰 번호, 성별, 취미, 소개 값을 얻어오도록 요청 파라미터
								// id, pw, name, phone, gender, hobby, comment로 getParameter() 메소드를 작성합니다.
								
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