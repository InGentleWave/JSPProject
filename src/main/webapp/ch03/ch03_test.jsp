<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
						<!-- 
							문제 풀어보기)
							1) 리스트에 306호 반 학생 이름을 모두 넣고 Core 태그를 이용해서 전체를 출력해주세요.
							2) 전체 출력을 4명씩 끊어서 출력해주세요.
								이름 이름 이름 이름
								이름 이름 이름 이름
								이름 이름 이름 이름
								...
							3) 4명씩 끊어서 출력할 때, 본인의 이름은 '본인'으로 출력해주세요.
								'본인' 글자를 출력 시, 굵은 글씨와 색깔은 녹색으로 출력해주세요!
								이름 이름 이름 이름
								이름 이름 이름 본인
								이름 이름 이름 이름
								...
						 -->
						<%
							List<String> list = new ArrayList<>();
							list.add("신의용");
							list.add("김지후");
							list.add("이유진");
							list.add("이우현");
							list.add("고준수");
							list.add("이상현");
							list.add("이재석");
							list.add("홍진호");
							list.add("김진영");
							list.add("안철호");
							list.add("김예빈");
							list.add("윤미루");
							list.add("안주영");
							list.add("오형진");
							list.add("박영하");
							list.add("김경근");
							list.add("이하은");
							list.add("추승완");
							list.add("서강빈");
							list.add("김소희");
							list.add("송욱진");
							list.add("김형준");
							list.add("김인섭");
						%>
						<h3>306호 전체 인원(<c:out value="<%=list.size()%>"/>명)</h3>
						<%=list %>
<!-- 						<p>[ -->
<%-- 							<c:forEach items="<%=list %>" var="item" varStatus="vs"> --%>
<%-- 								<c:choose> --%>
<%-- 									<c:when test="${!vs.last }"> --%>
<%-- 										${item },  --%>
<%-- 									</c:when> --%>
<%-- 									<c:otherwise> --%>
<%-- 										${item } --%>
<%-- 									</c:otherwise> --%>
<%-- 								</c:choose> --%>
<%-- 							</c:forEach> --%>
<!-- 							] -->
<!-- 						</p> -->
						<table class="table table-bordered">
							<tr>
								<c:forEach items="<%=list %>" var="item" varStatus="vs">
									<c:choose>
										<c:when test="${item.equals('김인섭') }">
											<td style="color:green; font-weight:bold;">본인</td>
										</c:when>
										<c:otherwise>
											<td>${item }</td>
										</c:otherwise>
									</c:choose>
									<c:if test="${vs.index %4 == 3}">
										<c:if test="${!vs.last }">
											</tr>
											<tr>
										</c:if>
									</c:if>
								</c:forEach>
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