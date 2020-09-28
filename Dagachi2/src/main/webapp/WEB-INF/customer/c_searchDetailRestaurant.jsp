<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>

<style>
div {
	margin-top: 10px;
}

/* div#sort_order{
	float: left;
	overflow: hidden;
} */
ul#sort li {
	list-style: none;
	display: inline-block;
	text-decoration: underline;
	margin-right: 10px;
}

ul#headMenu {
	float: left;
}

ul#headLogo {
	float: center;
}

ul#headLogin {
	float: right;
}

div#detailSearch {
	margin-top: 20px;
	width: 900px;
	height: 60px;
}

ul#detail_search {
	position: relative;
	z-index: 100;
	background-color: white;
	width: 600px;
	height: 100px;
}
/* ul li a {
	float:left;
	padding:4px;
	margin-right:3px;
	width:15px;
	color:#000;
	font:bold 12px tahoma;
	border:1px solid #eee;
	text-align:center;
	text-decoration:none;
}
ul li a:hover, ul li a:focus {
	color:#fff;
	border:1px solid #f40;
	background-color:#f40;
} */
div#container_wrap {
	z-index: 200;
	position: relative;
}

div#header_wrap {
	width: 1100px;
	height: 100px;
	margin-bottom: 20px;
}

div#menu_wrap {
	width: 1100px;
	z-index: 5;
}

div#header_menu1234 {
	float: left;
}

div button {
	background-color: white;
	border-color: white;
	boder: 0;
	outline: 0;
}

div#logo {
	width: 900px;
	height: 100px;
	overflow: hidden;
}

div#login {
	width: 100px;
	height: 80px;
	margin-top: -40px;
}

.zeta-menu-bar {
	background: white;
	display: inline-block;
	width: 100%;
	border-bottom: 1px solid black;
}

.zeta-menu {
	margin: 0;
	padding: 0;
}

.zeta-menu li {
	float: left;
	list-style: none;
	position: relative;
}

.zeta-menu li:hover {
	background: rgb(233, 99, 96);
}

.zeta-menu li:hover>a {
	color: white;
}

.zeta-menu a {
	color: rgb(233, 99, 96);
	display: block;
	padding: 10px 20px;
	text-decoration: none;
}

.zeta-menu ul {
	background: #eee;
	border: 1px solid black;
	display: none;
	padding: 0;
	position: absolute;
	left: 0;
	top: 100%;
	width: 180px;
}

.zeta-menu ul li {
	float: none;
}

.zeta-menu ul li:hover {
	background: #ddd;
}

.zeta-menu ul li:hover a {
	color: black;
}

.zeta-menu ul a {
	color: black;
}

.zeta-menu ul ul {
	left: 100%;
	top: 0;
}

.zeta-menu ul ul li {
	float: left;
	margin-right: 10px;
}

div#content_wrap2 {
	width: 1300px;
	height: 900px;
	boder: 3px solid black;
	margin-top: -5px;
	margin: 0 auto;
}

div#content_wrap3 {
	width: 1100px;
	height: 700px;
	border: 1px solid black;
}

div#content_wrap4 {
	width: 600px;
	height: 600px;
	border: 1px solid black;
	float: left;
	overflow: hidden;
	margin: 10px;
	margin-top: -10px;
	margin-left: 20px;
	margin-right: 10px;
	margin-bottom: 20px;
}

div#side_wrap {
	margin: -10px;
}

div#map {
	border: 1px solid black;
	z-index: 8;
	margin-left: 0px;
	margin-top: -5px;
	margin-right: 10px;
	position: fixed;
}

input#logout {
	float: right;
	margin-top: 40px;
	background-color: rgb(233, 99, 96);
	border: none;
	display: inline-block;
	border-radius: 3px;
	font-size: 12px;
	color: white;
	padding: 10px 8px;
}

input#reservationMenu {
	background-color: rgb(233, 99, 96);
	border: none;
	color: white;
	padding: 15px 30px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
	border-radius: 5px;
}

