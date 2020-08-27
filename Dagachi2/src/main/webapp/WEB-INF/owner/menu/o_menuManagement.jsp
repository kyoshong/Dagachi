<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>메뉴 관리</title>
</head>
<body>
<button onclick="location.href='enrollMenu' ">메뉴 등록</button>

<h4 style="text-align:center">메뉴 목록</h4>
<table width="1000" border="1" cellspacing="1" cellpadding="0" style="text-align: center;" align="center"> 
<c:forEach items="${menuList}" var="menuList">
<tr onclick="location.href ='/menuManagement/menuContent?menu_Num=${menuList.menu_Num}'" style="cursor:pointer;">

<td><img src="/resources/${menuList.menu_Pic}"></td>
<td>${menuList.menu_Name}</td>
</tr>
</c:forEach>
</table>


</body>
</html>