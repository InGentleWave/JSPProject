<%@page import="java.util.Collection"%>
<%@page import="kr.or.ddit.ch07.MemberVO"%>
<%@page import="kr.or.ddit.ch07.MemberDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
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
                    	<!--
							1. 회원가입 처리를 진행해주세요.
								- 회원가입 시, 등록에 필요한 항목 모두를 이용해 가입을 진행해주세요.
								  > MemberDAO의 insertMember() 메소드를 활용하여 가입을 진행해주세요.
								- 프로필 이미지가 있기 때문에 파일 처리도 함께 해주세요.
								- 가입 완료 후, 로그인 페이지로 이동해주세요.
								
							2. 프로필 이미지를 업로드 할 때, 파일 크기가 1MB를 넘어가는 경우 "파일 크기가 초과되어 회원가입을 진행할 수 없습니다." 라는 
							   에러 메세지를 회원가입 페이지(ch07_test_signup.jsp)에서 출력해주세요.
						-->
						<%
							String path = request.getServletContext().getRealPath("/resources/upload");
							
							File tempFile = new File(path);
							
							if(!tempFile.exists()){
								tempFile.mkdirs();
							}
							
							String filename = "";
							int maxSize = 1*1024*1024;
							boolean flag = true;
							
							Collection<Part> collect = request.getParts();
							Iterator<Part> ite = collect.iterator();
							String errMsg="";
							while(ite.hasNext()){
								Part part = ite.next();
								String key = part.getName();
								if(key.equals("profileImg")){
									filename = part.getSubmittedFileName();
									System.out.println("signup 프로세스 filename : "+filename);
									long fileSize = part.getSize();
									if(maxSize < fileSize){
										errMsg = "파일 크기 초과로 인해 회원가입 실패했습니다.";
										flag = false;
									} else {
										if(filename!=null&&!filename.equals("")){
											part.write(path + "/" + filename);
										}
									}
								}
							}
							MemberDAO mDao = MemberDAO.getInstance();
							String mem_id = request.getParameter("mem_id");
							MemberVO mv2 = mDao.getMember(mem_id);
							// 동일한 ID 존재 시 회원가입 실패.
							if(mv2.getMem_id()!=null&&mv2.getMem_id().equals(mem_id)){
								errMsg = "사용 불가능한 ID입니다.";
								flag = false; 
							}
							if(flag){
								MemberVO mv = new MemberVO();
								mv.setMem_id(mem_id);
								mv.setMem_pw(request.getParameter("mem_pw"));
								mv.setMem_name(request.getParameter("mem_name"));
								mv.setMem_sex(request.getParameter("mem_sex"));
								
								mv.setFilename(filename);
								
								mDao.insertMember(mv);
								session.setAttribute("isSignUpSuccess",true);
								response.sendRedirect("./ch07_test_signin.jsp");
							} else {
								session.setAttribute("errMsg", errMsg);
								response.sendRedirect("./ch07_test_signup.jsp");
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