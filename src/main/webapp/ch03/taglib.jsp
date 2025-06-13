<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="kr.or.ddit.index.IndexRepository"%>
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
                        <h1 class="page-title"><%=IndexRepository.getChapter("CH03") %></h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH03</li>
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
						<h1>1. JSTL 반복문(일반적인 for문)</h1>
						<p>변수 k가 1부터 10까지 1씩 증가하도록 JSTL의 Core 태그 반복문 작성</p>
						<p>
							결과 : <br/>
							<c:forEach begin="1" end="10" step="1" var="k">
								<c:out value="${k }"></c:out>
							</c:forEach>
						</p>
						
						<br/><hr/>
						
						<h1>2. 스크립틀릿과 표현문을 활용한 출력</h1>
						<p>스크립틀릿 영역 내, str 변수 선언 및 초기화 후 출력</p>
						<%
							String str = "스크립틀릿으로 선언한 개똥이";
						%>
						결과 : <%=str %>
						<br/><hr/>
						
						<h1>3. JSTL 저장 및 출력문</h1>
						<p>JSTL을 활용해 str 변수에 문자열을 저장 후, 출력</p>
						<c:set value="core태그로 선언한 개똥이" var="str"/>
						<c:out value="${str }"/>
						<br/><hr/>
						
						<h1>4. 스크립틀릿 표현문을 활용한 출력</h1>
						<p>스크립틀릿 여역 내, list 변수 선언 및 초기화 후 출력</p>
						<%
							List<String> list = new ArrayList<String>();
							list.add("개똥이");
							list.add("김철수");
							list.add("메뚜기");
						%>
						<%=list %>
						
						<h1>5. JSTL을 활용해 list 변수에 리스트 저장 후, 출력(향상된 for문 이용)</h1>
						<p>스크립틀릿 영역 내 선언된 list 데이터를 JSTL 반복문을 활용해 출력</p>
						<p>결과</p>
						<!-- 
							varStatus 속성 값
							- current : 반복되고 있는 현재 값
							- index : 반복되고 있는 현재의 index 값
							- count : 반복되고 있는 현재의 count 값
							- first : 반복 중, 첫번째 인지 여부
							- last : 반복 중, 마지막 인지 여부
							
						 -->
						<table class="table table-bordered">
							<tr>
								<td>index</td>
								<td>count</td>
								<td>value</td>
								<td>current</td>
								<td>first 여부</td>
								<td>last 여부</td>
							</tr>
							<c:forEach items="<%=list %>" var="item" varStatus="vs">
								<tr>
									<td>${vs.index }</td>
									<td>${vs.count }</td>
									<td>${item }</td>
									<td>${vs.current }</td>
									<td>${vs.first }</td>
									<td>${vs.last }</td>
								</tr>
							</c:forEach>
						</table>
						<br/><hr/>
						
						<h1>6. JSTL 조건문(if+else)</h1>
						<p>변수 k가 1부터 10까지 1씩 증가하도록 JSTL 반복문으로 출력(짝수일 때)</p>
						<p>
							<c:forEach begin="1" end="10" step="1" var="k">
								<c:if test="${k%2==0 }">
									<c:out value="${k }"/>
								</c:if>
							</c:forEach>
						</p>
						<br/><hr/>
						
						<h1>7. JSTL 조건문(if-else if-else)</h1>
						<p>현재 가지고 있는 money 금액에 따른 조건부 출력</p>
						<!-- 
							현재 내가 가진 돈이 5000원이다.
							현재 돈이 0원 이하면 잔액이 부족합니다.를 출력하고
							5000원보다 크거나 같고 10000원보다 작으면 커피 하잔의 여유 가능!
							그 이상이면 커피 말고 근사한 밥을 먹자!를 출력해봅시다.
						 -->
						 <c:set value="5000" var="money"/>
						<p>현재 금액 : ${money }</p>
						<p>
							<c:choose>
								<c:when test="${money <=0 }">
									잔액이 부족합니다.
								</c:when>
								<c:when test="${money >=5000 && money < 10000}">
									커피 한 잔의 여유 가능!
								</c:when>
								<c:otherwise>
									커피 말고 근사한 밥을 먹자!
								</c:otherwise>
							</c:choose>
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