input#spreadBtn01 {
	width: 650px;
	height: 20px;
}

ul.pagination li {
	float: left;
	list-style: none;
}

#sidebar {
	background: rgb(233, 99, 96);
	width: 250px;
	height: 100%;
	top: 0;
	left: -250px;
	position: fixed;
	z-index: 17;
}

#sidebar>ul {
	margin: 0;
	margin-left: -50px;
	padding: 0;
	top: 50px;
	left: 57px;
	position: absolute;
}

#sidebar li {
	margin: 0 0 18px;
	list-style: none;
	color: #F5FCFB;
	width: 250px;
	font-weight: 900;
}

#sidebar>button {
	background: white;
	position: absolute;
	top: 20px;
	left: 250px;
	width: 70px;
	height: 70px;
	border: 3px;
	border-bottom-color: gray;
	color: #F5FCFB;
	text-align: center;
	outline: 3px;
	vertical-align: middle;
}
</style>
<script
	src="<c:url value="http://code.jquery.com/jquery-3.5.1.min.js" />"></script>
<script>
	//펼치기 부분
	$(document).ready(function() {
		$("#spreadBtn02").click(function() {
			if ($("#detail_search").is(":visible")) {
				$("#detail_search").slideUp();
			} else {
				$("#detail_search").slideDown();
			}
		});
	});
</script>
<!-- 슬라이드 메뉴 -->
<script>
	$(function() {
		var duration = 200;

		var $side = $('#sidebar');
		var $sidebt = $side.find('button').on('mousedown', function() {
			$side.toggleClass('open')

			if ($side.hasClass('open')) {
				$side.stop(true).animate({
					left : '0px'
				}, duration).blur();
				$sidebt.find('span').text('CLOSE');
			} else {
				$side.stop(true).animate({
					left : '-250px'
				}, duration).blur();
				$sidebt.find('span').text('OPEN');
			}
			;

		});

	});
</script>
</head>

