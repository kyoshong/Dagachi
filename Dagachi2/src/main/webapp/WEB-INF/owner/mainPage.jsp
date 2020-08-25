<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>사장페이지 | 메인</title>

<link rel="stylesheet" href="/myfirst/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/myfirst/resources/css/bootstrap-datepicker.min.css">

<link rel="stylesheet" href="/myfirst/resources/css/style.css?after">
</head>

<body>
	<header>
		<div
			class="d-flex flex-column flex-md-row align-items-center
			p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
			<div class="col-4">&nbsp;</div>
			<div class="col-4 d-flex justify-content-center">
				<h5 class="my-0">Dagachi</h5>
			</div>
			<div class="col-4 d-flex justify-content-end">
				<p class="my-0 mr-4">ooo님, 환영합니다</p>
				<a class="btn btn-outline-primary btn-sm mr-3" href="#">내정보</a> <a
					class="btn btn-outline-secondary btn-sm " href="#">로그아웃</a>
			</div>
		</div>
	</header>

	<main>
		<div class="d-flex justify-content-center">
			<p class="text-center">Go Dine, No Line</p>
		</div>

		<div class="container-fluid">
			<ul class="nav nav-pills nav-fill my-5">
				<li class="owner-menu-tab-item nav-item border"><a
					class="nav-link" href="reservationManagement?date=${today}">예약관리</a></li>
				<li class="owner-menu-tab-item nav-item border"><a
					class="nav-link" href="/myfirst/storeManagement/storeInfoChangeForm">매장관리</a></li>
				<li class="owner-menu-tab-item nav-item border"><a
					class="nav-link" href="/myfirst/owner/o_boardlist">문의사항</a></li>
			</ul>
		</div>

		<div class="container-fluid">
			<div class="row">
				<div class="col-4">
					<div class="card">
						<div class="card-header">예약대기 주문</div>
						<div class="card-body">
							<table class="table table-sm">
								<thead>
									<tr>
										<th scope="col">예약자</th>
										<th scope="col">인원</th>
										<th scope="col">고객전화번호</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${customerOrderList}" var="customerOrder">
									<tr>
										<td>
											<!-- <img src="${customerOrder.restaurant_Pic}" class="img-thumbnail"> -->
											${customerOrder.customer_Name}
										</td>
										<td>${customerOrder.number_of_people}</td>
										<td>${customerOrder.customer_phoneNumber}</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="col-4">
					<div class="card">
						<div class="card-header">스케쥴러</div>
						<div class="scheduler-container card-body d-flex justify-content-center">
							<div class="datepicker d-flex justify-content-center w-100" data-date-format="mm/dd/yyyy"></div>
						</div>
					</div>
				</div>
				<div class="col-4">
					<div class="card">
						<div class="card-header">공지사항</div>
						<div class="card-body">
							<table class="table table-sm">
								<thead class="thead-light">
									<tr>
										<th scope="col" class="w-10">번호</th>
										<th scope="col">제목</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${ownerNoticeList.ownerList}" var="ownerNotice">
										<tr>
											<td>${ownerNotice.owner_Notice_Num}</td>
											<td>${ownerNotice.owner_Notice_Title}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>

	</main>



	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script src="/myfirst/resources/js/bootstrap.min.js"></script>
	<script src="/myfirst/resources/js/bootstrap.bundle.min.js"></script>
	<script src="/myfirst/resources/js/bootstrap-datepicker.min.js"></script>
	<script src="/myfirst/resources/js/bootstrap-datepicker.ko.min.js"></script>
	
	<script>
	$(function() {	
		$('.datepicker').datepicker({
			language : "ko",
			inline: true,
			format: "yyyy-mm-dd",
			todayHighlight : true,
		})
		.on('changeDate', function(e) {
			var date = e.format('yyyy-mm-dd');

			location.href='/owner/reservationManagement?date=' + date;
		});
	});
	</script>
</body>
</html>