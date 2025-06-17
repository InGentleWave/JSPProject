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
							<h3>Javascript 버전</h3>
							<form action="validation_process.jsp" method="post" name="loginForm">
								아이디 : <input type="text" name="id" /><br/>
								비밀번호 : <input type="text" name="pw"/><br/>
								<input type="button" value="전송" onclick="CheckLogin()"/><br/>
							</form>
	
							<h3>jQuery 버전</h3>
							<form action="validation_process.jsp" method="post" id="loginForm2">
								아이디 : <input type="text" name="id2" id="id2"/><br/>
								비밀번호 : <input type="text" name="pw2" id="pw2"/><br/>
								<input type="button" value="전송" id="loginBtn"/><br/>
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
	$(function(){
		let loginBtn = $("#loginBtn");		// 로그인 버튼 Element
		let loginForm2 = $("#loginForm2");	// 로그인 폼 Element
		
		// 로그인 버튼 클릭 이벤트
		loginBtn.on("click",function(){
			let id = $("#id2").val();		// 아이디 값
			let pw = $("#pw2").val();		// 비밀번호 값
			
			// 아이디는 영소문자만 입력 가능하도록 설정
			for(let i = 0;i<id.length;i++){
				let ch = id.charAt(i);

				//ASCII CODE
				// 0 : 52, 9 : 61, A : 65, Z : 90, a : 97, z : 122
				// 영소문자에 해당하는 ASCII CODE 값의 범위를 설정한다.
				if(!(ch >= 'a' && ch<= 'z')){
					alert("아이디는 영문 소문자로만 입력 가능합니다!");
					$("#id2").select();
					return false;
				}
			}
		
			
			// 비밀번호는 숫자만 입력 가능하도록 설정
			// 숫자가 아닌 값을 입력 시, true
			if(isNaN(pw)){
				alert("비밀번호는 숫자로만 입력 가능합니다!");
				$("#pw2").select();
				return false;
			}
			
			loginForm2.submit();			// 폼 페이지에서 입력한 데이터를 서버로 전송합니다.
		});
	})
	function CheckLogin(){
		let form = document.loginForm;	//	loginForm Element
		
		// 아이디는 영소문자만 입력 가능하도록 설정
		for(let i = 0;i<form.id.value.length;i++){
			let ch = form.id.value.charAt(i);
			
			//ASCII CODE
			// 0 : 52, 9 : 61, A : 65, Z : 90, a : 97, z : 122
			// 영소문자에 해당하는 ASCII CODE 값의 범위를 설정한다.
			if(!(ch >= 'a' && ch<= 'z')){
				alert("아이디는 영문 소문자로만 입력 가능합니다!");
				form.id.select();
				return false;
			}
		}
		// 비밀번호는 숫자만 입력 가능하도록 설정
		// 숫자가 아닌 값을 입력 시, true
		if(isNaN(form.pw.value)){
			alert("비밀번호는 숫자로만 입력 가능합니다!");
			form.pw.select();
			return false;
		}
		
		form.submit();
	}
	</script>
	</html>