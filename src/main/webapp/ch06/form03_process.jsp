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
						<%
							// 폼 페이지에서 입력된 데이터를 서버로 전송할 때 한글이 깨지지 않도록 문자 인코딩 유형을 "UTF-8"로 하여
							// request 내장 객체의 setCharacterEncoding() 메소드를 작성합니다.
							request.setCharacterEncoding("UTF-8");
							
							// 폼 페이지에서 입력된 아이디, 비밀번호, 이름, 핸드폰 번호, 성별, 취미, 소개 값을 얻어오도록 요청 파라미터
							// id, pw, name, phone, gender, hobby, comment로 getParameter() 메소드를 작성합니다.
							String id = request.getParameter("id");
							String pw = request.getParameter("pw");
							String name = request.getParameter("name");
							String phone1 = request.getParameter("phone1");
							String phone2 = request.getParameter("phone2");
							String phone3 = request.getParameter("phone3");
							String gender = request.getParameter("gender");
							String hobby1 = request.getParameter("hobby1");
							String hobby2 = request.getParameter("hobby2");
							String hobby3 = request.getParameter("hobby3");
							String comment = request.getParameter("comment");
							
							// 취미의 값을 한글(독서, 운동, 영화)로 변환
							if(hobby1 !=null){
								hobby1 = "독서";
							}
							if(hobby2 !=null){
								hobby2 = "운동";
							}
							if(hobby3 !=null){
								hobby3 = "영화";
							}
							
							if(gender.equals("M")){
								gender = "남자";
							} else {
								gender = "여자";
							}
						%>
						<p>아이디 : <%=id %></p>
						<p>비밀번호 : <%=pw %></p>
						<p>이름 : <%=name %></p>
						<p>연락처 : <%=phone1 %>-<%=phone2 %>-<%=phone3 %></p>
						<p>성별 : <%=gender %></p>
						<p>취미 : <%=hobby1 %> <%=hobby2 %> <%=hobby3 %></p>
						<p>자기소개 : <%=comment %></p>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>