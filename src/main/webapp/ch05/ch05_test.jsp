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
						<!-- 
							문제)
							1. 아이디, 비밀번호, 이름, 성별, 핸드폰번호, 주소를 입력받을 form을 구성해주세요.
							2. 성별 항목의 데이터는 남자일 때 'M', 여자는 'G'의 값을 가질 수 있도록 설정해주세요.
							3. 입력된 데이터를 ch05_test_process.jsp로 전송 후 결과를 출력해주세요.
						 -->
						 <form action="ch05_test_process.jsp" method="post">
						 	아이디 : <input type="text" placeholder="아이디" name="id"/><br/>
						 	비밀번호 : <input type="text" placeholder="비밀번호" name="pw"/><br/>
						 	이름 : <input type="text" placeholder="이름" name="name"/><br/>
						 	성별 : 남자<input type="radio" value="M" name="gender"/>	여자<input type="radio" value="G" name="gender" /><br/>
						 	핸드폰번호 : <input type="text" placeholder="핸드폰번호" name="tel"/><br/>
						 	주소 : <input type="text" placeholder="주소" name="addr"/><br/>
						 	<input type="submit" value="전송">
						 </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>