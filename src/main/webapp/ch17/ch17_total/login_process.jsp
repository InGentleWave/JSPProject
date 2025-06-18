<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 1. 로그인 처리를 진행해주세요.
	// 2. 일반회원 및 관리자 계정으로 접속 시, 게시판 목록으로 이동해주세요.
	//    > 넘겨받은 아이디, 비밀번호가 총 3개의 계정과 일치하는 정보가 있다면 로그인 성공
	// 3. 일치하지 않는 정보라면 다시 login.jsp로 이동해 에러 메세지를 출력해주세요.
	//    > '아이디와 비밀번호를 확인해 주세요' 메세지를 출력해주세요.
	// 4. 로그인 성공 시, Session에 로그인 정보를 등록해주세요.
	//    > 세션명은 'SessionInfo'로 해주세요.
	
	// 회원 확인용
	// 총 3명의 회원을 초기화해두었습니다. 로그인 시, 활용하세요.
	// Map 타입을 가지고 있는 users에 회원 3명을 id가 key가 될 수 있도록 설정해두었습니다.
	//-------------------------------------------------
	Map<String, String[]> users = new HashMap<String, String[]>();
	String[] user1 = {"a001", "a1234"};
	String[] user2 = {"b001", "b1234"};
	String[] admin = {"admin", "adm1234"};
	users.put("a001", user1);
	users.put("b001", user2);
	users.put("admin", admin);
	//-------------------------------------------------
%>