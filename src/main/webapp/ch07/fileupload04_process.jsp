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
							// 파일을 업로드 하기 위한 방법
							// 1. Local 환경에 업로드
							// - C:/upload 폴더에 파일을 업로드 설정
							// JSP에서는 서버를 설정하기 위한 xml파일을 활용하지 않고 tomcat 자체의 설정을 활용해 로컬 환경에 업로드
							// 된 파일을 가져올 수 ㅣㅇㅆ도록 설정합니다.
							// server.xml 내, Context 태그를 통해 관련 설정을 추가합니다.
							// 이때, reloadable 설정은 'true'로 설정합니다.
							// <Context docBase="C:/upload" path="/upload" reloadable="true"/>
							
							String path = "C:/upload";
							
							// 업로드 하기 위한 폴더 경로를 설정한 파일 객체를 생성한다.
							File tempFile = new File(path);
							// 해당 폴더 위치가 존재하지 않을 때, 폴더를 생성한다.
							if(!tempFile.exists()){
								tempFile.mkdirs();	// 해당 위치에 폴더를 생성
							}
							
							out.println("# 일반데이터<br/>");
							// request로 넘어온 파라미터의 key(input 요소의 name)들을 꺼낸다.
							Enumeration<String> en = request.getParameterNames();
							// 꺼낼 key가 없을때까지 반복문을 실행한다.
							while(en.hasMoreElements()){
								//nextElement() 메소드를 통해 key를 꺼낸다.
								String key = en.nextElement();
								out.println("param : "+ key + " / "+ request.getParameter(key) + "<br/>");
							}
							
							out.println("<br/>");
							
							out.println("# 파일데이터<br/>");
							// request로 넘어온 파라미터들 중,  Part 타입의 데이터를 Collection에 담는다.
							Collection<Part> collect = request.getParts();
							// Iterator를 이용해 Part 데이터를 꺼내기 위한 준비를 한다.
							Iterator<Part> ite =  collect.iterator();
							
							// 꺼낼 데이터가 없을때 까지 반복문을 실행한다.
							while(ite.hasNext()){
								Part part = ite.next();
								String name = part.getName();
								if(name.equals("filename")){
									// parameter의 key를 꺼낸다.
									out.println("name : "+ name +"<br/>");
									// parameter의 파일명을 꺼낸다.
									out.println("fileName : "+ part.getSubmittedFileName() +"<br/>");
									// parameter의 파일크기를 꺼낸다.
									out.println("size : "+ part.getSize() +"<br/>");
									// parameter의 콘텐츠타입(MimeType)을 꺼낸다.
									out.println("contentType : "+ part.getContentType() +"<br/>");
									
									part.write(path + "/" + part.getSubmittedFileName()); 	// 파일 복사
									
									%>
									<a class="btn btn-primary" href="/upload/<%=part.getSubmittedFileName() %>">파일 확인</a><br/>
									<%
									out.println("----------------------------------------------------<br/>");
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