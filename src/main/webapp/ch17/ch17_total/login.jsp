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
                        <h1 class="page-title">JSP 개요</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH01</li>
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
							1. 로그인 페이지를 작성하고 로그인을 진행해주세요.
							로그인
							───────────────────────
							아이디 : ________
							비밀번호 : _________
							[ 로그인  ]
							
							2. 회원가입이 없기 때문에 로그인 성공은 아래 계정으로 입력 시, 로그인 성공으로 간주합니다.
							login_process.jsp에서 총 3명의 회원정보를 초기화 후, 3명의 정보중 일치하면 로그인, 그렇지 않으면 로그인 실패
							로그인 처리는 login_process.jsp로 계정 정보를 넘겨 처리해주세요.
							- [회원]아이디 : a001, 비밀번호 : a1234 
							- [회원]아이디 : b001, 비밀번호 : b1234
							- [관리자]아이디 : admin, 비밀번호 : adm1234 
							
							3. 잘못된 계정 정보를 입력 후 로그인 진행 시,
							'아이디 및 비밀번호가 일치하지 않습니다.' 라는 알림창을 띄워주세요.
							───────────────────────
							[아이디 및 비밀번호가 일치하지 않습니다.]
							아이디 : ________
							비밀번호 : _________
							[ 로그인  ]
						 -->
						 <form method="post" action="./login_process.jsp">
							<c:if test="${sessionScope.loginErr != null && sessionScope.loginErr != '' }">
								<div class="alert alert-danger alertMsg" id="alertLogin">
									<p id="alertMsg">${sessionScope.loginErr }</p>
								</div>
								<script>
									document.querySelector('#alertLogin').style.display='block';
									setTimeout(function(){
										document.querySelector('#alertLogin').style.display='none';
									},3000);
								</script>
								<c:remove var="loginErr" scope="session"/>
							</c:if>
							아이디 : <input type="text" name="mem_id" class="form-control" required/> <br/>
							비밀번호 : <input type="text" name="mem_pw" class="form-control" required/> <br/>
							<input type="submit" class="btn btn-primary" value="로그인">
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