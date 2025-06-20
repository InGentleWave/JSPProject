<%@page import="kr.or.ddit.ch17.vo.BoardFileVO"%>
<%@page import="kr.or.ddit.ch17.vo.BoardVO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collection"%>
<%@page import="kr.or.ddit.ch17.dao.BoardRepository"%>
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
						1. 게시글 등록을 처리해주세요.
							> 게시글 등록 성공 시, 상세보기 페이지(boardView.jsp)로 이동해주세요.
													
						2. 게시글 등록 시, 구현해야할 옵션 기능을 설정해주세요.
							# BoardRepository를 통해 게시글 등록을 진행해주세요.
							# 파일업로드
							> 게시글 등록 시, 파일 크기는 1MB로 제한해주세요.
							> 파일크기 1MB를 넘는 파일을 업로드 시, '업로드 파일 크기를 초과하였습니다' 메세지를 출력해주세요.
							> 파일을 추가하지 않은 경우에는 일반 게시글이 등록될 수 있도록도 해주세요.
							
							# 작성자
							> 작성자는 로그인 당시에 설정한 회원 정보의 아이디를 작성자로 넣어주세요.					
					 -->
					 <%
					 	// 파일 저장할 경로 준비
					 	String path =request.getServletContext().getRealPath("/resources/upload"); 
					 	File folder = new File(path);
					 	if(!folder.exists()) folder.mkdirs();
					 	
					 	// 파일 저장 준비
					 	String filename = "";
					 	int maxSize = 1*1024*1024;
					 	boolean flag = true;
					 	
					 	// 입력한 게시글 정보 받아 가용하기
					 	BoardRepository br = BoardRepository.getInstance();
					 	BoardVO bv = new BoardVO();
					 	BoardFileVO bfv = new BoardFileVO();
					 	
					 	int no = br.getNo();
					 	String title = request.getParameter("title");
					 	String content = request.getParameter("content");
					 	bv.setNo(no);
					 	bv.setTitle(title);
					 	bv.setContent(content);
					 	
					 	
					 	// 첨부 파일 정보 받아 가용하기
					 	Collection<Part> collect = request.getParts();
					 	Iterator<Part> ite = collect.iterator();
					 	
					 	while(ite.hasNext()){
					 		Part part = ite.next();
					 		String key = part.getName();
					 		if(key.equals("file")){
					 			filename = part.getSubmittedFileName();
					 			long fileSize = part.getSize();
					 			
					 			if(maxSize < fileSize){
					 				flag = false;
					 			} else {
					 				flag = true;
					 				part.write(path + "/" + filename);// 파일 저장하기
					 			}
					 		}
					 	}
					 
					 	if(flag){
					 		br.addBoard(bv);
					 		response.sendRedirect("./boardView.jsp?no=" + no);
					 	} else {
					 		session.setAttribute("insertErr", "업로드 파일 크기를 초과하였습니다.");
					 		response.sendRedirect("./boardForm.jsp");
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