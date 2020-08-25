<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>사장페이지 | 메인</title>

<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/resources/css/bootstrap-datepicker.min.css">

<link rel="stylesheet" href="/resources/css/style.css?after">
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

		<div class="container-fluid owner-menu-tabs-container">
			<ul class="nav nav-pills nav-fill my-5">
				<li class="owner-menu-tab-item nav-item border"><a
					class="nav-link active" href="#">예약관리</a></li>
				<li class="owner-menu-tab-item nav-item border"><a
					class="nav-link" href="#">매장관리</a></li>
				<li class="owner-menu-tab-item nav-item border"><a
					class="nav-link" href="#">문의사항</a></li>
			</ul>
		</div>

		<div class="container-fluid">
			<div class="row">

				<div class="col-lg-4">
					<div class="scheduler-container card-body d-flex justify-content-center">
						<div class="datepicker d-flex justify-content-center w-100"
							data-date-format="mm/dd/yyyy"></div>
					</div>
				</div>

				<div class="col-lg-8">
					<nav>
						<div class="nav nav-tabs" id="nav-tab" role="tablist">
							<a class="nav-link active" id="nav-home-tab" data-toggle="tab"
								href="#nav-home" role="tab" aria-controls="nav-home"
								aria-selected="true">예약대기</a>
							<a class="nav-link" id="nav-profile-tab" data-toggle="tab" 
								href="#nav-profile" role="tab" aria-controls="nav-profile"
								aria-selected="false">예약이력</a>
						</div>
					</nav>
					
					<div class="tab-content" id="nav-tabContent">
						<div class="tab-pane fade show active" id="nav-home"
							role="tabpanel" aria-labelledby="nav-home-tab">
							<table class="table">
								<thead>
									<tr>
										<th scope="col">예약자명</th>
										<th scope="col">예약시간</th>
										<th scope="col">예약인원</th>
										<th scope="col">회원등급</th>
										<th scope="col">연락처</th>
										<th scope="col"></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${customerOrderList}" var="customerOrder">
									<tr>
										<td>예약자명</td>
										<td>${customerOrder.time_of_use}</td>
										<td>${customerOrder.number_of_people}명</td>
										<td>회원등급</td>
										<td>${customerOrder.customer_phoneNumber}</td>
										<td style="width:100px;">
											<div class="d-flex flex-column">
												<a href="#" class="btn btn-success btn-sm mb-1">확정</a>
												<a href="#" class="btn btn-danger btn-sm">취소</a>
											</div>
										</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
							
						<div class="tab-pane fade" id="nav-profile" role="tabpanel"
							aria-labelledby="nav-profile-tab">
							<table class="table">
								<thead>
									<tr>
										<th scope="col">예약자명</th>
										<th scope="col">예약시간</th>
										<th scope="col">예약인원</th>
										<th scope="col">회원등급</th>
										<th scope="col">연락처</th>
										<th scope="col"></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${customerOrderList}" var="customerOrder">
										<tr>
											<td>예약자명</td>
											<td>${customerOrder.time_of_use}</td>
											<td>${customerOrder.number_of_people}명</td>
											<td>회원등급</td>
											<td>${customerOrder.customer_phoneNumber}</td>
											<td style="width:100px;">
												<div class="btn btn-light btn-sm mb-1">${customerOrder.reserv_Confirm}</div>
											</td>
										</tr>
										</c:forEach>
								</tbody>
							</table>
						</div>
					</div><!-- End .tab-content -->
					
				</div><!-- End .col-lg-8 -->
				
			</div><!-- End .row -->
		</div><!-- End .container-fluid -->
	</main>



	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/bootstrap.bundle.min.js"></script>
	<script src="/resources/js/bootstrap-datepicker.min.js"></script>
	<script src="/resources/js/bootstrap-datepicker.ko.min.js"></script>

	<script>
		$(function() {
			$('.datepicker').datepicker({
				language : "ko",
				inline : true,
				format: "yyyy-mm-dd",
				updateViewDate : true,
				defaultViewDate : "${date}"
			})
			.on('changeDate', function(e) {
				var date = e.format('yyyy-mm-dd');

				location.href='/owner/reservationManagement?date=' + date;
			})
			.datepicker('update', '${date}');
		});
	</script>
</body>
</html>