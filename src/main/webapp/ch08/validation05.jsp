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
	                        <h1 class="page-title"><%=IndexRepository.getChapter("CH08") %></h1>
	                    </div>
	                </div>
	                <div class="col-lg-6 col-md-6 col-12">
	                    <ul class="breadcrumb-nav">
	                        <li><a href="/">INDEX</a></li>
	                        <li>CH08</li>
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
								1. 문자열 'a'로 시작 	-> ^a
								2. 숫자 9로 끝남		-> 9$
								3. 영소문자로 시작하고 'z'가 1번 이상 반복 -> ^[a-z]+z+
								4. 영대문자로 시작하고 '5'가 0번 이상 반복 ->
							 -->
							 <form action="validation05_process.jsp" method="post" name="member">
							 	아이디 : 	<input type="text" name="id" /><br/>
								비밀번호 :	<input type="text" name="pw"/><br/>
								이름 : 	<input type="text" name="name"/><br/>
								연락처 : 	<select name="phone1">
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="019">019</option>
										</select> -
										<input type="text" name="phone2" size="4" maxlength="4"/>-
										<input type="text" name="phone3" size="4" maxlength="4"/><br/>
								이메일 : <input type="text" name="email"/><br/>
								<input type="button" value="전송" onclick="CheckMember()"/><br/>
							 </form>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </section>
		<%@ include file="/pageModule/footer.jsp" %>
	
		<%@ include file="/pageModule/footerPart.jsp" %>
	</body>
	<script>
		// 정규 표현식 사용하기
		// - 정규 표현식은 특정한 규칙을 가진 문자열의 집합을 표현하는데 사용하는 형식으로 문자열의 특정 형태를 찾아내기 위해
		// 패턴으로 표현한 수식입니다.
		
		// i : ignore case, 문자열의 대문자와 소문자를 구별하지 않고 검증
		// g : global, 문자열 내의 모든 패턴을 검출
		// m : multi line, 문자열에 줄 바꿈 행이 있는지 검출
		function CheckMember(){
			// 아이디는 영문 대문자 소문자, 한글, 한글의 자음과 모음만 검사하도록 정규 표현식 작성
			let regExpId = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]*$/;
			// 비밀번호는 숫자만 검사하도록 정규 표현식을 작성
			let regExpPassword = /^[0-9]*$/;
			// 이름은 한글만 검사하도록 정규 표현식 작성
			let regExpName = /^[가-힣]*$/;
			// 전화번호는 전화번호 형태(숫자)인지 검사하도록 정규 표현식 작성
			let regExpPhone = /^\d{3}-\d{3,4}-\d{4}$/;
			// 이메일은 이메일 형식인지 검사하도록 정규 표현식 작성
			// 처음 시작이 숫자, 영소대문자이고 특수문자 -_/, 나올 수도 있고 안 나올수도 있고  그 다음에 숫자, 영소대문자가 나오는데
			// 특수문자와 숫자, 영소대문자 형태 그룹이 0개 이상이 나온다.
			// @를 기준으로 앞 입력 형식과 같으면서 0번 이상 반복될 수 있음
			// 마지막 텍스트에서 \.은 특수문자 .을 표현하기 위해 이스케이프로 .이 반드시 나와야 하고 영소대문자 2~3자리가 끝에 나온다.
			let regExpEmail
			= /^[0-9a-zA-Z]([-_/.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_/.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			
			let form = document.member;
			
			let id = form.id.value;
			let pw = form.pw.value;
			let name = form.name.value;
			let phone = form.phone1.value + "-" + form.phone2.value + "-" + form.phone3.value;
			let email = form.email.value;
			
			// test() : 매개변수 값으로 전달되는 문자열이 정규표현식에 부합한지 판단하여 true/false를 반환
			// 맞지 않으면 false, 맞으면 true -> 해당 결과를 !으로 뒤집어서 설정
			if(!regExpId.test(id)){
				alert("아이디는 문자로 시작해주세요!");
				form.id.select();
				return false;
			}
			if(!regExpPassword.test(pw)){
				alert("비밀번호는 숫자만 입력해주세요!");
				form.pw.select();
				return false;
			}
			if(!regExpName.test(name)){
				alert("이름은 한글만 입력해주세요!");
				form.name.select();
				return false;
			}
			if(!regExpPhone.test(phone)){
				alert("연락처 형식에 맞춰 입력해주세요!");
				return false;
			}
			if(!regExpEmail.test(email)){
				alert("이메일 형식에 맞춰 입력해주세요!");
				return false;
			}
			form.submit();
		}
	</script>
	</html>