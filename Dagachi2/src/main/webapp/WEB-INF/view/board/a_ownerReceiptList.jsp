<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<title>신규 가맹 접수(전체 글:${a_ownerReceiptList.count})</title>
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

div#boardForm_content{
	width: 1100px;
	height: 400px;
	border: 1px solid black;
	margin: 0 auto;
	margin-top: 50px;
	
}
div#boardForm_title{
	width: 218px;
	position: relative;
	margin-left: 50px;
	margin-top: -15px;
	font-size: 24px;
	background: white;
	z-index:10;
}
form#boardForm{
	margin-top: 30px; 
}

</style>

<script src="<c:url value="http://code.jquery.com/jquery-3.5.1.min.js" />" ></script> 
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
<%-- <% request.setCharacterEncoding("UTF-8"); %> --%>
	<div id="boardForm_content">
		<div id="boardForm_title">신규 가맹 접수 확인</div>
	<form id="boardForm" name="boardForm" method="post">
		<table width="1000" border="1" cellspacing="0" cellpadding="0"
			align="center">
			<tr height="30">
				<td align="center" width="125">희망ID</td>
				<!-- owner_email -->
				<td align="center" width="125">담당자</td>
				<!-- owner_name -->
				<td align="center" width="125">상호</td>
				<!-- restaurant_Name -->
				<td align="center" width="125">연락처</td>
				<!-- owner_phonenumber -->
				<td align="center" width="125">가입신청날짜</td>
				<!-- owner_JoinRequest_Date -->
				<td align="center" width="125">등록상태</td>
				<td align="center" width="125">상세정보</td>
			</tr>
			<tbody>
				<c:if test="${a_ownerReceiptList.count == 0}">
					<center>신규 신청건이 없습니다</center>
				</c:if>
				<c:forEach var="article" items="${a_ownerReceiptList.boardList}" varStatus="status">
					<tr>
						<td align="center" width="125"><c:out
								value="${article.owner_email}" /></td>
						<td align="center" width="125"><c:out
								value="${article.owner_name}" /></td>
						<td align="center" width="125"><c:out
								value="${article.restaurant_Name}" /></td>
						<td align="center" width="125">${article.owner_phonenumber}</td>
						<td align="center" width="125">
						<fmt:formatDate value="${article.owner_JoinRequest_Date}" pattern="yyyy-MM-dd"/>
						</td>
						<td align="center" width="125">등록대기</td>
						<td align="center" width="125">
						<input type="button"
							value="수정/삭제" onclick="location.href='a_receiptPermitForm?pageNum=${a_ownerReceiptList.requestPage }&restaurant_Num=${article.restaurant_Num}'"></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
		<div align="center">
		<c:if test="${a_ownerReceiptList.count > 0}">
					<c:if test="${a_ownerReceiptList.p.beginPageNumber > 10}">
						<a href="a_ownerReceiptList?p=${a_ownerReceiptList.p.beginPageNumber-1}">이전</a>
					</c:if>
					<c:forEach var="pno" begin="${a_ownerReceiptList.p.beginPageNumber}"
						end="${a_ownerReceiptList.p.endPageNumber}">
						<a href="a_ownerReceiptList?p=${pno}">[${pno}]</a>
					</c:forEach>
					<c:if test="${a_ownerReceiptList.p.endPageNumber < a_ownerReceiptList.p.totalPageCount}">
						<a href="a_ownerReceiptList?p=${a_ownerReceiptList.p.endPageNumber + 1}">다음</a>
					</c:if>
				</c:if>
			</div>
	</form>
	</div>
</body>
</html>