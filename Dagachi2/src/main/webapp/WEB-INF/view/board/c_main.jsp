<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link href="../resources/Carousel.css" rel="stylesheet" type="text/css">
<meta charset="EUC-KR">
<title>홈페이지 메인</title>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<style type="text/css">


	body {
		background:#E98583;
		margin: 0;
		padding: 0;
		background: rgba(243,129,129,0.9); /* fallback for old browsers */ /* Chrome 10-25, Safari 5.1-6 */
  		background: -webkit-linear-gradient(top, rgba(243,129,129,0.9), rgba(252, 227, 138, 0.9));
   		background: -o-linear-gradient(top, rgba(243,129,129,0.9), rgba(252, 227, 138, 0.9));
   		background: linear-gradient(to bottom, rgba(243,129,129,0.9), rgba(252, 227, 138, 0.9));
   		
	}
	#mainLogo {
		width:100%;
		height:110px;
		background:white;
	}
	#sideWrap {
		width:100%;
		height:100px;
		background:#E98583;
	} 
	#sidebar {
		background: #BE6C84;
		width: 250px;
		height: 100%;
		top: 0;
		left: -250px;
		position: fixed;
		z-index: 17;
	}
	#sidebar > ul {
		margin:0;
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
		/* text-shadow: -0.5px 0 #B49279, 0 0.5px #B49279, 0.5px 0 #B49279, 0 -0.5px #B49279; */
		/* text-shadow: 1px 1px #4ECDB7, 1px 1px #4ECDB7, 1px 1px #4ECDB7, 1px 1px #4ECDB7 ; */
	}
	#sidebar > button {
		background:#BE6C84;
		position: absolute;
		top: 150px;
		left: 250px;
		width: 54px;
		height: 54px;
		border: 3px;
		border-bottom-color: gray;
		color: #F5FCFB;
		text-align: center;
		outline: 3px;
		vertical-align: middle;
		box-shadow: 1px 1px 1px 1px #665F79;
		}
	#footer {

    position:absolute;

    bottom:0;

    width:100%;
   
	top: 780px;
	align-content: center;
}

	#middleimg {
	

	 bottom:0;
	 width:100%;
	align-content: center;
	}
	
	img {
	margin-left: -50.5%;
	}
	#login {
    width:178px;
    background-color: #f8585b;
    border: none;
    color:#fff;
    padding: 10px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px;
    cursor: pointer;
}
 	#signup, #login {
  	width:88px;
    background-color: #f8585b;
    border: none;
    color:#fff;
    padding: 10px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px;
    cursor: pointer;
}
	#middlestick {
  	width:10px;
    background-color: #f8585b;
    border: none;
    color:#fff;
    padding: 10px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px;
    cursor: pointer;
    height: 20px;
}

</style>
		
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">

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

	
	/* $(document).mousedown(function (e){

		var container = $("#wrap");

		var side = $("#sidebar");
		var sidebt = side.find('button')
		if( container.has(e.target).length === 0) {
			side.stop(true).animate({left:'-250px'}, 200);
			sidebt.find('span').text('OPEN');
		}
		}); */
	
</script>
	
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> 
<script src="../resources/jquery.cloud9carousel.js"></script> 
<script src="../resources/jquery.reflection.js"></script>
<script>
$(function() {
var showcase = $("#showcase")

showcase.Cloud9Carousel( {
yPos: 62,
yRadius: 70,
xRadius:600,
mirrorOptions: {
gap: 0.5,
height: 0.2

},
buttonLeft: $(".nav > .left"),
buttonRight: $(".nav > .right"),
autoPlay: true,
bringToFront: true,
/* onRendered: showcaseUp<a href="https://www.jqueryscript.net/time-clock/">date</a>d */
onLoaded: function() {
showcase.css( 'visibility', 'visible' )
showcase.css( 'display', 'none' )
showcase.fadeIn( 1500 )
}
} )

function showcaseUpdated( showcase ) {
var title = $('#item-title').html(
$(showcase.nearestItem()).attr( 'alt' )
)

var c = Math.cos((showcase.floatIndex() % 1) * 2 * Math.PI)
title.css('opacity', 0.5 + (0.5 * c))
}

// Simulate physical button click effect
$('.nav > button').click( function( e ) {
var b = $(e.target).addClass( 'down' )
setTimeout( function() { b.removeClass( 'down' ) }, 80 )
} )

$(document).keydown( function( e ) {

switch( e.keyCode ) {
/* left arrow */
case 37:
$('.nav > .left').click()
break

/* right arrow */
case 39:
$('.nav > .right').click()
}
} )
})
</script>

</head>
<body>

