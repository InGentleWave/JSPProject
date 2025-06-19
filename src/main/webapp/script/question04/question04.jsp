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
							<table class="table table-bordered text-center" style="font-size:24px;">
								<tr width="100%" height="80px">
									<td width="10%"></td>
									<td width="10%"></td>
									<td width="10%">추승완</td>
									<td width="10%">서강빈</td>
									<td width="20%"></td>
									<td width="10%">김소희</td>
									<td width="10%">송욱진</td>
									<td width="10%">김형준</td>
									<td width="10%"></td>
								</tr>
								<tr height="80px">
									<td>안철호</td>
									<td>김예빈</td>
									<td>윤미루</td>
									<td>안주영</td>
									<td></td>
									<td>오형진</td>
									<td>박영하</td>
									<td>김경근</td>
									<td>이하은</td>
								</tr>
								<tr height="80px">
									<td></td>
									<td>이유진</td>
									<td>이우현</td>
									<td>고준수</td>
									<td></td>
									<td>이상현</td>
									<td>이재석</td>
									<td>홍진호</td>
									<td>김진영</td>
								</tr>
								<tr height="80px">
									<td></td>
									<td>신의용</td>
									<td>김인섭</td>
									<td>김지후</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</table>
							<hr/>
							<div class="progress" style="height: 40px;">
								<div class="progress-bar progress-bar-striped" id="myBar" role="progressbar" aria-valuenow="60" aria-valuemin="0"
									aria-valuemax="100" style="width: 1px; height: 40px;">
									<span class="sr-only">60% Complete</span>
								</div>
							</div>
							<br/>
							<h4 id="txt" style="font-size: 16px;"></h4>
							<button type="button" onclick="SeatMoveEvent()" style="padding:12px;border:none;cursor:pointer;">출력</button>
						</div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>