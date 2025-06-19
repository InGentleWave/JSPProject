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
    		let elementBox = null;	// 선택된 element를 담을 공간
    		let nameBox = "";		// 이름을 담을 공간
    		let flag = false;		// 스위칭으로 사용할 flag(첫번째 누름? 두번째 누름)
    		// element 설정
    		let td = $("td");		// 클릭할 대상(td 엘리먼트)
    		let process = $("#process");	// 클릭할 때의 내역을 남길 영역
    		let output = $("#output");
    		// 학생 자리 옮기기 위한 이벤트 (td 클릭시)
    		td.on("click",function(){
    			let tdt = $(this).text();	// 학생의 이름
    			
    			// 빈 공간을 눌렀을 때, block 이벤트 설정
    			if(tdt =="" || tdt == null){
    				process.html("빈 공간은 선택할 수 없습니다!").css("color","red");
    				td.css("background-color","white");
    				return false;
    			}
    			
    			if(flag){	// 두번째 학생을 클릭했을 때
    				flag = false;
    				elementBox.html(tdt);	// 첫번째 학생을 눌렀을 때 얻은 td요소에 두번째 학생의 이름을 넣는다. 
    				
    				process.html(nameBox +"님과"+ tdt + "님을 변경합니다!").css("color","black");
    				$(this).html(nameBox);
    				td.css("background-color","white");
    			} else {	// 첫번째 학생을 클릭했을 때
    				flag = true;	// 첫번째 학생을 클릭했으니까, 상태 변경!(false->true)
    				nameBox = tdt;	// 첫번째 학생의 이름을 nameBox 공간에 담는다.
    				elementBox = $(this);	// 첫번째 요소의 Element를 담는다.
    				
    				// 첫번째 학생이 포함된 td 영역의 배경색깔을 노란색으로 변경
    				$(this).css("background-color", "yellow");
    				process.html(nameBox + "님과").css("color","black");
    			}
    		})
    		$("#clickBtn").on("click",function(){
    			output.html("");
    			let tds = document.getElementsByTagName("td");
    			let html = "<table class='table table-bordered' style='text-align:center; font-size:24px;'>"
    			
    			for(let  i = 1;i <= tds.length; i++){
    				if(tds[i-1].innerText=='조현준'){
    					html += "<td width='10%'><marquee><font color='blue'>"+tds[i-1].innerText+"</font></marquee></td>";
    				} else {
    					html += "<td width='10%'>" + tds[i-1].innerText+"</td>";
    				}
    				if(i%9 == 0){
    					html += "</tr>";
    				}
    			}
    					html += "</table>";
    					output.html(html);
    		});
    	});
    </script>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>