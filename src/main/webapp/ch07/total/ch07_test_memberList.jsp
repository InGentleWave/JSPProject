<%@page import="kr.or.ddit.ch07.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.ch07.MemberDAO"%>
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
                    <!-- 
                    	1. 참고 이미지를 참고하여 회원 목록 페이지를 작성해주세요.
                    		- 목록은 프로필 이미지, 아이디, 이름 항목이 함께 출력될 수 있도록 해주세요.
                    	2. 현재 로그인 한 사용자의 아이디가 일치하는 목록 데이터는 [본인]을 표시해주세요.
                    	3. [회원등록] 버튼 클릭 시, 회원가입 페이지로 이동하여 회원을 새롭게 등록할 수 있도록 해주세요.
                    	4. 각 회원목록의 내용 중 [상세정보] 버튼 클릭 시, 해당 회원의 상세정보 페이지(ch07_test_memberDetail.jsp)로 이동해주세요.
                     -->
                     <%
                   		System.out.println("리스트 페이지에 mem_id Parameter통해 전달됨.");
                   		String mem_id = request.getParameter("id");
                   		
                     	MemberDAO memDao = MemberDAO.getInstance();
						ArrayList<MemberVO> memList = memDao.getMemberList();
						pageContext.setAttribute("memList",memList);
						pageContext.setAttribute("mem_id",mem_id);
                     %>
						<h3>회원목록</h3>
						<hr/>
						<button type="button" class="btn btn-primary" onclick="javascript:location.href='./ch07_test_signup.jsp'">회원등록</button><br/>
						<hr/>
						<div class="row">
						<c:forEach items="${memList }" var="mv" >
							<div class="col-md-3">
								<div class="card">
									<div class="card-header text-center">
									<c:choose>
										<c:when test ="${mem_id == mv.getMem_id() }">
											<span style="color:red">[본인]</span>&nbsp;${mem_id }님의 정보
										</c:when>
										<c:otherwise>
											${mv.mem_name}님의 정보
										</c:otherwise>
									</c:choose>
									</div>
									<div class="card-body text-center">
										<img style="width:116px;" alt="" src="/resources/upload/${mv.filename}">
									</div>
									<div class="card-body text-center">
										아이디 : ${mv.mem_id }<br/> 
										이름 : ${mv.mem_name }<br/>
									</div>
									<div class="card-footer text-center">
									<c:if test="${mem_id == mv.getMem_name() }">
										<button class="btn btn-secondary" onclick="javascript:location.href='ch07_test_memberDetail.jsp?id=${mv.mem_id}'">상세정보</button>
									</c:if>
									</div>
								</div>
							</div>
						</c:forEach>
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