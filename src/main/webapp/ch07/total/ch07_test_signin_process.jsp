<%@page import="kr.or.ddit.ch07.MemberVO"%>
<%@page import="java.util.ArrayList"%>
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
                        <h1 class="page-title">파일 업로드</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH07</li>
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
						<%
							// 1. ch07_tesst_signin.jsp에서 넘겨받은 아이디, 비밀번호가 MemberDAO의 memberList 공간에 저장된
							//    회원 정보들 중 일치하는 회원이 존재한다면 로그인 처리를 진행해주세요.
							//    회원 정보들 중 일치하는 회원이 존재하지 않다면 에러 정보를 ch07_test_signin.jsp로 전달해 메세지를 출력해주세요.
							// 2. 로그인 처리가 정상적으로 이루어졌다면 ch07_test_memberList.jsp로 이동해주세요.
							String mem_id = request.getParameter("mem_id");
							String mem_pw = request.getParameter("mem_pw");
							System.out.println("signin_process mem_id : " + mem_id);
							System.out.println("signin_process mem_pw : " + mem_pw);
							
							MemberDAO memDao = MemberDAO.getInstance();
							MemberVO memVo = memDao.getMember(mem_id);
							mem_id = memVo.getMem_id();
							String loginMsg = "";
							if(mem_id == null){
								System.out.println("회원부재");
								loginMsg = "존재하지 않는 회원입니다.";
								session.setAttribute("loginMsg", loginMsg);
								response.sendRedirect("./ch07_test_signin.jsp");
							} else {
								if(mem_pw.equals(memVo.getMem_pw())){
									System.out.println("로그인 성공");
									System.out.println("멤버목록 페이지로 진행합니다.");
									session.setAttribute("mem_id", mem_id);
									response.sendRedirect("./ch07_test_memberList.jsp");
								} else {
									// ID는 일치하지만, PW가 일치하지 않는 경우									
									System.out.println("비밀번호 불일치");
									loginMsg = "비밀번호가 일치하지 않습니다.";
									session.setAttribute("loginMsg", loginMsg);
									response.sendRedirect("./ch07_test_signin.jsp");
								}
							}
						%>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>