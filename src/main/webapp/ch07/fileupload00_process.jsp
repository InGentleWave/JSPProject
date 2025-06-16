<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collection"%>
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
							String path = "C:/upload";
							
							Collection<Part> collect = request.getParts();
							Iterator<Part> ite = collect.iterator();
							
							String fileName ="";
							while(ite.hasNext()){
								Part part = ite.next();
								String key = part.getName();
								if(key.equals("profileImg")){
									fileName = part.getSubmittedFileName();
									long fileSize = part.getSize();
									String fileContentType = part.getContentType();
									
									out.print("파일명 : " + fileName+"<br/>");
									out.print("파일크기 : " + fileSize+"<br/>");
									out.print("파일컨텐츠타입 : " + fileContentType+"<br/>");
									
									// 파일 저장
									part.write(path + "/" + fileName);
									
								}
							}
						%>
						<img src="/upload/<%=fileName %>" style="width:200px">
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>