<body>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script>
		$(document)
				.on(
						'click',
						'#searchBtn',
						function(e) {

							e.preventDefault();

							var select_chk = '';
							$('input[type="checkbox"]:checked').each(
									function(index) {

										select_chk += "&select_chk="
												+ $(this).val();

									});

							var url = "${pageContext.request.contextPath}/customer/c_searchDetailRestaurant";

							url = url + "?searchType=" + $('#searchType').val();

							url = url + "&searchType2="
									+ $('#searchType2').val();

							url = url + "&keyword=" + $('#keyword').val();

							url = url + select_chk;

							url = url + "&range=" + $('#range').val();

							location.href = url;

							console.log(url);

						});
	</script>
	<div id="container_wrap" align="center">
		<div id="header_wrap">
			<div id="header_menu1234">
				<div class="dropdown">
					<aside id="sidebar">
						<ul>
							<li><b>예약하기</b></li>
							<li><b>내주변 음식점 보기</b></li>
							<li><b>내정보</b></li>
							<li><b>문의사항</b></li>
							<br>
							<br>
						</ul>
						<button id="menubtn">
							<img
								src="<%=request.getContextPath()%>/resources/images/dropMenu.png"
								" style="width: 60px; height: 40px;">
						</button>
					</aside>
				</div>
			</div>
			<div id="logo" align="center" style="margin-top: 20px">
				<a href="/index.jsp"><img
					src="<%=request.getContextPath()%>/resources/images/logo_bar_White.jpg" /></a>

				<!-- <input type="button" id="logout" value="로그아웃"> -->
			</div>
		</div>
	</div>
	<div id="content_wrap1" align="center" style="margin-top: -20px">
		<div id="menu_wrap" class="menu_wrap">
			<select class="form_area" id="searchType" name="searchType"
				style="width: 100px; height: 30px;">
				<option value="서울" selected>서울</option>
				<option value="경기">경기</option>
				<option value="부산">부산</option>
				<option value="제주">제주</option>
				<option value="대구">대구</option>
				<option value="대전">대전</option>
				<option value="광주">광주</option>
				<option value="전주">전주</option>
				<option value="울산">울산</option>
			</select> <select class="form_area" id="searchType2" name="searchType2"
				style="width: 100px; height: 30px;">
				<option value="한식">한식</option>
				<option value="양식">양식</option>
				<option value="중식">중식</option>
				<option value="일식">일식</option>
				<option value="분식">분식</option>
				<option value="디저트">디저트</option>
				<option value="기타">기타</option>
			</select> <input class="form_area" type="text" size="20px" id="keyword"
				name="keyword" style="height: 30px;" placeholder="검색어를 입력하세요" />
			<button id="searchBtn" class="btn btn-primary">Search</button>
		</div>
	</div>

	<div id="content_wrap2" align="center">
		<div id="content_wrap3">
			<!-- 펼치기 부분 -->
			<div id="detailSearch" align="center">
				<input type="text" value="상세선택" readonly="readonly" id="spreadBtn01" />
				<button id="spreadBtn02" class="btn01">v</button>
				<ul id="detail_search" class="example01" style="display: none;">
					<li>인원(단위:명)<input type="range" id=range name="range"
						value="1" min="1" max="30">
					<li>분위기 | 데이트<input type="checkbox" id="dating" name="dating"
						value="dating"> 가족<input type="checkbox" id="family"
						name="family" value="family"> 친구<input type="checkbox"
						id="friend" name="friend" value="friend"> 단체<input
						type="checkbox" id="groupReserv" name="groupReserv"
						value="groupReserv" checked="checked">
					<li>주차장<input type="checkbox" id="park" name="park"
						value="park">
					<li>유아놀이방<input type="checkbox" id="playGround"
						name="playGround" value="playGround">
				</ul>
			</div>
			<div id="content_wrap4">
				<div id="list">
					<div>"${map.count}"개의 지점이 있습니다</div>
					<c:set var="i" value="0" />
					<c:set var="j" value="3" />
					<c:forEach var="name" items="${map.listAll}">
						<c:if test="${i%j == 0}">
							<tr>
						</c:if>
						<td><a
							href="/customer/c_restaurantDetail?owner_Num=${name.owner_Num}">
								<img style="height: 50%; width: 50%;"
								src="/resources<%=request.getContextPath()%>${name.restaurant_Pic}"><br>${name.restaurant_Name}</a>
						</td>
						<c:if test="${i%j == j-1 }">
							</c:if>
						<c:set var="i" value="${i+1 }" />
				</c:forEach>
				</div>
			</div>
			
					

			<div align="center">
				<c:if test="${map.infoList.count > 0}">
					<c:if test="${map.infoList.p.beginPageNumber > 10}">
						<a
							href="c_searchDetailRestaurant?p=${map.infoList.p.beginPageNumber-1}">이전</a>
					</c:if>
					<c:forEach var="pno" begin="${map.infoList.p.beginPageNumber}"
						end="${map.infoList.p.endPageNumber}">
						<a href="c_searchDetailRestaurant?p=${pno}">[${pno}]</a>
					</c:forEach>
					<c:if
						test="${map.infoList.p.endPageNumber < map.infoList.p.totalPageCount}">
						<a
							href="c_searchDetailRestaurant?p=${map.infoList.p.endPageNumber + 1}">다음</a>
					</c:if>
				</c:if>
			</div>
		</div>
		<div id="side_wrap">
			<div id="map" style="width: 38%; height: 64vh;">
				<script async defer
					src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCV44_6sqY_--AaNVWXRkSuBDlJ9nFmTEw&callback=initMap&region=kr">
					
				</script>
				<script
					src="<%=request.getContextPath()%>/resources/js/mapscript.js"></script>
			</div>
		</div>
	</div>
	</div>
</body>
</html>


