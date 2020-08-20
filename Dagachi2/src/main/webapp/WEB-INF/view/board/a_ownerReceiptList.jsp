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
</head>
<body>
<div align="center"><a href="a_ownerReceiptList">가맹대기</a>
<a href="a_ownerDetailInfoList">가맹정보</a></div><br>
<%-- <% request.setCharacterEncoding("UTF-8"); %> --%>
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

</body>
</html>