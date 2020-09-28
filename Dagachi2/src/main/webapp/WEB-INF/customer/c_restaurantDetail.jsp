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

div#container_wrap{
	z-index:200;
	position: relative;
}

div#header_wrap{
	width: 1100px;
	height: 100px;
	margin-bottom: 20px;
}

div#imageBar{
	width:1100px;
	height: 300px;
	margin: auto;
	margin-top: -10px;
}

div#menu_wrap{
	width:1100px;
	z-index: 5;
}

div#header_menu1234{
	float: left;
}

div button{
	background-color: white;
	border-color: white;
	boder:0;
	outline: 0;
} 
		
div#logo{
	width: 1000px;
	height: 100px;
	overflow: hidden;
}

div#login{
	width: 100px;
	height: 80px;
	margin-top: -40px;
}
.zeta-menu-bar {
  background: white;
  display: inline-block;
  width: 100%;
  border-bottom: 1px solid black;
  margin-bottom: -10px;
}
.zeta-menu { margin: 0; padding: 0; }
.zeta-menu li {
  float: left;
  list-style:none;
  position: relative;
}
.zeta-menu li:hover { background: rgb(233,99,96); }
.zeta-menu li:hover>a { color:white; }
.zeta-menu a {
  color: rgb(233,99,96);
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

.zeta-menu ul li { float: none; }
.zeta-menu ul li:hover { background: #ddd; }
.zeta-menu ul li:hover a { color: black; }
.zeta-menu ul a { color: black; }
.zeta-menu ul ul { left: 100%; top: 0; }
.zeta-menu ul ul li {float:left; margin-right:10px;}

div#content_wrap2{
	width: 1300px;
	height: 900px;
	boder: 3px solid black;
	margin-top: -5px;
}

div#content_wrap3{
	width: 1100px;
	height: 700px;
	border: 1px solid black;
	
}

div#content_Restaurant_Detail{
	margin-top: 20px;
	margin-left: 20px;
	float: left;
	overflow: hidden;
	z-index: 8;
}

input#logout{
	float: right;
	margin-top: 5px;
	background-color: rgb(233,99,96);
  	border: none;
  	display: inline-block;
  	border-radius: 3px;
  	font-size: 10px;
	color: white;
	padding: 9px 8px;
}

input#reservationMenu {

  background-color: rgb(233,99,96);
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
      background: rgb(233,99,96);
      width: 250px;
      height: 100%;
      top: 0;
      left: -250px;
      position: fixed;
      z-index: 17;
   }
   #sidebar > ul {
      margin:0;
      margin-left: -50px;
      padding: 0;
      top:50px;
      left:57px;
      position: absolute;
   }
   #sidebar li {
      margin: 0 0 18px;
      list-style: none;
      color: #F5FCFB;
      width: 250px;
      font-weight: 900;
   }
   
#sidebar > button {
      background-color: rgba( 255, 255, 255, 0 );
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
      
#content_Restaurant_Introduce{
	color: black;
	font-size: 16px;
	resize: none;
	margin: 0px;
	border-top: 1px solid black;
	border-bottom: 1px solid black;	
	border-left: 0px;
	border-right: 0px;
	margin-bottom: 10px;
}

div#content_Restaurant_List{
	height: 600px;
	width: 850px;
	float: left;
	overflow: hidden;
	
}
/* img#content_Restaurant_List1{
	position:relative;
	float:left;
	margin:5px;
	margin-left:31px;
	width: 200px;
	height: 220px;
}
img#content_Restaurant_List2{
	position:relative;
	float:left;
	margin:5px;
	margin-left:31px;
	width: 200px;
	height: 220px;
}
img#content_Restaurant_List3{
	position:relative;
	float:left;
	margin:5px;
	margin-left:31px;
	width: 200px;
	height: 220px;
} */

</style>

