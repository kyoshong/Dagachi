<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/resources/css/template.css" />"
	rel="stylesheet">
<style>
div {
	margin-top: 10px;
}

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
	width: 1000px;
	height: 100px;
	overflow: hidden;
}

div#login {
	width: 100px;
	height: 80px;
	margin-top: -40px;
}

div#RestaurantInfo {
	
}

.zeta-menu-bar {
	background: white;
	display: inline-block;
	width: 100%;
	border-bottom: 1px solid black;
	margin-bottom: -10px;
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
	font-size: 24px;
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
}

div#content_wrap3 {
	width: 1100px;
	height: 700px;
	border: 1px solid black;
}

div#map {
	margin-top: 20px;
	margin-left: 20px;
	float: left;
	overflow: hidden;
	border: 1px solid black;
	z-index: 8;
}

input#logout {
	float: right;
	margin-top: 5px;
	background-color: rgb(233, 99, 96);
	border: none;
	display: inline-block;
	border-radius: 3px;
	font-size: 10px;
	color: white;
	padding: 9px 8px;
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
	background-color: rgba(255, 255, 255, 0);
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
<!-- 메뉴바 -->
<script>
	$(function() {
		$(".zeta-menu li").click(function() {
			$('ul:first', this).show();
		}, function() {
			$('ul:first', this).hide();
		});
		$(".zeta-menu>li:has(ul)>a").each(function() {
			$(this).html($(this).html() + ' &or;');
		});
		$(".zeta-menu ul li:has(ul)").find("a:first").append(
				"<p style='float:right;margin:-3px'>&#9656;</p>");
	});
</script>
<!-- 슬라이드메뉴 -->
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

<script>
function initMap() {
    console.log('Map is initialized.');

   
    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 17,
        center: {
        	lat: 37.5642135 ,lng: 127.0016985
        }
    });

    /**
     * Google Geocoding. Google Map API에 포함되어 있다.
     */
    var geocoder = new google.maps.Geocoder();

    // submit 버튼 클릭 이벤트 실행
    document.getElementById('submit').addEventListener('click', function() {
        console.log('submit 버튼 클릭 이벤트 실행');

        // 여기서 실행
        geocodeAddress(geocoder, map);
    });

    /**
     * geocodeAddress
     * 
     * 입력한 주소로 맵의 좌표를 바꾼다.
     */
    function geocodeAddress(geocoder, resultMap) {
        console.log('geocodeAddress 함수 실행');

        // 주소 설정
        var address = document.getElementById('address').value;

        /**
         * 입력받은 주소로 좌표에 맵 마커를 찍는다.
         * 1번째 파라미터 : 주소 등 여러가지. 
         *      ㄴ 참고 : https://developers.google.com/maps/documentation/javascript/geocoding#GeocodingRequests
         * 
         * 2번째 파라미터의 함수
         *      ㄴ result : 결과값
         *      ㄴ status : 상태. OK가 나오면 정상.
         */
        geocoder.geocode({'address': address}, function(result, status) {
            console.log(result);
            console.log(status);

            if (status === 'OK') {
                // 맵의 중심 좌표를 설정한다.
                resultMap.setCenter(result[0].geometry.location);
                // 맵의 확대 정도를 설정한다.
                resultMap.setZoom(17);
                // 맵 마커
                var marker = new google.maps.Marker({
                    map: resultMap,
                    position: result[0].geometry.location
                });

                // 위도
                console.log('위도(latitude) : ' + marker.position.lat());
                // 경도
                console.log('경도(longitude) : ' + marker.position.lng());
            } else {
                alert('지오코드가 다음의 이유로 성공하지 못했습니다 : ' + status);
            }
        });
    }
}


</script>
<title>Insert title here</title>
</head>
<body>

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
							<br />
							<br />
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
		<div id="menu_wrap">
			<div class='zeta-menu-bar'>
				<ul class="zeta-menu">
					<li><a
						href="/customer/c_restaurantDetail?owner_Num=${list.owner_Num}">정보</a></li>
					<li><a href="#">리뷰</a></li>
					<li><a
						href="/customer/c_restaurantMenu?owner_Num=${list.owner_Num}">메뉴</a></li>
					<li><a href="#">지도</a></li>
				</ul>
			</div>
		</div>

		<div id="content_wrap2">
			<div id="content_wrap3">
				<div id="map" style="width: 70%; height: 70vh;">
					<script async defer
						src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAyQalmVGgCv0luJDmeFzF31c7q2jQ-5Jg&callback=initMap&region=kr&sensor=true">
						
					</script>
					<%-- <script src="<%=request.getContextPath()%>/resources/js/mapscript.js"></script> --%>
				</div>
				<div id="side_wrap">
					<br> <br> <img alt="찜하기"
						src="<%=request.getContextPath()%>/resources/images/image_heart.jpg"
						style="width: 120px; height: 90px;" /><br> <br> <input
						type="button" id="reservationMenu" value="예약하기">
					<div id="search-panel">
						<div align="center">${list.restaurant_Name}</div>
						<input id="address" type="text" value="${list.restaurant_Address}" /><br>
						<button id="submit" type="button" value="Geocode">지도 검색</button>
					</div>
					
					</div>

				</div>
			</div>
		</div>
		<script>
			function dropMenu() {
				document.getElementById("dropdown_content").classList
						.toggle("show");
			}

			window.onclick = function(event) {
				if (!event.target.matches('.dropdown_button')) {
					var dropdowns = document
							.getElementsByClassName("dropdown_content");
					var i;
					for (i = 0; i < dropdowns.length; i++) {
						var openDropdown = dropdowns[i];
						if (openDropdown.classList.contains('show')) {
							openDropdown.classList.remove('show');
						}
					}
				}
			}
		</script>
</body>
</html>