<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<title>게시판</title>
<% Date now = new Date();
%>
</head>
<body>
<form method="post">
	<table border="" align="center">
			<thead>
			<th style="float: right;"><input type="button" value="관리자 등록하기" onclick="location.href='adminWriteForm'"></th>
			<tr>
			<th style="padding-left: 10px;padding-right: 10px;">adminNo</th>
			<th style="padding-left: 10px;padding-right: 10px;">그룹명</th>
			<th style="padding-left: 10px;padding-right: 10px;">관리자명</th>
			<th style="padding-left: 10px;padding-right: 10px;">권한</th>
			<th style="padding-left: 10px;padding-right: 10px;">등록일</th>
			<th>수정</th>
			</tr>
			</thead>
			
			<c:if test="${adminlist.count == 0}">
			<tr>
			<td colspan="6" align="center" >등록된 관리자가 없습니다.</td>
			</tr>
			</c:if>
			
	<c:forEach items="${adminlist.adminList}" var="result" varStatus="status">
		<tr>
			<td align="center" >${result.admin_Num}</td>
			<td align="center" style="padding-left: 10px;padding-right: 10px;">${result.dept }</td>
			<td align="center" style="padding-left: 10px;padding-right: 10px;" >${result.admin_Name}</td>
			<td align="center" style="padding-left: 10px;padding-right: 10px;" >${result.admin_Author}</td>
			<td align="center" style="padding-left: 10px;padding-right: 10px;">
			<fmt:formatDate value="<%= now %>" pattern="yyyy/MM/dd" />
			</td>
			<td align="center" ><input type="button" value="수정/삭제"
			onclick="location.href='adminInfo?admin_Num=${result.admin_Num}'"/></td>
		</tr>
		</c:forEach>
		</table>
		
		<p align="center">
		<c:if test="${adminlist.count > 0}">
  <c:if test="${adminlist.p.beginPageNumber > 10}">
			<a href="a_adminAccountList?p=${adminlist.p.beginPageNumber-1}">이전</a>
		</c:if>
		<c:forEach var="pno" begin="${adminlist.p.beginPageNumber}" end="${adminlist.p.endPageNumber}">
		<a href="a_adminAccountList?p=${pno}">[${pno}]</a>
		</c:forEach>
		<c:if test="${adminlist.p.endPageNumber < adminlist.p.totalPageCount}">
			<a href="a_adminAccountList?p=${adminlist.p.endPageNumber + 1}">다음</a>
		</c:if>
</c:if>
		</p>
</form>
</body>
</html>