<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>owner Login</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="manifest" href="site.webmanifest">
<link rel="shortcut icon" type="image/x-icon"
	href="../resources/assets/img/logo/logo_size_invert_favicon.png">

<!-- CSS here -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/css/slicknav.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/css/flaticon.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/css/gijgo.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/css/animate.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/css/animated-headline.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/css/magnific-popup.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/css/fontawesome-all.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/css/themify-icons.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/css/slick.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/css/nice-select.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/css/style.css">
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
	function emailS() {

		var owner_email = $("#owner_email").val();

		$.ajax({
			url : "findPassword",
			data : {
				owner_email : owner_email
			},
			type : "POST",
			success : function(data) {
				if(data==true){
				console.log(data);
				alert("이메일로 인증번호가 발송 되었습니다.")
				return false;
				}else{
					alert("없는 이메일 입니다.")
					return false;
				
					}
			},
			error : function() {
				
				alert("다시 시도하세요")
				return false;
			}
		});
	}
	function insertCode() {
		var fal = "false";
		var tr = "true";

		var owner_email = $("#owner_email").val();
		var inputCode = $("#inputCode").val();

		$.ajax({
			url : "insertCodeOwner",
			data : {
				owner_email : owner_email,
				inputCode : inputCode
			},
			type : "POST",
			success : function(result) {
				console.log(result);
				if (result == true) {
					alert("인증완료되었습니다.");
					$('input[name=certificationYN]').attr('value', tr);
					owner_email.onchange = function() {
						$('input[name=certificationYN]').attr('value', fal);
					}
					return false;
				}

			},
			error : function() {
				alert("인증번호가 일치하지않습니다, 인증번호를 다시 입력해주세요.");
				return false;
			}

		});
	}
	function emailC() {

		if ($("#certificationYN").val() == "false") {
			alert("이메일 인증을 해주세요");
			return false;
		} else {
			return true;
		}
	}
</script>
<style type='text/css'>


input[type=text], input[type=email], input[type=password] {
	padding: 5px 10px; /* 상하 우좌 */
	margin: 3px 0; /* 상하 우좌 */
	font-family: inherit; /* 폰트 상속 */
	border: 1px solid #ccc; /* 999가 약간 더 진한 색 */
	font-size: 14pt;
	box-sizing: border-box;
	border-radius: 3px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	-webkit-transition: width 0.4s ease-in-out;
	transition: width 0.4s ease-in-out;
}

input[type=text]:focus, input[type=email]:focus, input[type=password]:focus
	{
	border: 2px solid #555;
}



