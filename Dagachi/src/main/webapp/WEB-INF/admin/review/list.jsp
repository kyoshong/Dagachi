<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<title>게시판</title>
</head>

<body>
<center>
<b>글목록</b>
<table width="700">
  <tr>
    <td align="right" >
  
    </td>
  </tr>
</table>


<table border="1" width="700" cellpadding="0" cellspacing="0" align="center">
    <tr height="30" >
      <td align="center"  width="50"  >번 호</td>
      <td align="center"  width="250" >제   목</td>
      
      <td align="center"  width="100" >작성자</td>
      <td align="center"  width="150" >작성일</td>
 
    </tr>

   <c:forEach var="article" items="${list.boardList}">
   <tr height="30">
    <td align="center"  width="50" >
  <c:out value="${number}"/>
  <c:set var="number" value="${number - 1}"/>
</td>
    <td  width="250" >

    <a href="content?num=${article.review_Num}&p=${list.requestPage}">
          ${article.review_Content}</a>
          
    
</td>
    <td align="center"  width="100">
       ${article.customer_name}
</td>
    <td align="center"  width="150">
    <fmt:formatDate value="${article.review_date}" type="date"
    											 dateStyle="long"/> 

  </c:forEach>
</table>


<c:if test="${list.count > 0}">
  <c:if test="${list.p.beginPageNumber > 10}">
			<a href="list?p=${list.p.beginPageNumber-1}">이전</a>
		</c:if>
		<c:forEach var="pno" begin="${list.p.beginPageNumber}" end="${list.p.endPageNumber}">
		<a href="list?p=${pno}">[${pno}]</a>
		</c:forEach>
		<c:if test="${list.p.endPageNumber < list.p.totalPageCount}">
			<a href="list?p=${list.p.endPageNumber + 1}">다음</a>
		</c:if>
</c:if>
</center>
</body>
</html>