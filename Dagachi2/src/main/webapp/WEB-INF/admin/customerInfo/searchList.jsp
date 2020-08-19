<%@ page contentType="text/html; charset=UTF-8"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>게시판</title>
</head>
<script>

function search() {
    
  var searchType = document.getElementsByName("searchType")[0].value;
  var keyword =  document.getElementsByName("keyword")[0].value;
  
  
 location.href = "searchList?p=1" + "&searchType=" + searchType + "&keyword=" + keyword; 

 };
</script>
<body>
	<input type="button" value="리뷰목록" onclick="location.href='list'">

			<div>
	
	
		<b>회원 목록</b> <br> <select name="searchType">
			<option value="customer_num" id="customer_num"
				<c:if test="${searchType eq 'customer_num'}">selected</c:if>>회원번호</option>
			<option value="customer_name"  id="customer_name"
				<c:if test="${searchType eq 'customer_name'}">selected</c:if>>이름</option>
			<option value="customer_phoneNumber"   id="customer_phoneNumber"
				<c:if test="${searchType eq 'customer_phoneNumber'}">selected</c:if>>전화번호</option>
			<option value="customer_email"  id="customer_email"
				<c:if test="${searchType eq 'customer_email'}">selected</c:if>>이메일</option>
		</select>
		 <input type="text" name="keyword" />

		<button type="button" id="searchBtn" onclick="search()">검색</button>
		
		</div>
	

		
		<br>
		<table border="1" width="700" cellpadding="0" cellspacing="0"
			align="center">
			<tr height="30">
				<td align="center" width="50">번 호</td>
				<td align="center" width="50">회원 번호</td>

				<td align="center" width="100">회원 명</td>
				<td align="center" width="150">Phone</td>
				<td align="center" width="150">생 년 월 일</td>
				<td align="center" width="150">가입일</td>


			</tr>

			<c:forEach var="article" items="${list.boardList}">
				<tr height="30">
					<td align="center" width="50"><c:out value="${number}" /> <c:set
							var="number" value="${number - 1}" /></td>
					<td align="center" width="100">${article.customer_num}</td>
					<td width="150"><a
						href="infoContent?num=${article.customer_num}&p=${list.requestPage}">
							${article.customer_name}</a></td>

					<td align="center" width="200">
						${article.customer_phoneNumber}</td>
					<td align="center" width="100"><fmt:formatDate
							value="${article.customer_birth}" pattern="yyyy.MM.dd" /></td>
					<td align="center" width="150"><fmt:formatDate
							value="${article.customer_Join_Date}" pattern="yyyy.MM.dd" /></td>
			</c:forEach>
		</table>


		<c:if test="${list.count > 0}">
			<c:if test="${list.p.beginPageNumber > 10}">
				<a
					href="searchList?p=${list.p.beginPageNumber-1}${page.searchTypeKeyword}">이전</a>
			</c:if>
			<c:forEach var="pno" begin="${list.p.beginPageNumber}" end="${list.p.endPageNumber}">
				<span> <c:if test="${select != num}">
						<a href="searchList?p=${pno}${page.searchTypeKeyword}">[${pno}]</a>
					</c:if> 
					<c:if test="${select == num}">
						<b>[${pno}]</b>
					</c:if>
					 </span>
			</c:forEach>
			<c:if test="${list.p.endPageNumber < list.p.totalPageCount}">
				<a href="searchList?p=${list.p.endPageNumber + 1}${page.searchTypeKeyword}">다음</a>
			</c:if>
		</c:if>
	
</body>
</html>