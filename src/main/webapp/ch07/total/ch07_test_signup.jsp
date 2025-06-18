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
    <style>
    	#alertDiv{
    		background-color: pink;
    		display : none;
    	}
    </style>
	<%@ include file="/pageModule/headPart.jsp" %>
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
							1. 회원가입 페이지를 작성해주세요.
							아이디 : _____________
							비밓번호 : _____________
							이름 : ______________
							성별 : ● 남자 ○ 여자
							프로필 이미지 : [ 파일선택 ]
							-----------------------
							[ 가입하기 ] [ 뒤로가기 ]
							
							2. 회원가입 정보를 입력 후, 가입하기 버튼을 클릭하면 ch07_test_signup_process.jsp로 이동하여
							   회원가입을 진행해주세요.
							
							3. 뒤로가기 버튼을 클릭 시, 로그인 페이지로 이동해주세요.
						-->
						<form action="./ch07_test_signup_process.jsp" onsubmit="return formSubmit(this)" method="post" enctype="multipart/form-data">
							<div class="alert alert-danger" id="alertDiv">
								<p id="alertMsg">파일 크기 초과로 인해 회원가입 실패했습니다.</p>
							</div>
							<div class="mb-3 row">
								<label for="id" class="col-sm-1 col-form-label">아이디</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="id" name="mem_id" required>
								</div>
							</div>
							<div class="mb-3 row">
								<label for="id" class="col-sm-1 col-form-label">비밀번호</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="pw" name="mem_pw" required>
								</div>
							</div>
							<div class="mb-3 row">
								<label for="id" class="col-sm-1 col-form-label">이름</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="name" name="mem_name" required>
								</div>
							</div>
							<div class="mb-3 row">
								<label for="gender" class="col-sm-1 col-form-label">성별</label>
								<div class="col-sm-11">
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="mem_sex" id="genderM" value="남자" checked="checked">
										<label class="form-check-label" for="genderM">남자</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="mem_sex" id="genderG" value="여자">
										<label class="form-check-label" for="genderG">여자</label>
									</div>
								</div>
							</div>
							<div class="mb-3 row">
								<label for="id" class="col-sm-1 col-form-label">프로필 이미지</label>
								<div class="col-sm-10">
									<input type="file" class="form-control" name="profileImg"/>
								</div>
							</div>
								<input class="btn btn-primary" type="submit" value="가입하기"/>
								<button type="button" class="btn btn-primary" onclick="location.href='./ch07_test_signin.jsp'">뒤로가기</button>
						</form>
						<c:set var ="errMsg" value="${sessionScope.errMsg }"></c:set>
						<c:if test="${errMsg != null && errMsg !='' }">
							<script>
								document.querySelector('#alertDiv').style.display='block';
								document.querySelector('#alertMsg').innerText="${errMsg}";
								setTimeout(function(){
									document.querySelector('#alertDiv').style.display='none';
									document.querySelector('#alertMsg').innerText='';
								},3000);
							</script>
							<c:remove var="errMsg" scope="session"/>
						</c:if>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>