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
						<div class="table-responsive">
							<caption>앞(SEM PC 자리)</caption>
							<table class="table table-bordered" style="text-align:center; font-size:24px;">
								<tr height="80px">
									<td width="10%"></td>
									<td width="10%">정준하</td>
									<td width="10%">노홍철</td>
									<td width="10%">박나래</td>
									<td width="20%"></td>
									<td width="10%">전현무</td>
									<td width="10%">유재석</td>
									<td width="10%">길성준</td>
									<td width="10%">하하</td>
								</tr>
								<tr height="80px">
									<td>김연아</td>
									<td>김희선</td>
									<td>손연재</td>
									<td>박명수</td>
									<td></td>
									<td>아이유</td>
									<td>홍길동</td>
									<td>홍길순</td>
									<td>김철수</td>
								</tr>
								<tr height="80px">
									<td>데프콘</td>
									<td>강호동</td>
									<td>이승기</td>
									<td>김인섭</td>
									<td></td>
									<td>김영철</td>
									<td>서장훈</td>
									<td>민경훈</td>
									<td></td>
								</tr>
								<tr height="80px">
									<td>조현준</td>
									<td>대장금</td>
									<td>홍해인</td>
									<td>백현우</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</table>
						</div>
						<p id="count"></p>
						<h4 id="process"></h4>
						<hr/><br/>
						
						<button type="button" class="btn btn-primary" id="clickBtn">출력</button>
						<div id="output"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script>
    	$(function(){
    		let ele1 = null;
    		let ele2 = null;
    		const output = $("#output");
			$("td").on("click",function(){
				if($(this).text() == ""){
					$("#process").text("빈 칸은 선택할 수 없습니다.").css("color","red");
					ele1.css("backgroundColor","white");
					ele1 = null;
					ele2 = null;
					return;
				}
				// 1. 첫번째 누른 td를 전역 변수에 저장한다.
				if(ele1 == null){
					ele1 = $(this);
					ele1.css("backgroundColor","yellow");
					$("#process").text(ele1.text()+"님과 ").css("color","black");
				} else {
					// 2. 두번째 누른 td와 첫번째 누른 td의 내용을 교체한다.
					ele2 = $(this);
					let temp = ele1.text();
					ele1.text(ele2.text());
					ele2.text(temp);
					// 3. 변경 대상의 이름을 넣어 "#process"에 출력한다.
					$("#process").text(ele2.text()+"님과 "+ele1.text()+"님을 변경합니다!").css("color","black");					
					// ele1과 ele2 초기화
					ele1.css("backgroundColor","white");
					ele1 = null;
					ele2 = null;
				}
// 				console.log($(this).text());
			});
			$("#clickBtn").on("click",function(){
				// 1. 출력 버튼을 누르면 테이블을 복제해서 "#output"에 출력한다.
				output.empty();
// 				let table = $("table").first().clone();
				let table = $("table").clone();
// 				console.log("click");
// 				console.log(table);
				table.appendTo(output);
				// 2. 본인 이름이 우에서 좌로 움직이고, 글자색을 파란색으로 바꾼다.
				let self = output.find("td:contains('김인섭')")
				self.html("<marquee style='color:blue;'>김인섭</marquee>");
			});
			
    	});
    </script>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>