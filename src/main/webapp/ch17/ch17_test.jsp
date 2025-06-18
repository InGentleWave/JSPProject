<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
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
							문제) OOO반 학생들의 각 성씨에 따른 인원수는 각각 몇명인지 작성해주세요.
							
							예) --------------------
							'홍'씨 성을 가진 사람 : oo명
							'유'씨 성을 가진 사람 : oo명
						 	'정'씨 성을 가진 사람 : oo명
						 	...
						 -->
						<h3>CH17 TEST</h3>
						<hr/>
						<table>
							<tr>
								<th>첫번째 방법 - JSTL과 카운팅 변수를 선언한 방법</th>
							</tr>
							<tr>
								<td>
									<c:set var="names" value="추승완 서강빈 김소희 송욱진 김형준 안철호 김예빈 윤미루 안주영 오형진 박영하 김경근 이하은 이유진 이우현 고준수 이상현 이재석 홍진호 김진영 신의용 김인섭 김지후"/>
									<p>
										전체학생 : <c:out value="${names }"/>
									</p>
									<c:set var="nameArr" value="${names.split(' ') }"/>
									<c:forEach begin="0" end="${fn:length(nameArr)-1}" step="1" var="i">
<%-- 										[${i+1}번째]이름 : <c:out value="${nameArr[i] }"/><span style="color:red;">('${fn:substring(nameArr[i],0,1) }'씨 Count 증가!)</span><br> --%>
									</c:forEach>
								</td>
							</tr>
						</table>
						<%
							List<String> list = new ArrayList<>();
							list.add("윤미루");
							list.add("김인섭");
							list.add("이우현");
							list.add("송욱진");
							list.add("오형진");
							list.add("김지후");
							list.add("박영하");
							list.add("김경근");
							list.add("신의용");
							list.add("김형준");
							list.add("이유진");
							list.add("이상현");
							list.add("김예빈");
							list.add("고준수");
							list.add("김소희");
							list.add("안철호");
							list.add("김진영");
							list.add("홍진호");
							list.add("이재석");
							list.add("서강빈");
							list.add("안주영");
							list.add("이하은");
							list.add("추승완");
							Map<String, Integer> map = new HashMap<String,Integer>();
// 							pageContext.setAttribute("map",new HashMap<String,Integer>());
						%>
						<c:set var="list" value="<%=list %>"/>
						<c:set var="map" value="<%=map %>"/>
						<!-- list의 모든 이름에 대해서 1회씩 수행-->
						<c:forEach items="${list }" var="name">
							<!-- 이름의 성을 fname 변수에 복사 -->
							<c:set value="${fn:substring(name,0,1) }" var="fname"/>
							<!-- 첫 추가 시 value값 -->
							<c:set var="entryValue" value="1"/>
							<!-- Map에 fname이 존재하는지 검사 -->
							<c:if test="${map.containsKey(fname) }">
								<!-- Map에 넣을 value값 수정(기존값 + 1) -->
								<c:set var="entryValue" value="${map.get(fname) + 1 }"/>
							</c:if>
							<!-- 첫 추가 시 1을, 기존 값 존재 시 기존값 + 1한 값을 Map에 넣기 -->
							<c:set target="${map}" property="${fname }" value="${entryValue}"/>
						</c:forEach>
						<table class="table table-bordered">
							<tr>
								<th>두번째 방법 - 컬렉션 map과 JSTL을 활용한 방법</th>
							</tr>
							<tr>
								<td>
									전체 학생 : <c:forEach items="${list }" var="name">${name } </c:forEach>
									<hr/>
									전체 학생 수 : <c:out value="${list.size() }"/> 명
								</td>
							</tr>
							<tr>
								<td>
									<c:forEach items="${map }" var="entry">
										<span style="color:red;">'${entry.key }'씨</span> 성을 가진 사람 수 : ${entry.value }명<br>
									</c:forEach>
								</td>
							</tr>
						</table>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>