<%@page import="kr.or.ddit.index.IndexRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.functions" prefix="fn"%>
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
		.greyText{
			color: lightgrey;
		}
		.title{
			font-size:13pt; font-weight:bold; text-align:center;
		}
		.greeting{
			color:black;font-weight:bold;
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
                    	<!-- 
                    		넘겨받은 데이터를 활용해 아래의 문제를 해결해주세요.
                    		----------------------------------------------
                    		1. 출력 결과 상단의 type에 따라 아래와 같이 출력해주세요.
                    		
                    		# 사용자인 경우,
                    		[사용자 '홍길동'님, 환영합니다!]
                    		
                    		# 관리자인 경우,
                    		[관리자 '홍길동'님, 환영합니다!]
                    		
                    		-----------------------------------------------
                    		2. 나머지 항목의 데이터를 출력해주세요.
                    		
                    		# 출력 결과
                    		아이디 : a001
                    		비밀번호 : 1234
                    		이름 : 홍길동
                    		핸드폰번호 : 010-1234-1234
                    		성별 : 남자
                    		취미 : 운동, 영화, 독서, 클라이밍
                    		가입인사 : 안녕하세요! 
                    				 반갑습니다!
                    				 잘 부탁합니다!
                    		-----------------------------------------------
                    		3. 출력의 형태를 selectbox를 통해 각 선택에 따른 출력으로 만들어주세요.
                    		
                    		# 출력 형태
                    		[ -- 출력 형태 선택 --]
                    		[  스크립틀릿으로 출력  ]
                    		[     JSTL로 출력    ]
                    		
                    		각 선택에 따른 출력 형태로 1,2번 문제에 나오는 출력 려과를 출력해주세요!
                    	 -->
                    	 
                    	 <select id="choose" style="width: 100%; text-align:center;">
                    	 	<option value="" selected>-선택해주세요-</option>
                    	 	<option value="scriptlet">스크립틀릿</option>
                    	 	<option value="JSTL">JSTL</option>
                    	 </select>
                    	 <br/><br/>
                    	 <%
	                    	 	String type = request.getParameter("type").equals("user")?"사용자":"관리자";
	                    	 	String name = request.getParameter("name");
	                    	 	String id = request.getParameter("id");
	                    	 	String pw = request.getParameter("pw");
	                    	 	String phone1 = request.getParameter("phone1");
	                    	 	String phone2 = request.getParameter("phone2");
	                    	 	String phone3 = request.getParameter("phone3");
	                    	 	String gender = request.getParameter("gender").equals("male")?"남자":"여자";
	                    	 	String hobby = "";
	                    	 	String[] hobbyArr = request.getParameterValues("hobby");
	                    	 	if(hobbyArr!=null){
		                    	 	for(int i =0; i<hobbyArr.length;i++){
		                    	 		switch(hobbyArr[i]){
			                    	 		case "development":
			                    	 			hobbyArr[i]="개발";
			                    	 			break;
			                    	 		case "book":
			                    	 			hobbyArr[i]="독서";
			                    	 			break;
			                    	 		case "movie":
			                    	 			hobbyArr[i]="영화감상";
			                    	 			break;
			                    	 		case "music":
			                    	 			hobbyArr[i]="음악감상";
			                    	 			break;
			                    	 		case "sports":
			                    	 			hobbyArr[i]="운동";
			                    	 			break;
		                    	 			default :
		                    	 		}
		                    	 		hobby += hobbyArr[i]+" ";
									}
	                    	 	}
	                    	 	String greeting = request.getParameter("greeting");
	                    	 %>
                    	 <table class="table table-bordered" id="table-scriptlet" style="display:none;">
                    	 	<tr>
                    	 		<td style="background-color: lightgrey;">
                    	 			<p class="title">스크립트 태그를 이용한 방법</p>
                    	 		</td>
                    	 	</tr>
                    	 	
                    	 	<tr>
                    	 		<td class="greyText">
                    	 			<p class="greeting"><%=type %> '<%=name %>'님, 환영합니다!</p>
                    	 			<p>타입 : <%=type %></p>
                    	 			<p>아이디 : <%=id %></p>
                    	 			<p>비밀번호 : <%=pw %></p>
                    	 			<p>이름 : <%=name %></p>
                    	 			<p>핸드폰번호 : <%=phone1 %> - <%=phone2 %> - <%=phone3 %> </p>
                    	 			<p>성별 : <%=gender %></p>
                    	 			<p>취미 : <%=hobby %></p>
                    	 			<p>가입인사 : </p>
                    	 			<p><%=greeting %></p>
                    	 		</td>
                    	 	</tr>
                    	 </table>
                    	 
                    	 <table class="table table-bordered" id="table-jstl" style="display:none;">
                    	 	<tr>
                    	 		<td style="background-color: lightgrey;">
                    	 			<p class="title">JSTL을 이용한 방법</p>
                    	 		</td>
                    	 	</tr>
                    	 	<tr>
                    	 		<td class="greyText">
                    	 			<c:choose>
                    	 				<c:when test="${param.type.equals('user') }">
                    	 					<c:set value="사용자" var="type"/>
                    	 				</c:when>
                    	 				<c:otherwise>
                    	 					<c:set value="관리자" var="type"/>
                    	 				</c:otherwise>
                    	 			</c:choose>
                    	 			<p class="greeting">${type } '${param.name }'님, 환영합니다!</p>
                    	 			<p>타입 : ${type }</p>
                    	 			<p>아이디 : ${param.id}</p>
                    	 			<p>비밀번호 : ${param.pw}</p>
                    	 			<p>이름 : ${param.name}</p>
                    	 			<p>핸드폰번호 : ${param.phone1 } - ${param.phone2 } - ${param.phone3 }</p>
                    	 			<p>성별 : 
                    	 				<c:choose>
                    	 					<c:when test="${param.gender.equals('male') }">
                    	 						남자
                    	 					</c:when>
                    	 					<c:otherwise>
                    	 						여자
                    	 					</c:otherwise>
                    	 				</c:choose>
                    	 			</p>
                    	 			<p>취미 : 
                    	 				<c:if test="${not empty paramValues.hobby }">
<%--                     	 				<c:if test="${fn:length(paramValues.hobby)>0 }"> --%>
<%-- 	                    	 				<c:forEach begin="0" end="${fn:length(paramValues.hobby) }" step="1" var="i"> --%>
<%-- 	                    	 					<c:choose> --%>
<%-- 	                    	 						<c:when test="${paramValues.hobby[i].equals('development') }">개발 </c:when> --%>
<%-- 	                    	 						<c:when test="${paramValues.hobby[i].equals('book') }">독서 </c:when> --%>
<%-- 	                    	 						<c:when test="${paramValues.hobby[i].equals('sports') }">운동 </c:when> --%>
<%-- 	                    	 						<c:when test="${paramValues.hobby[i].equals('movie') }">영화감상 </c:when> --%>
<%-- 	                    	 						<c:when test="${paramValues.hobby[i].equals('music') }">음악감상 </c:when> --%>
<%-- 	                    	 						<c:otherwise>${paramValues.hobby[i] } </c:otherwise> --%>
<%-- 	                    	 					</c:choose> --%>
<%-- 	                    	 				</c:forEach> --%>
	                    	 				<c:forEach items="${paramValues.hobby }" var="item">
	                    	 					<c:choose>
	                    	 						<c:when test="${item.equals('development') }">개발 </c:when>
	                    	 						<c:when test="${item.equals('book') }">독서 </c:when>
	                    	 						<c:when test="${item.equals('sports') }">운동 </c:when>
	                    	 						<c:when test="${item.equals('movie') }">영화감상 </c:when>
	                    	 						<c:when test="${item.equals('music') }">음악감상 </c:when>
	                    	 						<c:otherwise>${item } </c:otherwise>
	                    	 					</c:choose>
	                    	 				</c:forEach>
                    	 				</c:if>
                    	 			</p>
                    	 			<p>가입인사 : </p>
                    	 			<p>${param.greeting }</p>
                    	 		</td>
                    	 	</tr>
                    	 </table>
                    	 <script>
                    	 	document.addEventListener("DOMContentLoaded",function(){
                    	 		const select = document.querySelector("#choose");
                    	 		const tableScriptlet = document.querySelector("#table-scriptlet");
                    	 		const tableJSTL = document.querySelector("#table-jstl");
	                    	 	select.addEventListener("change",function(e){
	                    	 		e.preventDefault();
	                    	 		if(select.value === "scriptlet"){
	                    	 			tableScriptlet.style.display="";
	                    	 			tableJSTL.style.display="none";
	                    	 		} else if(select.value === "JSTL"){
	                    	 			tableJSTL.style.display="";
	                    	 			tableScriptlet.style.display="none";
	                    	 		} else{
	                    	 			tableScriptlet.style.display="none";
	                    	 			tableJSTL.style.display="none";
	                    	 			
	                    	 		}            	 			
	                    	 	})
                    	 	})
                    	 </script>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>












