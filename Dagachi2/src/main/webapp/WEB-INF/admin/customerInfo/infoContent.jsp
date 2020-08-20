<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${info.customer_name}의 정보</title>
<style type='text/css'>
<!--
a:link { color:black; text-decoration:none; }
a:visited {  }
a:active { text-decoration:underline; }
a:hover { text-decoration:underline; background-image:url('text_dottdeline.gif'); background-repeat:repeat-x; background-position:50% 100%; }
-->
</style>
<style>
<!--
@font-face {font-family:굴림; src:url();}
body,td,a,div,p,pre,input,textarea {font-family:굴림;font-size:9pt;}
-->
</style>

</head>
<center>
<body>
	<b>${info.customer_name}의 정보</b>
	<table width="700" border="3" cellspacing="0" cellpadding="0" align="center"> 
	<input type="hidden" name="p" value="${pageNum}"></td>
	<tr height="30">
		<td align="center" width="125">이름</td>
		<td align="center" width="200" align="center">${info.customer_name}</td>
		<td align="center" width="125">이메일</td>
		<td align="center" width="300">${info.customer_email}</td>
	</tr>
		<tr height="30">
	<td align="center" width="125">생년월일</td>
	<td align="center" width="125">
	<fmt:formatDate value="${info.customer_birth}" pattern="yyyy.MM.dd"/>
	<td align="center" width="125">가입일자</td>
	<td align="center" width="200" align="center">
	<fmt:formatDate value="${info.customer_Join_Date}" pattern="yyyy.MM.dd"/>
	</td>
	<tr height="30">
		<td align="center" width="125">Phone</td>
		<td align="center" width="125" align="center">${info.customer_phoneNumber}</td>
		<td align="center" width="125">성별</td>
		<td align="center" width="125" align="center">${info.customer_gender}</td>
	</tr>


<tr height="30">  
	<td align="center" width="125"  colspan="4" ><input type="button" value="목록으로"
		onclick="document.location.href='infoList'">
</td>

	</tr>
</body>
</html>