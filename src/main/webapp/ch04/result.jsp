<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.index.IndexRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
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
	<%
		List<Map<String,Object>> r_memberList = (List<Map<String,Object>>) request.getAttribute("memberList");
		if(r_memberList!=null && r_memberList.size()>0){
			int r_cnt = (int) request.getAttribute("cnt");
			%>
				<c:set value="<%=r_cnt %>" var="cnt"/>
				<c:set value="<%=r_memberList %>" var="reqMemberList"/>
			<%
		}
		
		List<Map<String,Object>> s_memberList =(List<Map<String,Object>>)session.getAttribute("mList"); 
		if(s_memberList!=null && s_memberList.size()>0){
			// 요청 횟수를 꺼내야 합니다.
			String s_cnt = request.getParameter("cnt");
			%>
				<c:set value="<%=s_cnt %>" var="cnt"/>
				<c:set value="<%=s_memberList %>" var="sesMemberList"/>
			<%
		}
	%>
    <section class="about-us section">
        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-lg-12 col-md-12 col-12">
                    <div class="content-left wow fadeInLeft" data-wow-delay=".3s">
						<!-- 내용을 입력해주세요 -->
						<h1>등록 완료 후</h1>
						<p>요청 횟수 : ${cnt }</p>
						<h3>페이지 이동방식 포워딩</h3>
						<hr/>
						<c:forEach items="${reqMemberList }" var="member">
							<p>번호 : ${member.no }</p>
							<p>아이디 : ${member.id }</p>
							<p>비밀번호 : ${member.pw }</p>
							<p>이름 : ${member.name }</p>
						</c:forEach>
						<hr/>
						
						<h3>페이지 이동방식 리다이렉트</h3>
						<hr/>
						<c:forEach items="${sesMemberList }" var="member">
							<p>번호 : ${member.no }</p>
							<p>아이디 : ${member.id }</p>
							<p>비밀번호 : ${member.pw }</p>
							<p>이름 : ${member.name }</p>
						</c:forEach>
						<hr/>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>