<!-- <button style="float: right;
margin-left: 20px;margin-right: 40px;margin-top: 100px;border-radius: 10px;margin-right:500px;
background: #665F79;position: absolute; float: right;z-index: 17;margin-left:1373px;" id="signup">회원가입</button>-->

<button style="float: right;
margin-left: 20px;margin-right: 40px;margin-top: 148px;border-radius: 10px;
background: #665F79;position: absolute; float: right;z-index: 17;margin-left:1357px;" id="signup">검색</button>

<button style=" width: 1000px;height:70px;margin-left: 460px;border-radius: 10px;
position: absolute;margin-top: 133px;border: none;outline: 0;background-color: #FFFFFF"></button>
	<!-- <i class="fas fa-map-marker-alt fa-3x" style="color: #C71700;position: absolute; 
	margin-left: 450px;margin-top: 100px;  width: 100px; height: 100px"></i> -->

	<div id="sideWrap" 
		style="background: rgba(243,129,129,0.9); margin-top: -20px;
  		/* background: -webkit-linear-gradient(top, rgba(252, 227, 138, 0.9), rgba(243,129,129,0.9)); */
   		/* background: -o-linear-gradient(top, rgba(252, 227, 138, 0.9), rgba(243,129,129,0.9)); */
   		/* background: linear-gradient(to bottom, rgba(252, 227, 138, 0.9), rgba(243,129,129,0.9)); */"> 
   		</div>
		<aside id="sidebar">
			<ul>
				<li><b>예약하기</b></li>
				<li><b>내주변 음식점 보기</b></li>
				<li><b>내정보</b></li> 
				<li><b>문의사항</b></li>
				<br/>
				<br/>
				<li><b>로그인</b></li>
				<li><b>회원가입</b></li>
			</ul>
			<button id="menubtn" style="border-bottom-right-radius: 20px 20px;border-top-right-radius: 20px 20px;padding-left: 5px;">
			<span class="btn_t"><b>OPEN</b></span></button>
			</aside>
	<!-- </div> -->
	<div align="center" id="showcase" style="position: absolute;z-index: 1;position: absolute; margin-top: 135px;
	background-color: #FFFFFF;outline: 0;box-shadow: 0px 0px 0px 0px;/* background-image: url('../resources/images/qw.jpg') */"> 
		<img class="cloud9-item" name="image" src="../resources/images/image_bar.JPG" width="330" height="230" style="margin-top: 68px;
		position: absolute;" alt="Alt">
		<img class="cloud9-item" name="image" src="../resources/images/image_dining02.JPG" width="330" height="230" style="margin-top: 68px;
		position: absolute;" alt="Alt" >
		<img class="cloud9-item" name="image" src="../resources/images/image_restaurant03.JPG" width="330" height="230" style="margin-top: 68px;
		position: absolute;" alt="Alt">
		<img class="cloud9-item" name="image" src="../resources/images/image_cafe.JPG" width="330" height="230" style="margin-top: 68px;
		position: absolute;" alt="Alt">
		<img class="cloud9-item" name="image" src="../resources/images/65NT8DZF9A535E4NX776.jpg" width="330" height="230" style="margin-top: 68px;
		position: absolute;" alt="Alt">
		<img class="cloud9-item" name="image" src="../resources/images/image_china.JPG" width="330" height="230" style="margin-top: 68px;
		position: absolute;" alt="Alt">
		<img class="cloud9-item" name="image" src="../resources/images/restaurant_01.jpg" width="330" height="230" style="margin-top: 68px;
		position: absolute;" alt="Alt">
		<img class="cloud9-item" name="image" src="../resources/images/0460.png_1200.png" width="330" height="230" style="margin-top: 68px;
		position: absolute;" alt="Alt">
		<img class="cloud9-item" name="image" src="../resources/images/200107191153993.jpg" width="330" height="230" style="margin-top: 68px;
		position: absolute;" alt="Alt">
	</div>
	 
	<p id="item-title">&nbsp;</p> 
	
	<!-- <div class="nav">
	<button class="left">←</button>
	<button class="right">→</button>
	</div> -->
	
	
	
	<ul style="margin-top: -70px; padding-bottom: 2px;">
	<li style="list-style: none;color: white;font-size: 12px;padding-left: 770px;">[About Us] | [Customer Service] | [Subscribe to RSS]</li> <br/>
	<li style="list-style: none;color: white;font-size: 12px;padding-left: 660px;">[Site Map] | [Search Terms] | [Advanced Search] | [Orders & Returns] | [Help] | [Contact Us]</li> <br/>
	 <li style="list-style: none;color: white;font-size: 12px;padding-left: 840px;">Copyright Information 2014</li>
	 </ul> 
	

</body>
</html>
