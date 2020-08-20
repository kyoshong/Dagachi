<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<style type="text/css">
	.select_img img {margin:20px 0;}
	.thumbImg {width: 400px; height: 200px;}
	.paging{text-align:center; }
	.btn_enroll{
	position: absolute;
	left: 750px;
	}
</style>

<head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>게시물 목록</title>
</head>


<body>
<h4 style="text-align:center">리뷰 작성</h4>
<form method="post" enctype="multipart/form-data" >
<table border="1" cellspacing="1" align="center">
<tr>
<td><label>작성자</label></td>
<td><input type="text" name="customer_Name" /></td>
</tr>
<tr>
<td><label>고객번호</label></td>
<td><input type="text" name="customer_Num" /></td>
</tr>
<tr>
<td><label>사장 가맹번호</label></td>
<td><input type="text" name="owner_Num" /></td>
</tr>

<tr>
<td><label> 상호명</label></td>
<td><input type="text" name="restaurant_Name" /></td>
</tr>

<tr>
<td><label>별점</label></td>
<td><input type="text" name="star_Count" /></td>
</tr>

<tr>
<td><label>주문 일자</label></td>
<td><input type="text" name ="order_Date"/><br/></td>
</tr>

<tr>
<td><label>비밀번호</label></td>
<td><input type="text" name ="review_Passwd"/></td>
</tr>

<tr>
<td><label>내용</label></td>
<td><textarea cols="50" rows="5" name="review_Content"></textarea></td>
</tr>

<tr>
<td><label for="review_Pic">사진 등록</label></td>
<td>
<input type="file" id="review_Pic" name="file" />
<div class="select_img"><img src="" /></div>
</td>
</tr>
 
</table>

 <script>
  $("#review_Pic").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img img").attr("src", data.target.result).width(500);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
 </script>


<%-- <%=request.getRealPath("/") %> --%>
<br>
<button type="submit" class="btn_enroll">등록하기</button>

</form>
<br>
<br>
<br>
<br>



<!-- <input type="button" value="리뷰 작성하기" onClick="location.href='post'"/><br> -->
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


</body>
</html>