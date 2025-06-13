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
                        <h1 class="page-title"><%=IndexRepository.getChapter("CH06") %></h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH06</li>
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
						<!-- 
							문제)
							1. 	타입, 아이디, 비밀번호, 이름, 핸드폰번호, 성별, 취미, 가입인사 입력 폼양식을 만들고
								ch06_test_process.jsp로 결과를 전송해주세요.
								
							2.	항목별 설정 내용을 참고해서 작성해주세요.
							- 타입 : 사용자(user)/ 관리자(admin)을 선택할 수 있는 입력 양식을 만들어주세요.
							- 아이디 : 아이디를 입력 받을 수 있는 양식으로 만들어주세요.
							- 비밀번호 : 비밀번호를 입력 받을 수 있는 양식으로 만들어주세요.
							- 이름 : 이름을 입력 받을 수 있는 양식으로 만들어주세요.
							- 핸드폰번호 : 	첫번째 자리는 010,011,016,017,019,070을 선택할 수 있도록 입력 양식을 만들어주세요.
											두번째 자리는 최대 4자리를 입력 받을 수 있는 입력 양식으로 만들어주세요.
											세번째 자리는 최대 4자리를 입력 받을 수 있는 입력 양식으로 만들어주세요.
							- 성별 : 남자(male), 여자(female)로 선택할 수 있는 입력 양식으로 만들어주세요.(value:male/female)
							- 취미 : 개발(development), 독서(book), 영화감상(movie), 음악감상(music), 운동(sports), 기타(etc)
									기타 일 때는 직접 입력할 수 있는 입력양식이 동적으로 생성되어 입력 양식이 나타나게 해주세요.
							- 가입인사 : 가입인사를 문장으로 입력할 수 있는 입력 양식으로 만들어주세요.
							
							3. 입력된 데이터를 ch06_test_process.jsp로 전송 후 결과를 출력해주세요.
						 -->
						 <form action="ch06_test_process.jsp" method="post">
						 	<table class="table table-bordered">
							 	<tr>
							 		<td style="width: 15%;">타입</td>
							 		<td>
							 			<select name="type">
							 				<option value="user">사용자</option>
							 				<option value="admin">관리자</option>
							 			</select>
							 		</td>
						 		</tr>
							 	<tr>
							 		<td>아이디</td>
							 		<td>
							 			<input type="text" name="id"/>
							 		</td>
						 		</tr>
							 	<tr>
							 		<td>비밀번호</td>
							 		<td>
							 			<input type="text" name="pw"/>
							 		</td>
						 		</tr>
							 	<tr>
							 		<td>이름</td>
							 		<td>
							 			<input type="text" name="name"/>
							 		</td>
						 		</tr>
							 	<tr>
							 		<td>연락처</td>
							 		<td>
							 			<select name="phone1">
							 				<option value="010">010</option>
							 				<option value="011">011</option>
							 				<option value="016">016</option>
							 				<option value="017">017</option>
							 				<option value="019">019</option>
							 				<option value="070">070</option>
							 			</select> -
							 			<input type="text" name="phone2" maxlength="4" size="4"/> - 
							 			<input type="text" name="phone3" maxlength="4" size="4"/>
							 		</td>
						 		</tr>
							 	<tr>
							 		<td>성별</td>
							 		<td>
							 			<input type="radio" name="gender" value="male"/>남자
							 			<input type="radio" name="gender" value="female"/>여자
							 		</td>
						 		</tr>
							 	<tr>
							 		<td>취미</td>
							 		<td>
							 			<input type="checkbox" name="hobby" value="development"/>개발
							 			<input type="checkbox" name="hobby" value="book"/>독서
							 			<input type="checkbox" name="hobby" value="sports"/>운동
							 			<input type="checkbox" name="hobby" value="movie"/>영화
							 			<input type="checkbox" name="hobby" value="music"/>음악<br/>
							 			<input type="checkbox" id="etc-chkbox" />기타
							 			<input type="text" name="hobby" id="etc-text" style="display : none;"/>
							 		</td>
						 		</tr>
							 	<tr>
							 		<td colspan="2"><textarea rows="5" cols="60%"name="greeting" placeholder="가입 인사를 입력해주세요."></textarea></td>
						 		</tr>
							 	<tr>
							 		<td colspan="2">
							 			<button type="submit">전송</button>
							 			<button type="reset">리셋</button>
							 		</td>
						 		</tr>
						 	</table>
						 </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
	<script>
		const etc = document.querySelector("#etc-chkbox");
		const etcText = document.querySelector("#etc-text");
		document.addEventListener("DOMContentLoaded",function(){
			etc.addEventListener("change",function(e){
				e.preventDefault();
				if(etc.checked){
					// 체크되면 숨겨져있던 인풋태그를 보이게 하는 방식으로 하고 싶다.
					etcText.style.display = "";
				} else {
					etcText.value = "";
					etcText.style.display = "none";
				}
			})
		})
	</script>
</body>
</html>