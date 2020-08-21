<%@page import="java.util.function.Function"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.*, java.text.*"  %>

<!DOCTYPE html>
<html>
<head>
<title>공지사항 작성</title>
<script>

function chk() {

	var d = document.forms.noticeWrite;

	if(d.owner_Notice_Title.value.trim() == "") {
		
		alert("제목을 입력해주세요");
		d.owner_Notice_Title.focus();
		return false;
		}
	else if(d.owner_Notice_Content.value.trim() == "") {
		alert("내용을 입력해주세요");
		d.owner_Notice_Content.focus();
		return false;
		}
	else {
		alert("공지사항이 등록되었습니다.")
		}
}
function insert() {
	alert("공지사항이 등록되었습니다.")
}

	var now = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();

	if(dd<10) {
  	  dd='0'+dd
	} 

 </script>
</head>
<body>
<form id="noticeWrite" action="noticeWrite" method="post" onsubmit="return chk()">
 	<table border="" align="center">
 	<thead>
 		<th style="background-color: #ADD0E0;">공지사항 작성</th>
	</thead>
	<td>
	<p style="padding-right: 4px; padding-left: 4px;"><b> 제목 :</b> <input type="text" id="owner_Notice_Title" name="owner_Notice_Title">
	<input type="text" style="float: right;width: 80px;background-color: #D0CECD;padding-left: 10px;"
	value="<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" />" readonly="readonly">
	</p>
	<p style="padding-right: 4px; padding-left: 4px;">
	<b> 작성자 : </b><input type="text" id="admin_Num" name="admin_Num" style="background-color: #D0CECD"><br/></p>
	<textarea rows="20px" cols="80px" id="owner_Notice_Content" name="owner_Notice_Content" ></textarea>
 	<br/> 
 	<p style="padding-right: 4px; padding-left: 4px;" align="right">
 	<input type="submit" value="등록"> 
 	<input type="button" value="목록" onclick="history.go(-1)">
 	<input type="button" value="취소" onclick="history.go(-1)">
 	</p>
 	</table>
 </form>
</body>
</html>