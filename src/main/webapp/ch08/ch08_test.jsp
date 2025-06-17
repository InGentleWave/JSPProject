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
                        <h1 class="page-title">유효성검사</h1>
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
						<!-- 
							문제 풀어보기
							아래 정규식을 풀어보고 통과 했다면 ch08_test_process.jsp로 전송하여 결과를 출력해주세요. 
							
							정규식 테스트 URL : https://regexr.com
						-->
                    	<h3>CH08 TEST</h3>
						<hr/>
						<form id="frm" action="./ch08_test_process.jsp" method="post">
							<div class="card">
								<div class="card-header">
									<h6>문제1) 숫자만 입력하되, 7-12자리까지만 입력 받을 수 있게 설정해주세요.</h6>
								</div>
								<div class="card-body">
									<input type="text" class="form-control" id="quest1" name="quest1"/>
								</div>
								<div class="card-footer">
									<p id="err_quest1">결과과 출력됩니다.</p>
								</div>
							</div>
							<br/>
							<div class="card">
								<div class="card-header">	
									<h6>문제2) 시작은 영소문자 'abc'고 영소대문자 8-12자리까지만 입력 받을 수 있게 설정해주세요.</h6>
								</div>
								<div class="card-body">
									<input type="text" class="form-control" id="quest2" name="quest2"/>
								</div>
								<div class="card-footer">
									<p id="err_quest2">결과과 출력됩니다.</p>
								</div>
							</div>
							<br/>
							<div class="card">
								<div class="card-header">	
									<h6>문제3) 아이디는 영소문자로 시작하고 영소문자,숫자 8~16자로 설정해주세요.</h6>
								</div>
								<div class="card-body">
									<input type="text" class="form-control" id="mem_id" name="mem_id"/>
								</div>
								<div class="card-footer">
									<p id="err_id">결과과 출력됩니다.</p>
								</div>
							</div>
							<br/>
							<div class="card">
								<div class="card-header">	
									<h6>문제4) 비밀번호는 영대문자로 시작하고 영문 대 소문자, 숫자, 특수문자 8~16자로 설정해주세요.(조건에 부합하는 문자들이 꼭 다 들어있지 않아도 됨)</h6>
								</div>
								<div class="card-body">
									<input type="text" class="form-control" id="mem_pw" name="mem_pw"/>
								</div>
								<div class="card-footer">
									<p id="err_pw">결과과 출력됩니다.</p>
								</div>
							</div>
							<br/>
							<div class="card">
								<div class="card-header">	
									<h6>문제5) 이름은 한글 2-5글자로 설정해주세요.</h6>
								</div>
								<div class="card-body">
									<input type="text" class="form-control" id="mem_name" name="mem_name"/>
								</div>
								<div class="card-footer">
									<p id="err_name">결과과 출력됩니다.</p>
								</div>
							</div>
							<br/>
							<div class="card">
								<div class="card-header">	
									<h6>
										문제6) 핸드폰번호는 아래의 형식에 맞춰 설정해주세요.<br/>
										첫번째 자리 : 011,016,017,019,070,010 만 가능하게 해주세요.<br/>
										두번째 자리 : 숫자 3자리 또는 숫자 4자리로 설정해주세요.<br/>
										세번째 자리 : 숫자 4자리로 설정해주세요.<br/>
										예시) 010-1234-1234, 016-123-1234
									</h6>
								</div>
								<div class="card-body">
									<input type="text" class="form-control" id="mem_phone" name="mem_phone"/>
								</div>
								<div class="card-footer">
									<p id="err_phone">결과과 출력됩니다.</p>
								</div>
							</div>
							<br/>							
							<p id="success"></p>
							<br/>
							<input type="button" class="btn btn-primary" onclick="success()" value="전송"/>
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
	const numArr = [0,0,0,0,0,0];
	function success(){
		let total=0;
		const pTag = document.querySelector("#success");
		for(let i = 0;i<numArr.length;i++){
			total += numArr[i];
		}
		if(total==6){
			pTag.innerText = "통과하셨습니다!";
		} else {
			pTag.innerText = "";
		}
	}
	document.querySelector("#quest1").addEventListener("focusout",function(){
		let regExpNum = /^\d{7,12}$/;
		let num = document.querySelector("#frm").quest1.value;
		let pTag = document.querySelector("#err_quest1");
		
		if(!regExpNum.test(num)){
			numArr[0]=0;
			pTag.style.color = "red";
			pTag.innerText = "숫자만 입력하되, 7-12자리까지만 입력 받을 수 있게 설정해주세요.";
		} else {
			numArr[0]=1;
			pTag.style.color = "green";
			pTag.innerText = "정상!";
		}
	})
	document.querySelector("#quest2").addEventListener("focusout",function(){
		let regExp = /^(abc)+[a-zA-Z]{5,9}$/;
		let str = document.querySelector("#frm").quest2.value;
		let pTag = document.querySelector("#err_quest2");
		if(!regExp.test(str)){
			numArr[1]=0;
			pTag.style.color = "red";
			pTag.innerText = "시작은 영소문자 'abc'고 영소대문자 8-12자리까지만 입력 받을 수 있게 설정해주세요.";
		} else {
			numArr[1]=1;
			pTag.style.color = "green";
			pTag.innerText = "정상!";
		}
	})
	document.querySelector("#mem_id").addEventListener("focusout",function(){
		let regExp = /^[a-z]{1}[a-z0-9]{7,15}$/;
		let str = document.querySelector("#frm").mem_id.value;
		let pTag = document.querySelector("#err_id");
		if(!regExp.test(str)){
			numArr[2]=0;
			pTag.style.color = "red";
			pTag.innerText = "아이디는 영소문자로 시작하고 영소문자,숫자 8~16자로 설정해주세요.";
		} else {
			numArr[2]=1;
			pTag.style.color = "green";
			pTag.innerText = "정상!";
		}
	})
	document.querySelector("#mem_pw").addEventListener("focusout",function(){
		let regExp = /^[A-Z][^가-힣|ㄱ-ㅎ|ㅏ-ㅣ|\s]{7,15}$/;
		let str = document.querySelector("#frm").mem_pw.value;
		let pTag = document.querySelector("#err_pw");
		if(!regExp.test(str)){
			numArr[3]=0;
			pTag.style.color = "red";
			pTag.innerText = "비밀번호는 영대문자로 시작하고 영문 대 소문자, 숫자, 특수문자 8~16자로 설정해주세요.";
		} else {
			numArr[3]=1;
			pTag.style.color = "green";
			pTag.innerText = "정상!";
		}
	})
	document.querySelector("#mem_name").addEventListener("focusout",function(){
		let regExp = /^[가-힣ㅏ-ㅣㄱ-ㅎ]{2,5}$/;
		let str = document.querySelector("#frm").mem_name.value;
		let pTag = document.querySelector("#err_name");
		if(!regExp.test(str)){
			numArr[4]=0;
			pTag.style.color = "red";
			pTag.innerText = "이름은 한글 2-5글자로 설정해주세요.";
		} else {
			numArr[4]=1;
			pTag.style.color = "green";
			pTag.innerText = "정상!";
		}
	})
	document.querySelector("#mem_phone").addEventListener("focusout",function(){
		let regExp = /^(01[01679]|070)-\d{3,4}-\d{4}$/;
		let str = document.querySelector("#frm").mem_phone.value;
		let pTag = document.querySelector("#err_phone");
		if(!regExp.test(str)){
			numArr[5]=0;
			pTag.style.color = "red";
			pTag.innerText = "핸드폰번호는 아래의 형식에 맞춰 설정해주세요. 첫번째 자리 : 011,016,017,019,070,010 만 가능하게 해주세요. 두번째 자리 : 숫자 3자리 또는 숫자 4자리로 설정해주세요. 세번째 자리 : 숫자 4자리로 설정해주세요. 예시) 010-1234-1234, 016-123-1234";
		} else {
			numArr[5]=1;
			pTag.style.color = "green";
			pTag.innerText = "정상!";
		}
	})
</script>
</html>