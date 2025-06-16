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
							// 2. 서버 업로드 환경에 업로드
							// 이클립스에 설정한 tomcat의 환경이 존재한다. 그렇기 때문에 우리가 개발중인 프로젝트가
							// 서버를 통해 run이 되면 .war로 변환된 프로젝트 파일이 tomcat 서벚 환경에 배포되어 실행되는데, 이때 해당 경로가
							// workspace_jsp/.metadata/plugins/xxx.server.core/tmp0/wtpwebapp/JSPProject에 해당하는
							// ROOT로부터 내가 설정한 '/resources/upload'라는 폴더를 찾아 해당 위치에 파일을 업로드하기 시작합니다.
							String path = request.getServletContext().getRealPath("/resources/upload");
							// 서버 업로드 경로를 이용한 파일 객체 생성
							File tempFile = new File(path);
							// 해당 위치에 upload 폴더가 존재하지 않을 때
							if(!tempFile.exists()){
								tempFile.mkdirs();	// 해당 위치에 upload 폴더 생성
							}
							
							String id = request.getParameter("id");		// 아이디
							String pw = request.getParameter("pw");		// 비밀번호
							String name = request.getParameter("name");	// 이름
							
							String filename = "";		// 파일명
							int maxSize = 1*1024*1024;	// 파일 업로드 시 최대 사이즈(1MB)
							boolean flag = true;		// 업로드 성공
							
							Collection<Part> collect = request.getParts();
							Iterator<Part> ite = collect.iterator();
							while(ite.hasNext()){
								Part part =  ite.next();
								String key = part.getName();
								if(key.equals("profileImg")){
									filename = part.getSubmittedFileName();	// 파일명 설정
									long fileSize = part.getSize();
									System.out.println(fileSize);
									// maxSize인 1MB보다 업로드한 파일 크기가 컸을 때
									if(maxSize < fileSize){
										
										flag = false;
									} else {
										part.write(path + "/" + filename);	// 파일 복사
									}
								}
								
							}
							if(flag){
								out.println("가입을 완료하였습니다!<br/>");
								out.println("아이디 : " + id + "<br/>");
								out.println("비밀번호 : " + pw + "<br/>");
								out.println("이름 : " + name + "<br/>");
								out.println("프로필 : " + filename + "<br/>");
							} else {
								out.println("등록에 실패하였습니다!<br/>");
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