<script src="<c:url value="http://code.jquery.com/jquery-3.5.1.min.js" />" ></script> 
<!-- 메뉴바 -->
<script>
$(function(){
  $(".zeta-menu li").click(function(){
    $('ul:first',this).show();
  }, function(){
    $('ul:first',this).hide();
  });
  $(".zeta-menu>li:has(ul)>a").each( function() {
    $(this).html( $(this).html()+' &or;' );
  });
  $(".zeta-menu ul li:has(ul)")
    .find("a:first")
    .append("<p style='float:right;margin:-3px'>&#9656;</p>");
});
</script>
<!-- 슬라이드메뉴 -->
<script>

   $(function(){
      var duration = 200;


      var $side = $('#sidebar');
      var $sidebt = $side.find('button').on('mousedown', function(){
         $side.toggleClass('open')

         if($side.hasClass('open')) {
            $side.stop(true).animate({left:'0px'}, duration).blur();
            $sidebt.find('span').text('CLOSE');
         }else{
            $side.stop(true).animate({left:'-250px'}, duration).blur();
            $sidebt.find('span').text('OPEN');
         };
         
      });

   });

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
			            <br/>
			            <br/>
			         </ul>
			         <button id="menubtn">
			         <img src="<%=request.getContextPath()%>/resources/images/dropMenu.png"" style="width:60px; height: 40px;">
			         </button>
			         </aside>
			</div>
		</div>
		<div id="logo" align="center" style="margin-top: 20px">
		<a href="/index.jsp"><img src="<%=request.getContextPath()%>/resources/images/logo_bar_White.jpg"/></a>
		<!-- <input type="button" id="logout" value="로그아웃"> -->
		</div>
		</div>
		</div>
	<div id="imageBar" align="center">
		<img id="imageBar" src="<%=request.getContextPath()%>/resources/images/Rest_image/image_cafe02.JPG" style="width:1000px; height: 300px;">
	</div>
	<div id="content_wrap1" align="center" style="margin-top: -20px">
	<div id="menu_wrap">
		<div class='zeta-menu-bar'>
		  <ul class="zeta-menu">
		    <li><a href="#">정보</a></li>
		    <li><a href="#">리뷰</a></li>
		    <li><a href="/customer/c_restaurantMenu?owner_Num=${list.owner_Num}">메뉴</a></li>
		    <li><a href="/customer/c_Map?owner_Num=${list.owner_Num}">지도</a></li> 
		  </ul>
		</div>
		</div>	
		
		<div id="content_wrap2">
		<div id="content_wrap3">
				<div id="content_Restaurant_Detail">
				 	매장 소개<br><br>
				 	<!-- <textarea id="content_Restaurant_Introduce" style="width: 740px; height: 350px;" readonly="readonly">
				 	이런 매장입니다
				 	</textarea> -->
				 	
				 	
						<div id="content_Restaurant_List"><img style="height: 100%; " src="/resources<%=request.getContextPath()%>${list.restaurant_Pic}"></div>
					
				</div>
				 	<%-- <div id="content_Restaurant_List">
					 	<div id="content_Restaurant_List1">${name.restaurant_Name}
					 	<img id="content_Restaurant_List1" alt="음식점1" src="<%=request.getContextPath()%>/resources/images/Rest_image/image_bar.JPG" >
					 	</div>
					 	<div id="content_Restaurant_List2">${name.restaurant_Name}
					 	<img id="content_Restaurant_List2" alt="음식점2" src="<%=request.getContextPath()%>/resources/images/Rest_image/image_bar02.JPG" >
					 	</div>
					 	<div id="content_Restaurant_List3">${name.restaurant_Name}
					 	<img id="content_Restaurant_List3" alt="음식점3" src="<%=request.getContextPath()%>/resources/images/logo_Emb_Grapefruit.jpg" >
					 	</div>
				 	</div> --%>
				
				
			<div id="side_wrap">
				<br>
				<br>
				<img alt="찜하기" src="<%=request.getContextPath()%>/resources/images/image_heart.jpg" style="width:120px; height: 90px;"/><br>
				<br>
				<input type="button" id="reservationMenu" value="예약하기">
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