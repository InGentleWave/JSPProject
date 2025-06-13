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
                        <h1 class="page-title"><%=IndexRepository.getChapter("CH04") %></h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH04</li>
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
						<p>
							자바빈즈란?
							- 자바 컴포넌트 모델의 표준<br/>
							- 동적 콘텐츠 개발을 위하 자바 코드를 사용하여 자바 클래스로 로직을 작성하는 방법<br/>
							- 즉, JSP 페이지에서 화면을 표현하기 위한 계산식이나 자료의 처리를 담당하는 자바 코드를 따로 분리하여 작성하는 것<br/>
							- ex) 데이터를 저장하기 위해 만든 VO 객체<br/>
							<br/>
							
							페이지 이동방식?<br/>
							1. 리다이렉트<br/>
							- 두개의 요청과 두개의 응답<br/>
							- 첫 요청 request의 url과 새롭게 요청되는 request의 url<br/>
							- 데이터를 주고받을 때 사용하는 scope : session<br/>
							<br/>
							2. 포워딩<br/>
							- 하나의 요청과 하나의 응답<br/>
							- 데이터를 주고받을 때 사용하는 scope : request, session<br/>
							<br/>
							<hr/>
							<br/>
							
							01. 자바빈즈<br/>
							JSP페이지의 주요 기능 중 하나는 데이터를 보여주는 것입니다. 하나의 JSP 페이지에 데이터를 보여주기 위한 자바<br/>
							코드와 단순히 화면을 출력하는 HTML 코드를 함께 작성하면 기능을 확장하거나 코드를 재사용하는데 어려움이 있습니다.<br/>
							따라서 프로그램의 효율을 높이기 위해 화면을 출력하는 부분과 데이터를 처리하는 로직 부분을 구분하여 작성하며, <br/>
							자바빈즈는 동적 컨텐츠 개발을 위해 자바 코드를 사용하여 자바 클래스로 로직을 작성하는 방법입니다.<br/>
							즉, JSP 페이지에서 화면을 표현하기 위한 계산식이나 자료의 처리를 담당하는 자바 코드를 따로 분리하며 작성하는 것이<br/>
							자바빈즈입니다.<br/>
							자바빈즈는 데이터 표현을 목적으로 하는 자바 클래스이므로 기존의 자바 클래스를 작성하는 방법과 동일하게 작성합니다.<br/>
							
							- VO와 같은 데이터를 저장할 클래스 공간에 해당한다.<br/>
							- 추후 스프링에서 데이터를 바인딩 할 때( 데이터를 받아낼 때 ) VO, 즉 자바빈즈 클래스 객체타입으로 데이터를 바로<br/>
							받아낼 수 있다.<br/>
							02. 페이지 이동방식<br/>
							1) forward (포워딩)<br/>
							<br/>
							예를 들어 게시판 등록 페이지를 요청한다고 가정합시다.<br/>
							요청 URL이 http://localhost/board/form.do 일때, 서버로 넘어간 요청(request)에 해당하는 최종 목적지<br/>
							가 있고 그 안에서 등록 폼에 해당하는 페이지를 요청하는 기능이 실행된다.<br/>
							요청 URL에 매핑되는 서버 내 리소스(/WEB-INF/views/board/form.jsp)는 보안 폴더에 해당하는<br/>
							"WEB-INF" 안에 있으므로 서버안에서 응답으로 나가야할 페이지를 찾아서 결과물을 만들고 응답을 브라우저쪽으로<br/>
							던져주는데, 이 과정이 페이지 이동방식 포워드이다.<br/>
							포워드는 서버로 들어온 요청(request)과 요청에 의한 처리가 완료 후 응답(response)으로 나가는 횟수가 각<br/>
							1개씩 존재한다. 만약에 서버로 들어올 때 데이터 1개 또는 2개 이상을 갖고 들어왔을 때 포워드는 새로운 요청이<br/>
							만들어져 응답으로 나가는 형태가 아니므로 같은 요청(request)객체를 활용하여 데이터를 담아 응답으로 내보낼 수 <br/>
							있고 처음에 들어온 데이터를 응답에서 또한 활용할 수 있다.<br/>
							<br/>
							22) redirect ( 리다이렉트 )<br/>
							<br/>
							예를 들어 게시판 등록 기능을 요청한다고 가정합시다.<br/>
							요청 URL이 http://localhost/board/insert.do일 때, 서버로 넘어간 요청(request)에 해당하는 <br/>
							최종 목적지( servlet )에 도착한다. 이때, 등록 기능에 대한 데이터 처리 후 페이지 이동방식을 선택하여 응답으로<br/>
							나가야 하는데, 응답으로 나갈 페이지가 데이터 처리 후 목록 화면이라고 가정 했을 때, 시스템이 알아서 브라우저로<br/>
							300번대 Ack 신호로 "데이터 처리 끝났고 목록 화면으로 넘어가라고 하는데 진짜 목록 화면으로 가?" 라고 묻는다.<br/>
							브라우저는 서버가 300번대로 준 신호에 "응! 나 목록 화면 가는거 맞고 내가 다시 요청 할게!"라고 하며 서버로<br/>
							새로운 요청 http://localhost/board/list.do를 요청하여 목록 화면을 달라고 서버로 요청한다.<br/>
							서버는 다시 들어온 새로운 요청(request)에 의해 목록 화면을 서버안에서 찾아 결과의 리소스를 만들어 응답으로<br/>
							내보낸다. 이때 최초 요청은 등록 기능을 가진 URL이엇지만 응답으로 나가는 건 목록을 요청할 때 사용하는 요청<br/>
							URL이 되고 응답 화면은 목록 화면이 나간다.<br/>
							<br/>
							*** 데이터 처리 후 포워딩을 진행한다면 어떻게 될까?<br/>
							데이터 처리 후 리다이렉트를 하지 않고 포워딩을 할 때 문제점은, 포워딩에 특징의 최초 요청이 URL이 고정되고<br/>
							선택된 응답 페이지가 결과로 나가기 때문에 다시 새로 고침을 할 경우 최초의 요청했던 기능을 담고 있는 URL이<br/>
							실행된다는 것입니다.<br/>
							그렇게 되면 반복적인 데이터 처리 요청이 서버로 날라가는 것이기 때문에 요청자가 끝내지 않는 한 무한반복으로<br/>
							데이터 처리의 대한 기능이 끝없이 요청될 수 있다. 그러므로 데이터 처리 후라면 페이지 이동방식은 포워딩이<br/>
							아닌 리다이렉트 처리로 마무리하도록 합니다!<br/>
						</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>