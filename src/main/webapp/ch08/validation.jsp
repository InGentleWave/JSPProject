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
							input type button/submit은 아주 예전부터 익히 사용되어 왔던 대표적인 버튼 element입니다.
							브라우저 엔진 버전과 html 버전이 업그레이드 되면서 input type button/submit만이 대체할 수 없는 부분들이
							발견되어 새롭게 만들어진 태그가 button 태그입니다. input type button/submit은 end 태그로서의 활용이 어려워
							(</input>) CSS를 활용하여 또는 태그들을 활용하여 버튼을 꾸미는데 제약이 많이 걸렸다.
							button 태그는 몸체를 꾸밀 수 있다는 장점도 있어 CSS를 활용하는 건 물런 버튼 태그 내에 다야한 태그를 활용하여
							버튼을 꾸밀 수 있다.
							그리고 input type buoon에서 제공되는 click, submit 또한 제공된다.
							
							우리가 다양하게 사용하고 있는 버튼 이벤트들 중, submit이라는 이벤트는 기본적으로 form태그 내에 있는 input요소들의
							데이터를 읽어 action에 설정되어 있는 경로로 데이터를 보내주는 역할을 하는데, submit() 이벤트 자체만으로 본다면
							브라우저마다의 엔진별 특징이 조금씩 다릅니다.그리고 submit() 이벤트 자체에 컨트롤이 생각보다 어려운 것도 사실입니다.
							대표적으로는 브라우저의 엔진별 처리로직과 시점입니다.사용자가 사용하는 다양한 환경의 needs를 맞춰
							개발하기란 쉽지 않지만, 누ㅜ구나 사용가능한 공통적인 처리 로직을 구현하는 건 어렵지 않습니다.
							개발자들 사이에서 관계로 사용되는 내용들이 여기에도 포함됩니다. (ex, ServiceImpl에서 Impl은 인터페이스를
							implements 했다는 증거처럼 이벤트도 마찬가지 정해져 있는 나름 규격이 있다.)
							- input type submit버튼에는 onclick 요소를 활요하여 클릭 이벤트를 함께 주지 않는다.
								> click과 submit 이벤트의 시점과 브라우저 버전별, 엔진 처리 로직의 차이 때문
								
							# onsubmit 속성 이벤트 활용
							- onsubmit 이벤트는 모든 브라우저 지원
							- onsubmit = "return 함수명"으로 사용
								> return을 부여하는 건 해당 함수가 실행될 때,
								정상처리면 true/ 값의 필터에 의해 처리결과가 비정상적일 땐 false를 리턴합니다.
								> 이 때, submit 이벤트가 발생하지 않습니다. (결과가 false일 때)
								
							# onclick 속성 이벤트 활용
							- input type button의 onclick 속성의 요소를 활용
						 -->
						<form action="validation_process.jsp" method="post" id="testForm">
							아이디 : <input type="text" name="id" id="testId"/><br/>
							비밀번호 : <input type="text" name="pw" id="testPw"/><br/>
							<input type="submit" value="전송" id="testBtn"/><br/>
						</form>
						<!-- 자바스크립트 onsubmit 이벤트 -->
						<form action="validation_process.jsp" method="post" name="loginForm" onsubmit="return submitEvent()">
							아이디 : <input type="text" name="id" /><br/>
							비밀번호 : <input type="text" name="pw" /><br/>
							<input type="submit" value="전송"/><br/>
						</form>
						<!-- jQuery onsubmit 이벤트 -->
						<form action="validation_process.jsp" method="post" id="loginForm2">
							아이디 : <input type="text" name="id2" id="id2"/><br/>
							비밀번호 : <input type="text" name="pw2" id="pw2"/><br/>
							<input type="submit" value="전송"/><br/>
						</form>
						<!-- jQuery onsubmit 이벤트 -->
						<form action="validation_process.jsp" method="post" id="loginForm3">
							아이디 : <input type="text" name="id2" id="id3"/><br/>
							비밀번호 : <input type="text" name="pw2" id="pw3"/><br/>
							<input type="button" value="전송" id="sendBtn"/><br/>
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
	$("#testBtn").on("click", function(){
		let id = $("#testId").val();	// 아이디 값
		let pw = $("#testPw").val();	// 비밀번호 값
		
		// 조건문 작성법은 다양한 방법으로 작성할 수 있습니다.
		// 아이디가 입력되었는지 입력되지 않았는지를 체크하기 위해서 null과 공백 체크에 대한 조건문 작성은
		// if(id == null || id == "") of if(!id)와 같은 방법으로 작성할 수 있습니다.
		// 두 작성법에 속도 차이는 미미합니다. 단지, 가독성에 차이 말고는 없는 것이죠.
		// 하지만, 내가 비교할 조건의 대상을 명시적으로 작성하고자 한다면 전자의 방법으로 작성해야 합니다.
		// if(!id)는 null, 공백, undefined, NaN 등등을 체크합니다.
		if(id == null || id == ""){
			//!id는 null, NaN, undefined, ""를 필터링할 때 적합.
			//id == null || id == "" 은 null과 ""만 필터링할 때 적합.
			//!id는 가독성을 위해 주로 사용함.
			alert("아이디를 입력해주세요!");
			$("#testId").focus();
			// 이와 같은 return; 문은 boolean 타입의 true, false 값 중 default에 해당하는 false를 리턴하는 것처럼 보이지만,
			// 실제로는 'undefined'를 리턴합니다.
			// 그렇기 때문에 해당 함수를 종료하기 위한 false를 명확하게 리턴합니다.
			return false;
			// return; 은 undefined를 리턴하는 것임.
		}
		if(pw == null || pw == ""){
			$("#testPw").focus();
			alert("비밀번호를 입력해주세요!");
			return false;
		}
		
		$("#testForm").submit();
	})
	
	// 제이쿼리를 이용한 Form Element의 submit 이벤트 핸들링
	$("#loginForm2").on("submit",function(){
		let id = $("#id2").val();
		let pw = $("#pw2").val();
		
		if(id == null || id ==""){
			alert("아이디가 누락되었습니다.");
			return false;
		}
		
		if(pw == null || pw ==""){
			alert("비밀번호가 누락되었습니다.");
			return false;
		}
	})
	
	$("#sendBtn").on("click",function(){
		let id = $("#id3").val();	//	아이디 값
		let pw = $("#pw3").val();	//	비밀번호 값
		
		if(id == null || id == ""){
			alert("아이디가 누락되었습니다.");
			return false;
		}
		
		if(pw == null || pw ==""){
			alert("비밀번호가 누락되었습니다.");
			return false;
		}
		$("#loginForm3").submit();
	});
})

// 자바스크립트 onsubmit 이벤트
function submitEvent(){
	console.log("Submit Event..!");
	
	let id = document.loginForm.id.value;	// 아이디 값
	let pw = document.loginForm.pw.value;	// 비밀번호 값
	
	if(!id){
		alert("아이디가 누락되었습니다.");
		return false;
	}
	if(!pw){
		alert("비밀번호가 누락되었습니다.");
		return false;
	}
}
</script>
</html>