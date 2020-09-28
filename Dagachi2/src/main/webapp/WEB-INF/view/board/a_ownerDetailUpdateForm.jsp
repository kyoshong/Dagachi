<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>가맹 상세 정보</title>
<style>
nav#menu_wrap{
	position: relative;
	width: 1100px;
	height: 50px;
	border: 1px solid black;
	margin: 0 auto;
}

.zeta-menu-bar {
	margin: 0 auto;
	background: white;
	display: inline-block;
	width: 100%;
}
.zeta-menu { margin: 0; padding: 0; }
.zeta-menu li {
  float: left;
  list-style:none;
  position: relative;
}
.zeta-menu li:hover { background: #ddd; }
.zeta-menu li#logo_Emb:hover { background: white; }
.zeta-menu li:hover>a { color:black; }
.zeta-menu a {
  color: black;
  font-size: 20px;
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
  z-index:100;
}

.zeta-menu ul li { float: none; }
.zeta-menu ul li:hover { background: #ddd; }
.zeta-menu ul li:hover a { color: black; }
.zeta-menu ul a { color: black; }
.zeta-menu ul ul { left: 100%; top: 0; }
.zeta-menu ul ul li {float:left; margin-right:10px;}

li#logo_Emb{
	float: left;
	width: 100px;
	height: 100px;
	margin: 0;
}
#logo_Emb{
	width: 100px;
	height: 50px;
}
a#logo_Emb{
	padding: 0px;
}

#down_menu{
	font-size: 15px;
}


div#updateInfoForm_content{
	width: 1100px;
	height: 600px;
	border: 1px solid black;
	margin: 0 auto;
	margin-top: 50px;
	
}
div#updateInfoForm_content_title{
	width: 162px;
	position: relative;
	margin-left: 50px;
	margin-top: -15px;
	font-size: 24px;
	background: white;
	z-index:10;
}
div#updateInfoForm{
	width: 800px;
	height: 500px;
	border: 7px solid #ddd;
	margin: 0 auto;
	margin-top: 30px;
}
div#table_content{
	margin-left: 15px;
}
</style>
<script>
 function deleteSave(form) {
	if(confirm("삭제 하시겠습니까?")){
		alert("삭제 되었습니다");
		form._method.value="post"
		form.action="deleteInfo";
		form.submit();
		
		} else{
			alert("취소되었습니다");
			return false;
		}
} 
 function updateSave(form) {
		if(confirm("수정 하시겠습니까?")){
			alert("수정 되었습니다");
			form.action="updateInfo";
			form.submit();
			
			} else{
				alert("취소되었습니다");
				return false;
			}
	} 
</script>
<script src="http://code.jquery.com/jquery-3.5.1.min.js" ></script>
<!-- 메뉴바 -->
<script>
        $(function() {
            $(document).mouseup(function(e) {
                if ($(e.target).parents('.zeta-menu').length == 0) {
                    $('.zeta-menu li').removeClass('expand');
                    $('.zeta-menu ul').hide();
                }
            });
            $(".zeta-menu>li:has(ul)>a").each(function() {
                $(this).html($(this).html());
            });
            $(".zeta-menu ul li:has(ul)")
                .find("a:first")
                .append("<p style='float:right;margin:-3px'>&#9656;</p>");
 
            $(".zeta-menu li>a").click(function() {
                var li = $(this).parent();
                var ul = li.parent()
                ul.find('li').removeClass('expand');
                ul.find('ul').not(li.find('ul')).hide();
                li.children('ul').toggle();
                if (li.children('ul').is(':visible') || li.has('ul')) {
                    li.addClass('expand');
                }
            });
        });
    </script>
</head>
<body>
<div align="center"></div><br>
	<nav id="menu_wrap">
			<div class='zeta-menu-bar'>
			  <ul class="zeta-menu">
			    <%-- <li><a id="logo_Emb" onclick="window.location.reload()"><img  id="logo_Emb" src="<%=request.getContextPath()%>/resources/images/logo_Emb_White_Mini.jpg" ></a></li> --%>
			    <li><a id="logo_Emb" href="/index.jsp"><img  id="logo_Emb" src="<%=request.getContextPath()%>/resources/images/logo_Emb_White_Mini.jpg" ></a></li>
			    <li><a href="#0">회원관리</a>
			    	<ul>
			    	<li><a id="down_menu" href="#0A">회원 문의사항</a></li>
                    <li><a id="down_menu" href="#0B">회원 정보</a></li>  
                    <li><a id="down_menu" href="#0C">회원 리뷰</a></li>  
                    </ul>
			    <li><a href="#1">가맹점관리</a>
			    	<ul>
			    	<li><a id="down_menu" href="a_ownerReceiptList">신규 가맹 접수 확인</a></li>
                    <li><a id="down_menu" href="a_ownerDetailInfoList">가맹 상세 정보</a></li>  
                    <li><a id="down_menu" href="#1C">가맹 문의 사항 목록</a></li>  
                    </ul>
			    <li><a href="#2">관리자정보</a>
			    	<ul>
			    	<li><a id="down_menu" href="#2A">공지사항 관리</a></li>
                    <li><a id="down_menu" href="#2B">관리자 계정 관리</a></li>  
                    </ul>
                 </ul>
			</div>
			</nav>
			
<div id="updateInfoForm_content">
<div id="updateInfoForm_content_title">가맹 상세 정보</div>
<div id="updateInfoForm">
<form id="updateInfoForm" method="post">
<table width="800" height="500" border="1" cellspacing="0" cellpadding="0" align="center"> 
    <tr height="30">
    <td align="left" width="125" ><br>기본정보<br><br>
  <div id="table_content"> 
    상호명: <input type="text" name="restaurant_Name" value="${articleInfo.restaurant_Name}" readonly="readonly" size="20"><br><br>
   	대표자 성명: <input type="text" name="owner_name" value="${articleInfo.owner_name}" readonly="readonly" size="5"><br><br>
    주민등록번호: <input type="text" name="owner_SecurityNum" value="${articleInfo.owner_SecurityNum}" readonly="readonly" size="13"><br><br>
    사업자 등록 번호: <input type="text" value="${articleInfo.restaurant_Num}" readonly="readonly" size="8"><br><br>
    주소지: <input type="text" name="restaurant_Address" value="${articleInfo.restaurant_Address}" size="40"><br><br>
    상세주소: <input type="text" name="restaurant_detail_Address" value="${articleInfo.restaurant_detail_Address}" size="40"><br><br>
    대표자 연락처: <input type="text" name="owner_phonenumber" value="${articleInfo.owner_phonenumber}" ><br><br>
    E-mail 계정: <input type="text" name="owner_email" value="${articleInfo.owner_email}" readonly="readonly"><br><br>
    가입 날짜: <input type="text" name="owner_Join_Date" readonly="readonly" value=<fmt:formatDate value="${articleInfo.owner_Join_Date}" pattern="yyyy-MM-dd"/>><br><br>

    <input type="hidden" name="_method" value="post" id="_method"/>
    <input type="hidden" name="restaurant_Num" value="${articleInfo.restaurant_Num}"/>
    <input type="hidden" name="owner_password" value="${articleInfo.owner_password}"/>
    <input type="hidden" name="owner_num" value="${articleInfo.owner_num}"/>
   
   <div align="center">
    <input type="button" onclick="return updateSave(this.form)" value="수정"/>
    &nbsp;&nbsp;
    <input type="button" onclick="return deleteSave(this.form)" value="삭제"/>
    </div>
    </div>
       </td>
  </tr>
</table>   
</form>
</div>
</div>
</body>
</html>