</style>
</head>
<body>
	<header>
		<!--? Header Start -->
		<div class="header-area">
			<div class="main-header header-sticky">
				<div class="container-fluid">
					<div class="row align-items-center">
						<!-- Logo -->
						<div class="col-xl-2 col-lg-2 col-md-1">
							<div class="logo">
								<a href="../start.jsp"><img
									src="../resources/assets/img/logo/logo_main.png" alt=""></a>
							</div>
						</div>
						<div class="col-xl-10 col-lg-10 col-md-10">
							<div
								class="menu-main d-flex align-items-center justify-content-end">
								<!-- Main-menu -->
								<div class="main-menu f-right d-none d-lg-block">
									<nav>
										<ul id="navigation">
											<li><a href="../start.jsp">홈</a></li>
											<li><a href="about.html">예약관리</a></li>
											<li><a href="blog.html">매장관리</a>
												<ul class="submenu">
													<li><a href="blog.html">매장정보 수정</a></li>
													<li><a href="#">메뉴수정</a></li>
													<li><a href="blog_details.html">예약현황 분석</a></li>
												</ul></li>
											<li><a href="department.html">내정보수정</a></li>
											<li><a href="contact.html">문의사항</a></li>
										</ul>
									</nav>
								</div>
								
							</div>
						</div>
						<!-- Mobile Menu -->

						<div class="col-12">
							<div class="mobile_menu d-block d-lg-none"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
			</header>
	<hr style="margin: 0px 0px;">
	<div
		style="width: 40%; padding-right: 15px; padding-left: 15px; margin-right: auto; margin-left: auto">
	<form method="post" action="changePw" name="findPw"
		onsubmit="return emailC()">
		
				<div style="box-shadow: 0px 0px 9px #9c9c9c83; 
				border-radius: 20px; box-sizing: content-box; 
				padding : 10px 5px 10px 5px; margin-top: 30px; text-align: center;">
					<div style="text-align: center center; font-size: 28px; 
					color: #0F61EF; font-style: bold; padding-top: 20px">Find Password</div>
		
			<hr>
				
				<input type="email" id="owner_email" name="owner_email" value="E-Mail" />
				<button type="button" class="btn header-btn" name="send" onclick="emailS()">인증번호
						받기</button>

			<input type="text" id="inputCode" name="inputCode" value="인증번호">
		
					<button id="inputCodeButton" class="btn header-btn" name="inputCodeButton" type="button"
						onclick="insertCode()">인증번호 확인</button> <input type="hidden"
					name="certificationYN" value="false">
				
			
				
				<input type="button" value="홈으로" class="btn header-btn" onclick="location.href='index'"> 
				<input type="submit" value="찾기" class="btn header-btn">
			
	
		</div>
	</form>
		</div>
	<script
		src="<c:url value="../resources/assets/js/vendor/modernizr-3.5.0.min.js" />">
		
	</script>
	<!-- Jquery, Popper, Bootstrap -->
	<script
		src="<c:url value="../resources/assets/js/vendor/jquery-1.12.4.min.js" />"></script>
	<script src="<c:url value="../resources/assets/js/popper.min.js" />"></script>
	<script src="<c:url value="../resources/assets/js/bootstrap.min.js" />"></script>

	<!-- Jquery Mobile Menu -->

	<script
		src="<c:url value="../resources/assets/js/jquery.slicknav.min.js" />"></script>

	<!-- Jquery Slick , Owl-Carousel Plugins -->

	<script
		src="<c:url value="../resources/assets/js/owl.carousel.min.js" />"></script>
	<script src="<c:url value="../resources/assets/js/slick.min.js" />">
		
	</script>
	<!-- One Page, Animated-HeadLin -->
	<script src="<c:url value="../resources/assets/js/wow.min.js" />"></script>
	<script
		src="<c:url value="../resources/assets/js/animated.headline.js" />"></script>
	<script
		src="<c:url value="../resources/assets/js/jquery.magnific-popup.js" />"></script>


	<!-- Date Picker -->
	<script src="<c:url value="../resources/assets/js/gijgo.min.js" />"></script>

	<!-- Nice-select, sticky -->

	<script
		src="<c:url value="../resources/assets/js/jquery.nice-select.min.js" />"></script>
	<script src="<c:url value="../resources/assets/js/jquery.sticky.js" />">
		
	</script>

	<!-- counter , waypoint -->
	<script
		src="<c:url value="../resources/assets/js/jquery.counterup.min.js" />"></script>
	<script src="<c:url value="../resources/assets/js/waypoints.min.js" />"></script>
	<script
		src="<c:url value="../resources/assets/js/jquery.countdown.min.js" />"></script>

	<!-- contact js -->
	<script src="<c:url value="../resources/assets/js/contact.js" />"></script>
	<script src="<c:url value="../resources/assets/js/jquery.form.js" />"></script>
	<script
		src="<c:url value="../resources/assets/js/jquery.validate.min.js" />"></script>
	<script src="<c:url value="../resources/assets/js/mail-script.js" />"></script>
	<script
		src="<c:url value="../resources/assets/js/jquery.ajaxchimp.min.js" />"></script>


	<!-- Jquery Plugins, main Jquery -->

	<script src="<c:url value="../resources/assets/js/plugins.js" />"></script>
	<script src="<c:url value="../resources/assets/js/main.js" />">
		
	</script>
	
</body>
</html>

