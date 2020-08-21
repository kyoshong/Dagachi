<%@page import="java.util.function.Function"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<title>공지사항 수정</title>
<script>

function chk() {

	var d = document.forms.searchNoticeUpdate;

	if(d.owner_Notice_Title.value.trim() == "") {
		alert("제목을 입력해주세요");
		return false;
		}
	else if(d.owner_Notice_Content.value.trim() == "") {
		alert("내용을 입력해주세요");
		return false;
		}
	else {
		alert("수정되었습니다.")
		}
	
}

 </script>
 
</head>
<body>
<form id="searchNoticeUpdate" action="searchNoticeUpdate" method="post" onsubmit="return chk()">
 	<table border="" align="center">
 	<thead><!-- #44ACC2 -->
 		<th style="background-color: #ADD0E0;">공지사항 수정</th>
	</thead>
	<td>
	<p style="padding-right: 4px; padding-left: 4px;"><b> 제목 :</b> <input type="text" id="owner_Notice_Title" name="owner_Notice_Title" value="${choose.owner_Notice_Title}">
	<b><input type="text" id="owner_Notice_Num" name="owner_Notice_Num" style="width: 16px; float: right; background-color: #D0CECD;text-align: center;"
	value="${choose.owner_Notice_Num}" readonly="readonly" name="noticeNum2"></b></p>
	<p style="padding-right: 4px; padding-left: 4px;" ><b> 작성자 : </b> <input type="text" id="admin_Num" name="admin_Num" value="${choose.admin_Num}" readonly="readonly" style="background-color: #D0CECD"><br/></p>
	<textarea id="owner_Notice_Content" name="owner_Notice_Content" rows="20px" cols="80px" name="noticeContent" >${choose.owner_Notice_Content}</textarea>
 	<br/>
 	<p style="padding-right: 4px; padding-left: 4px;" align="right">
 	<input type="submit" value="수정"> 
 	<input type="button" value="삭제" onclick="location.href='noticeDel?owner_Notice_Num=${choose.owner_Notice_Num}'" onmousedown="delete()">
 	<input type="button" value="취소" onclick="history.go(-1)">
 	<input type="hidden" id="searchstr" name="searchstr" value="${searchstr}">
 	</p>
 	</table>
 </form>
</body>
</html>