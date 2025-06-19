<%@page import="kr.or.ddit.ch17.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.ch17.dao.BoardRepository"%>
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
						# 게시판 목록 페이지를 작성해주세요.
						
						<데이터가 존재하지 않을 때>
						─────────────────────────────────────────────────────────────────────────────
						
						메뉴박스
						[게시판][자료실]
						─────────────────────────────────────────────────────────────────────────────
						
						번호				제목						작성자		작성일			조회수
						─────────────────────────────────────────────────────────────────────────────
											조회하실 게시글이 존재하지 않습니다.
						─────────────────────────────────────────────────────────────────────────────						
						[ 게시글 등록하기  ]
						
						
						
						<데이터가 존재할 때>
						─────────────────────────────────────────────────────────────────────────────
						
						메뉴박스
						[게시판][자료실]
						─────────────────────────────────────────────────────────────────────────────
						
						번호				제목						작성자		작성일			조회수
						─────────────────────────────────────────────────────────────────────────────
						10		게시판 제목입니다......! 1			허나훔		2022-12-12		1245
						9		게시판 제목입니다......! 2			송서영		2022-12-12		1245
						8		게시판 제목입니다......! 3			채진영		2022-12-12		1245
						7		게시판 제목입니다......! 4			배영호		2022-12-12		1245
						6		게시판 제목입니다......! 5			조은혁		2022-12-12		1245
						5		게시판 제목입니다......! 6			조현수		2022-12-12		1245
							.....
						─────────────────────────────────────────────────────────────────────────────
						[ 게시글 등록하기  ]
						
						1. 게시판 목록을 출력해주세요.
							> JSTL을 활용해주세요.
							> 초기 화면에서는 데이터가 없으므로 '조회하실 게시글이 존재하지 않습니다.'를 출력해주세요.
							> 데이터가 있는 경우엔 번호, 제목, 작성자, 작성일, 조회수를 맞춰서 데이터를 출력해주세요.
									
						2. 게시글 클릭 시, 해당 게시글 상세보기 페이지로 이동합니다.
							> 상세보기 페이지로 이동할 때, 조회수가 상승합니다.
							
						3. 게시글 등록하기 클릭 시, 게시글 등록 페이지로 이동합니다.
						
						4. 로그아웃 버튼을 클릭 시, 로그아웃 처리를 해주세요.
						
						<로그인 후>
						메뉴박스
						[게시판][자료실][로그아웃]
						─────────────────────────────────────────────────────────────────────────────
						
						<로그인 전 or 로그아웃 후>
						메뉴박스
						[게시판][자료실]
						─────────────────────────────────────────────────────────────────────────────
					 -->
					 <%
					 	BoardRepository br = BoardRepository.getInstance();
					 	List<BoardVO> voList = br.selectBoardList();
					 	System.out.println(voList);
// 					 	pageContext.setAttribute("voList", voList);
					 %>
					 <h3>메뉴 박스</h3>
					 <hr/>
					 <div>
					 	<button type="button" class="btn btn-primary">게시판</button>
					 	<button type="button" class="btn btn-warning">자료실</button>
					 	<button type="button" class="btn btn-danger">로그아웃</button>
					 </div>
					 <hr/>
					 <table class="table table-bordered">
					 	<tr>
					 		<th width="10%">번호</th>
					 		<th>제목</th>
					 		<th width="10%">작성자</th>
					 		<th width="15%">작성일</th>
					 		<th width="10%">조회수</th>
					 	</tr>
					 	<c:set var="voList" value="<%=voList %>"/>
					 	<c:choose>
					 		<c:when test="${empty voList }">
					 			<tr><td colspan="5">조회하실 게시글이 존재하지 않습니다.</td></tr>	
					 		</c:when>
					 		<c:otherwise>
					 			<c:forEach items="${voList }" var="vo">
					 				<tr>
						 				<td>${vo.no }</td>
						 				<td>${vo.title }</td>
						 				<td>${vo.writer }</td>
						 				<td>${vo.regDate }</td>
						 				<td>${vo.hit }</td>
					 				</tr>
					 			</c:forEach>
					 		</c:otherwise>
					 	</c:choose>
					 </table>
					 <button type="button" class="btn btn-primary" onclick="location.href='./boardForm.jsp'">등록</button>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>