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
<!-- <link rel="manifest" href="site.webmanifest"> -->
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
</head>



<style type='text/css'>
body {
	font-family: 나눔바른고딕, NanumBarunGothic, 맑은고딕, "Malgun Gothic", 돋움, Dotum,
		"Apple SD Gothic Neo", sans-serif;
	font-size: 12px;
	color: rgb(33, 33, 33);
	letter-spacing: 0.03em;
}

table {
	width: 600px;
}

tr {
	height: 50px;
}

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

input[type=submit], input[type=button] {
	margin-top: 10px;
	width: 150px;
	height: 40px;
	line-height: 22px;
	padding: 5px, 10px; /* 상하 우좌 */
	background: #E6E6E6;
	color: #000000;
	font-size: 15px;
	font-weight: normal;
	letter-spacing: 1px;
	border: none;
	cursor: pointer;
	border-radius: 3px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
}

input[type=submit]:hover {
	background-color: #FFBF00;
}
</style>

<body>
<<<<<<< HEAD
<c:if test="${member==null}">
<form method="post" action="loginOwner">
 <p>
  <label for="owner_email">이메일</label>
  <input type="text" id="owner_email" name="owner_email" />
 </p>
 <p>
  <label for="owner_password">비밀번호</label>
  <input type="password" id="owner_password" name="owner_password" />
 </p>
 <p><button type="submit">로그인</button></p>
 <p><input type="button" value="회원가입" onclick="location.href='joinForm'"></p>
<br><p>비밀번호를 잊으셨다면..?
  <input type="button" value="비밀번호 찾기" onclick="location.href='findPassword'"></p>
 <a href="/index.jsp">홈</a>
 </form>
 </c:if>
 <c:if test="${msg == false}">
 <p style="color:#f00;">로그인에 실패했습니다. 아이디 또는 패스워드를 다시 입력해주십시오.</p>
 </c:if>
 <c:if test="${member !=null}">
 <p>${member.owner_name} 님 환영합니다.</p>
 <p><a href="logoutOwner">로그아웃</a></p>
 <p><a href="/index.jsp">홈</a></p>
</c:if>
=======
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
		<!-- Header End -->
	</header>
<hr style="margin: 0px 0px;">
	<div
		style="width: 40%; padding-right: 15px; padding-left: 15px; margin-right: auto; margin-left: auto">
		<c:if test="${member==null}">
			<form method="post" action="loginOwner" >
			
				<div style="box-shadow: 0px 0px 9px #9c9c9c83; 
				border-radius: 20px; box-sizing: content-box; 
				padding : 10px 5px 10px 5px; margin-top: 30px; text-align: center;">
					<div style="text-align: center center; font-size: 28px; 
					color: #0F61EF; font-style: bold; padding-top: 20px">LOGIN</div>
					<hr>
					<p>
				<input type="text"
							id="owner_email" name="owner_email" placeholder="이메일" />
					</p>
					<p>
						 <input type="password"
							id="owner_password" name="owner_password" placeholder="비밀번호" />
					</p>
					<span style="float: left; padding-left: 10px;"> <input type="checkbox">
						로그인 유지하기
					</span> 
				
				<span style="float: right; cursor:pointer; 
				text-decoration-line: underline; padding-right: 10px; color: #0F61EF;" 
				onclick="location.href='findPasswordOwner'">비밀번호 찾기
					</span><br>
					<br>
					<p>
						<button type="submit" class="btn header-btn">로그인</button>
					</p>
					회원이 아니신가요? <div onclick="location.href='joinForm'" 
					style="text-decoration-line: underline; color: #0F61EF; cursor:pointer;" >회원가입</div>
				<br>
				</div>
			</form>

		</c:if>
	</div>

	<c:if test="${msg == false}">
		<p style="color: #f00;">로그인에 실패했습니다. 아이디 또는 패스워드를 다시 입력해주십시오.</p>
	</c:if>
	<c:if test="${member !=null}">
		<p>${member.owner_name}님환영합니다.</p>
		<p>
			<a href="logoutOwner">로그아웃</a>
		</p>

	</c:if>

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

>>>>>>> 7ab148780a70451ffd351f036b57280d58c39cf1
</body>
</html>