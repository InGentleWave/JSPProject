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
							<table class="table table-bordered table-hover" width="100%">
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
								<tr class="tr">
									<td >10</td>
									<td>네이버웍스 비정기 업데이트 소식</td>
									<td>관리자</td>
									<td>2022-11-16</td>
									<td>1455</td>
								</tr>
								<tr class="tr">
									<td>9</td>
									<td>네이버웍스 일부 기능의 사양 변경 및 종료 안내</td>
									<td>관리자</td>
									<td>2022-11-15</td>
									<td>234</td>
								</tr>
								<tr class="tr">
									<td>8</td>
									<td>[프로모션 공지] 네이버웍스 X 워크플레이스 결합 서비스 신규 가입 20%추가 할인(~12.31)</td>
									<td>관리자</td>
									<td>2022-11-14</td>
									<td>23444</td>
								</tr>
								<tr class="tr">
									<td>7</td>
									<td>[중요] 네이버웍스 V3.5 정기 업데이트 소식</td>
									<td>관리자</td>
									<td>2022-11-13</td>
									<td>12466</td>
								</tr>
								<tr class="tr">
									<td>6</td>
									<td>[프로모션 사전 공지] 네이버웍스 X 워크플레이스 결합 서비스 20% 추가 할인</td>
									<td>관리자</td>
									<td>2022-11-12</td>
									<td>111</td>
								</tr>
								<tr class="tr">
									<td>5</td>
									<td>드라이브 서비스 DB 업그레이드 작업 사전 안내</td>
									<td>관리자</td>
									<td>2022-11-11</td>
									<td>2233</td>
								</tr>
							</table>
						</div>
						<hr/><br/>
						<div class="col-md-12 stretch-card grid-margin">
							<div class="card">
								<div class="card-body">
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="checkbox" id="chk" value="Y"> 
										<label class="form-check-label" for="chk">append 여부</label>
									</div>
										<h6>선택한 td안에 있는 글자를 아래 출력란에 출력해주세요!</h6>
									<p id="output" class="text-danger">출력란</p>
								</div>
							</div>
						</div>
                    </div>
                </div>
            </div>
        </div>
        <script>
			$(function(){
				let ele = null;
				let html = ""; // td에 단일 출력일지 append 출력일지에 따라 text 저장소
				let output = $("#output");
				
				let chk = $("#chk");
				
				// append 체크 이벤트
				// append 체크 이벤트가 발생했을 때, html 변수를 ""으로 처리해준다.(초기화)
				chk.on("change",function(){
					html="";
				})
				$("td").on("click",function(){
					ele = $(this);		// 현재 클릭한 td element 담아두기
					// append 여부가 체크되었을 때와 체크되어 있지 않을 때
					// 현재 append 여부가 체크되었는지 확인하기 위한 값
					let chkVal = $("#chk:checked").val();
					if(chkVal == "Y"){			// append 여부 체크 됨
						html+= ele.text() + "<br>";
					
					} else {					// append 여부 체크 해제
						html="";
						html += "<p id='p'>" + ele.text() + "</p>"
						html += "<button class='btn btn-warning' id='udtBtn'>수정</button>";
						html += "<button class='btn btn-danger' id='delBtn'>삭제</button>";
					}
					output.html(html);
					
					
					
				});
				// 출력란에 출력된 수정 버튼을 클릭했을 때
				$("#output").on("click","#udtBtn",function(){
					console.log("수정click");
					// 수정 버튼을 눌렀을 때와 확인 버튼을 눌렀을 때
					let btnText = $(this).text();
					if(btnText == "수정"){	// 버튼 text가 수정일 때
						// 1. 결과로 가져온 Text를 input 요소에 넣어서 출력
						let pText = output.find("#p").text();
						let html = "<input type='text' class='form-control' id='pText' value='" + pText + "'/>";	
						output.find("#p").html(html);
						// 2. 버튼 text를 확인으로 바꾼다.
						$(this).text("확인");
					} else { 				// 버튼 text가 확인일 때
						// 1. input 요소 안에 들어있는 수정된 text를 원래의 p태그 안에 결과로 출력한다.
						// input 입력 요소에 value인 text를 가져와 p태그에 출력
						output.find("#p").html(output.find("#pText").val());
						// 2. 버튼 text를 다시 수정으로 변경한다.
						$(this).text("수정");
						// 3. td를 눌렀을 때 결과로 가져온 text가 포함된 영역, 즉 처음에 td를 눌렀을 때의 영역에 수정된 text를 출력
						ele.text(output.find("#p").text())
					}
				});
				
				// 출력란에 출력된 삭제 버튼을 클릭했을 때
				$("#output").on("click","#delBtn",function(){
					// 1. 최초의 누른 td 초기화
					ele.html("");
					// 2. 출력만 초기화
					output.find("#p").html("");
				});
				
			})
        </script>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>