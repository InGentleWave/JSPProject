<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.io.File"%>
<%@page import="kr.or.ddit.index.IndexRepository"%>
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
                        <h1 class="page-title"><%=IndexRepository.getChapter("CH07")%></h1>
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
						<!-- 내용을 입력해주세요 -->
						<%
							String path = request.getServletContext().getRealPath("/resources/upload");
							
							File tempFile = new File(path);
							
							if(!tempFile.exists()){
								tempFile.mkdirs();
							}
							
							String id = request.getParameter("id");
							String pw = request.getParameter("pw");
							String gender = request.getParameter("gender");
							
							String filename = "";
							int maxSize = 1*1024*1024;
							boolean flag = true;
							
							Collection<Part> collect = request.getParts();
							Iterator<Part> ite = collect.iterator();
							while(ite.hasNext()){
								Part part = ite.next();
								String key = part.getName();
								if(key.equals("profileImg")){
									filename = part.getSubmittedFileName();
									System.out.println(path);
									System.out.println(filename);
									long fileSize = part.getSize();
									if(maxSize < fileSize){
										flag = false;
									} else {
										part.write(path + "/" + filename);
									}
								}
								
							}
							if(flag){
								out.println("가입을 완료합니다.<br/>");
								out.println("아이디 : " + id + "<br/>");
								out.println("비밀번호 : " + pw + "<br/>");
								out.println("성별 : " + gender + "<br/>");
								out.println("-첨부파일-----<br/>");
								out.println("<img src='/resources/upload/"+filename+"' style='max-width:200px;'><br/>");
							} else {
								out.println("등록에 실패했습니다!<br/>");
								out.println("파일 크기를 초과하였습니다.<br/>");
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