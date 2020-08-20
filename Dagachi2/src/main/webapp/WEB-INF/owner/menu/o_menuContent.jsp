<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>메뉴 콘텐츠</title>
</head>
<body>
<c:forEach items="${menuContent}" var="menuContent">
<h4 style="text-align:center">메뉴 설명</h4>
<table width="1000" border="1" cellspacing="1" cellpadding="0" style="text-align: center;" align="center"> 

<tr><td colspan="2"><img src="/resources/${menuContent.menu_Pic}"/></td></tr>
<tr><td><label>메뉴 이름</label></td><td>${menuContent.menu_Name}</td></tr>
<tr><td><label>메뉴 가격</label></td><td>${menuContent.menu_Price}원</td></tr>
<tr><td><label>메뉴 설명</label></td><td>${menuContent.menu_Des}</td></tr>

</table>

<button onclick="location.href='modifyMenu?menu_Num=${menuContent.menu_Num}';">메뉴 수정</button>
<button id="btn_delete" >메뉴 삭제</button>





<script>
$(function(){
	$("#btn_delete").click(function(){
         var result = confirm("메뉴를 삭제하시겠습니까?");
		if(result){
			location.href="deleteMenu?menu_Num="+${menuContent.menu_Num};
			alert("삭제되었습니다.")
			}else{
				alert("취소되었습니다.")
				return false;
				}
		});
});
</script>
</c:forEach>
</body>
</html>