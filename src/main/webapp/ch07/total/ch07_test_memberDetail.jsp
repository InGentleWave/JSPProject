<%@page import="kr.or.ddit.ch07.MemberVO"%>
<%@page import="kr.or.ddit.ch07.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
							1. 참고 이미지를 참고하여 회원 상세정보 페이지를 작성해주세요.
							
							2. 회원 프로필 이미지, 아이디, 비밀번호, 이름, 성별을 출력해주세요.
							
							3. [목록] 버튼 클릭 시, 목록페이지(ch07_test_memberList.jsp)로 이동해주세요.
						 -->
						 <%
						 	String mem_id = request.getParameter("id");
						 	MemberDAO memDao = MemberDAO.getInstance();
						 	MemberVO memVo = memDao.getMember(mem_id);
						 %>
						<h3>회원 상세보기</h3>
						<hr/>
						<button type="button" class="btn btn-primary" onclick="javascript:location.href='ch07_test_memberList.jsp?id=<%=memVo.getMem_id()%>'">목록</button><br/>
						<hr/>
						<div class="row">
							<div class="col-md-3">
								<div class="card">
									<div class="card-header text-center">
										${memVo.getMem_name()}님의 정보
									</div>
									<div class="card-body text-center">
										<img style="width:116px;" alt="" src="/resources/upload/<%=memVo.getFilename()%>">
									</div>
									<div class="card-body text-center">
										아이디 : <%=memVo.getMem_id() %><br/>
										비밀번호 : <%=memVo.getMem_pw()%><br/>
										이름 : <%=memVo.getMem_name() %><br/>
										성별 : <%=memVo.getMem_sex() %><br/>
									</div>
									<div class="card-footer text-center">
										<button class="btn btn-secondary" onclick="javascript:location.href='ch07_test_memberDetail.jsp?id=<%=memVo.getMem_id()%>'">상세정보</button>
									</div>
								</div>
							</div>
						</div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>