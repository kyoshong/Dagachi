<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<script>
function chk() {

	var d = document.forms.noticeListSearch;

	if(d.searchstr.value.trim() == "") {
			alert("작성자번호룰 검색해주세요.");
			d.searchstr.focus();
			return false;
		}
}

</script>
<title>게시판</title>
</head>
<body>

<form id="noticeListSearch" name="noticeListSearch" action="a_noticeListSearch" onsubmit="return chk()">
	
			<input type="hidden" value="${searchstr}">
			<table border="1" align="center">
			<thead>
			
			<tr style="background-color: #ADD0E0;width: 150px;">
			<td colspan="1" style="float: right;"><input type="button" value="새 공지 작성" onclick="location.href='noticeWriteForm'"></td>
			<td colspan="4" style="vertical-align: middle;align-content: center;">
			<input type="submit" value="작성자 검색" style="float: right;">
			<input type="text" id="searchstr" name="searchstr" style="float:right;">
			</td>
			</tr>
			</thead>
			
			<tr>
			<th style="background-color: #ADD0E0;border-color: #91AFBD;">no</th>
			<th style="background-color: #ADD0E0;border-color: #91AFBD; padding-left: 10px;padding-right: 10px;">작성자</th>
			<th style="background-color: #ADD0E0;border-color: #91AFBD; padding-left: 10px;padding-right: 10px;" >제목</th>
			<th style="background-color: #ADD0E0;border-color: #91AFBD; padding-left: 10px;padding-right: 10px;" >등록일</th>
			<th style="background-color: #ADD0E0;border-color: #91AFBD;" >수정/삭제</th>
			</tr>
			</thead> 
			
			<c:if test="${list.count == 0}">
			<tr>
			<td colspan="5" align="center" >작성된 글이 없습니다.</td>
			</tr>
			</c:if>
			
			
	<c:forEach items="${list.ownerList}" var="result" varStatus="status">
		<tr>
			<td align="center" id="noticeNum" style="padding-left: 10px;padding-right: 10px;">${result.owner_Notice_Num}</td>
			<td align="center" id="adminNum" style="padding-left: 10px;padding-right: 10px;">${result.admin_Num}</td>
			<td align="center" id="title" style="padding-left: 10px;padding-right: 10px;">${result.owner_Notice_Title}</td>
			<td align="center" id="day" style="padding-left: 10px;padding-right: 10px;">
			<fmt:formatDate value="${result.owner_Notice_Created_Day}" pattern="yyyy/MM/dd" />
			</td>
			<td align="center" id="upDel" ><input type="button" value="수정/삭제"
			onclick="location.href='noticeInfo?noticeNum=${result.owner_Notice_Num}'"/></td>
		</tr>
		</c:forEach>
		</table>
		<p align="center">
		<c:if test="${list.count > 0}">
  <c:if test="${list.p.beginPageNumber > 10}">
			<a href="a_noticeList?p=${list.p.beginPageNumber-1}">이전</a>
		</c:if>
		<c:forEach var="pno" begin="${list.p.beginPageNumber}" end="${list.p.endPageNumber}">
		<a href="a_noticeList?p=${pno}">[${pno}]</a>
		</c:forEach>
		<c:if test="${list.p.endPageNumber < list.p.totalPageCount}">
			<a href="a_noticeList?p=${list.p.endPageNumber + 1}">다음</a>
		</c:if>
</c:if>
		</p>
		</form>
</body>
</html>
