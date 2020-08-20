<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<style type="text/css">
	.thumbImg {width: 400px; height: 200px;}
	.paging{text-align:center; }
</style>

<head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>게시물 목록</title>
</head>

<!-- <input type="button" value="리뷰 작성하기" onClick="location.href='post'"/><br> -->
<body>
<h4 style="text-align:center">리뷰 리스트</h4>
<table width="1000" border="1" cellspacing="1" cellpadding="0" style="text-align: center;" align="center"> 
<c:forEach items="${list}" var="list">
<tr>
<th>작성자</th>
<th>주문일</th>
<th>작성일</th>
<th>내용</th>
<th>별점</th>
<th>사진</th>
<th></th>
<th>답변</th>
</tr>



<tr>
<td>${list.customer_Name }</td>
<td>${list.order_Date }</td>
<td><fmt:formatDate value="${list.reg_Date}" type="date" dateStyle="long"/> </td>
<td>${list.review_Content}</td>
<td>${list.star_Count}</td>
<td>
<img src="/resources/${list.review_Thumb_Pic}" id="thumbImg" class="thumbImg"/>
</td>
<td>
<button id=deleteReview onclick="btn_deleteReview(${list.review_Num}, '${list.review_Pic}', '${list.review_Thumb_Pic}')">삭제</button>
</td>
<td>${list.review_Answer_Content}</td>
</tr>
</c:forEach>

</table>
<br>
<br>


<!-- 페이징 -->
<div class="paging">
<c:if test="${page.prev}">
 <span>[ <a href="list?owner_Num=12&num=${page.startPageNum - 1}">이전</a> ]</span>
</c:if>

<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
 <span>
 
  <c:if test="${select != num}">
   <a href="list?owner_Num=12&num=${num}">${num}</a>
  </c:if>    
  
  <c:if test="${select == num}">
   <b>${num}</b>
  </c:if>
    
</span>
</c:forEach>

<c:if test="${page.next}">
 <span>[ <a href="list?owner_Num=12&num=${page.endPageNum + 1}">다음</a> ]</span>
</c:if>
</div>


<script>
function btn_deleteReview(list,image,thumbImage) {
	
var result = confirm("삭제하시겠습니까?");
if(result){
	location.href="delete?review_Num="+list+"&review_Pic="+image+"&review_Thumb_Pic="+thumbImage;
	alert("삭제되었습니다.");
}else{
	alert("취소되었습니다.");
	return false;
}
	
}
</script>


</body>
</html>