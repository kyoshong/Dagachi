<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>문의글 목록</title>
</head>
<body>
	<table>
		<tr>
			<th width="50">번   호</th>
			<th width="300">제   목</th>
			<th width="120">작성자</th>
			<th width="90">작성일</th>
			<th width="200">답변상태</th>
		</tr>
		<c:forEach items="${list}" var="list">
			<tr>
				<td>${list.customer_WriteNo}</td>
				<td><a href="c_view?customer_WriteNo=${list.customer_WriteNo}">${list.customer_WriteTitle}</a>
				</td>
				<td>${list.customer_Name}</td>
				<td>${list.date_Created}</td>
				<td><c:choose>
						<c:when test="${list.isAnswered == false}">
        						답변대기
    						</c:when>
						<c:when test="${list.isAnswered == true}">
							 	답변완료
						    </c:when>
					</c:choose></td>
			</tr>
		</c:forEach>
		<tr>
			<td align="center"><a href="c_write">글쓰기</a></td>
		</tr>
	</table>
	<div>
		<c:if test="${prev}">
			<span>[<a href="c_listPage?num=${startPageNum - 1}">이전</a>]
			</span>
		</c:if>

		<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
			<span> <c:if test="${select != num}">
					<a href="c_listPage?num=${num}">${num}</a>
				</c:if> <c:if test="${select == num}">
					<b>${num}</b>
				</c:if>

			</span>
		</c:forEach>

		<c:if test="${next}">
			<span>[<a href="c_listPage?num=${endPageNum + 1}">다음</a>]
			</span>
		</c:if>
	</div>
</body>
</html>