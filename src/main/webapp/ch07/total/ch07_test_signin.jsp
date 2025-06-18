<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>쉽게 배우는 JSP 웹 프로그래밍</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
	<%@ include file="/pageModule/headPart.jsp" %>
	<style>
		.alertMsg{
			display: none;
		}
	</style>
</head>
<body>
	<%@ include file="/pageModule/header.jsp" %>

    <div class="breadcrumbs" style="padding-top:40px;">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">파일 업로드</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH07</li>
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
                    	<!-- 
                    		1. 로그인 처리를 진행할 수 있도록 로그인 페이지를 작성해주세요.
                    			아이디 : _____________
                    			비밀번호 : ____________
                    			[ 로그인 ]  [ 회원가입 ]
                    		
                    		2. ch07_test_signin_process.jsp로 입력한 아이디, 비밀번호를 넘겨 로그인을 진행하세요.
                    		   이때, 입력한 계정 정보가 일치하지 않아 에러가 발생 시 에러 메세지를 로그인 페이지에서 출력해주세요.
                    	 -->
						<form method="post" action="./ch07_test_signin_process.jsp">
							<c:choose>
								<c:when test="${sessionScope.isSignUpSuccess != null && sessionScope.isSignUpSuccess != '' }">
									<div class="mb-3 row alertMsg" id="alertSignUp" style="background-color : lightgreen;">
										<p>회원가입 되었습니다.</p>
									</div>
									<script>
										document.querySelector('#alertSignUp').style.display='block';
										setTimeout(function(){
											document.querySelector('#alertSignUp').style.display='none';
										},3000);
									</script>
									<c:remove var="isSignUpSuccess" scope="session"/>
								</c:when>
								<c:when test="${sessionScope.loginMsg != null && sessionScope.errMsg != '' }">
									<div class="alert alert-danger alertMsg" id="alertLogin">
										<p id="alertMsg">${sessionScope.loginMsg }</p>
									</div>
									<script>
										document.querySelector('#alertLogin').style.display='block';
										setTimeout(function(){
											document.querySelector('#alertLogin').style.display='none';
										},3000);
									</script>
									<c:remove var="loginMsg" scope="session"/>
								</c:when>
							</c:choose>
							아이디 : <input type="text" name="mem_id" class="form-control" required/> <br/>
							비밀번호 : <input type="text" name="mem_pw" class="form-control" required/> <br/>
							<input type="submit" class="btn btn-primary" value="로그인">
						</form>
						<br/>
						<a href="./ch07_test_signup.jsp">회원가입</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>