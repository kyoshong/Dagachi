<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<title>게시판</title>
</head>

<body style="width: 100%; text-align: center;">
	<b>글목록(전체 글:${list.count})</b>

	<table width="700">
		<tr>
			<td align="right"><a href="c_boardwrite">글쓰기</a></td>
		</tr>
	</table>

	<c:if test="${list.count == 0}">
		<table width="700" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td align="center">게시판에 저장된 글이 없습니다.</td>
			</tr>
		</table>
	</c:if>

	<c:if test="${list.count > 0}">
		<table border="1" width="700" cellpadding="0" cellspacing="0"
			align="center">
			<tr height="30">
				<td align="center" width="50">번 호</td>
				<td align="center" width="250">제 목</td>
				<td align="center" width="100">작성자</td>
				<td align="center" width="150">작성일</td>
				<td align="center" width="150">답변상태</td>
			</tr>

			<c:forEach var="article" items="${list.list}">
				<tr height="30">
					<td align="center" width="50"><c:out value="${number}" /> <c:set
							var="number" value="${number - 1}" /></td>

					<td align="center" width="100"><a
						href="c_boardcontent?num=${article.customer_writeNo}&p=${list.requestPage}">
							${article.customer_writeTitle} </a></td>

					<td align="center" width="100">${article.customer_name}</td>

					<td align="center" width="150"><fmt:formatDate
							value="${article.date_Created}" type="date" dateStyle="long" /></td>
					<td><c:choose>
							<c:when test="${article.isAnswered == false}">
        						답변대기
    						</c:when>
							<c:when test="${article.isAnswered == true}">
							 	답변완료
						    </c:when>
						</c:choose></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>

	<c:if test="${list.count > 0}">
		<c:if test="${list.p.beginPageNumber > 10}">
			<a href="c_boardlist?p=${list.p.beginPageNumber-1}">이전</a>
		</c:if>
		<c:forEach var="pno" begin="${list.p.beginPageNumber}"
			end="${list.p.endPageNumber}">
			<a href="c_boardlist?p=${pno}">[${pno}]</a>
		</c:forEach>
		<c:if test="${list.p.endPageNumber < list.p.totalPageCount}">
			<a href="c_boardlist?p=${list.p.endPageNumber + 1}">다음</a>
		</c:if>
	</c:if>
</body>
</html>