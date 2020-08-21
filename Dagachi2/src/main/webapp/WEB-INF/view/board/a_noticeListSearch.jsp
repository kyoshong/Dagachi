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
<title>게시판</title>
</head>
<body>
	
<form action="a_noticeListSearch" method="post">
	
	<table border="1" align="center">
	
			<thead>
			<tr style="background-color: #ADD0E0;width: 150px;">
			<td>
			<input type="button" onclick="location.href='a_noticeList'" value="공지사항 이동">
			</td>
			</tr>
			<tr> 
			<th style="background-color: #ADD0E0;border-color: #91AFBD;">no</th>
			<th style="background-color: #ADD0E0;border-color: #91AFBD;padding-left: 10px;padding-right: 10px;">작성자</th>
			<th style="background-color: #ADD0E0;border-color: #91AFBD;padding-left: 10px;padding-right: 10px;" >제목</th>
			<th style="background-color: #ADD0E0;border-color: #91AFBD; padding-left: 10px;padding-right: 10px;" >등록일</th>
			<th style="background-color: #ADD0E0;border-color: #91AFBD; " >수정/삭제</th>
			</tr>
			</thead>  
			
			<c:if test="${searchList.count == 0}">
			<tr>
			<td colspan="5" align="center" >작성된 글이 없습니다.</td>
			</tr>
			</c:if>
			
	<c:forEach items="${searchList.ownerList}" var="result" varStatus="status">
		<tr>
			<td align="center" id="noticeNum" style="padding-left: 10px;padding-right: 10px;">${result.owner_Notice_Num}</td>
			<td align="center" id="adminNum" style="padding-left: 10px;padding-right: 10px;">${result.admin_Num}</td>
			<td align="center" id="title" style="padding-left: 10px;padding-right: 10px;">${result.owner_Notice_Title}</td>
			<td align="center" id="day" style="padding-left: 10px;padding-right: 10px;">
			<fmt:formatDate value="${result.owner_Notice_Created_Day}" pattern="yyyy/MM/dd" />
			</td>
			<td align="center" id="upDel" ><input type="button" value="수정/삭제"
			onclick="location.href='searchNoticeInfo?noticeNum=${result.owner_Notice_Num}&&searchstr=${searchstr}'"/></td>
		</tr>
		</c:forEach>
		</table>
		<p align="center">
		<c:if test="${searchList.count > 0}">
  <c:if test="${searchList.p.beginPageNumber > 10}">
			<a href="a_noticeListSearch?p=${searchList.p.beginPageNumber-1}&&searchstr=${searchstr}">이전</a>
		
		</c:if>
		<c:forEach var="pno" begin="${searchList.p.beginPageNumber}" end="${searchList.p.endPageNumber}">
		<a href="a_noticeListSearch?p=${pno}&&searchstr=${searchstr}">[${pno}]</a>
		</c:forEach>
		<c:if test="${searchList.p.endPageNumber < searchList.p.totalPageCount}">
			<a href="a_noticeListSearch?p=${searchList.p.endPageNumber + 1}&&searchstr=${searchstr}">다음</a>
		</c:if>
	</c:if> 
		</p>
		</form>
</body>
</html>
