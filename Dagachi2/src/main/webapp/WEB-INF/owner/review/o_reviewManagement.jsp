<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<!DOCTYPE html>
<html>
<style type="text/css">
	.thumbImg {width: 400px; height: 200px;}
	.paging{text-align:center; }
	.replyFormBox{resize:none;}
</style>
<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<head>
<title>리뷰관리</title>
</head>

 
<body>
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

</tr>

<tr>
<td>${list.customer_Name }</td>
<td>${list.order_Date }</td>
<td><fmt:formatDate value="${list.reg_Date}" type="date" dateStyle="long"/></td>
<td>${list.review_Content}</td>
<td>${list.star_Count}</td>
<td><img src="/resources${list.review_Thumb_Pic}" class="thumbImg"/></td>
<td rowspan="2">
<button id="replyReview${list.review_Num}" type="button">답변달기</button>

<div id="completeReply${list.review_Num}" style="display:none;">답변 완료<br>
</div>
</td>


</tr>


<tr id="replyForm${list.review_Num}"  style="display:none;">
<td colspan="8">
<%-- <form id="replyFormAjax${list.review_Num}" action="#" onsubmit="return false"> --%>

<textarea class=replyFormBox id="review_Answer_Content${list.review_Num}" name="review_Answer_Content${list.review_Num}" cols="30" rows="10"></textarea>
<textarea id="${list.review_Num}" name="review_Num" style=display:none;>${list.review_Num}</textarea>

<button id="btn_reply${list.review_Num}" >리뷰 등록</button>
<button id="btn_replyCancel${list.review_Num}">취소</button>
<!-- </form> -->
</td>
</tr>

<script>
if (${list.review_Answer_Content }!=null) {
	$("#completeReply${list.review_Num}").show();
	$("#replyReview${list.review_Num}").hide();
	
	} else {
		$("#completeReply${list.review_Num}").hide();
		$("#replyReview${list.review_Num}").show();
	  
	}
</script>
<script>
$(function() {
  $("#replyReview${list.review_Num}").click( function() {
	  $("#replyForm${list.review_Num}").show();
	  $(this).hide();
  });
});
</script>

<script>
 $('#btn_reply${list.review_Num}').on('click', function(){
	 
var content=$("#review_Answer_Content${list.review_Num}").val();
var num=$("#${list.review_Num}").val();
     $.ajax({
            url: "replyReview",

            type: "POST",

             data: {review_Answer_Content : content , review_Num : num},
               //datatype : text,
            success: function(data){
               	alert("리뷰가 등록되었습니다.")
            },
            error: function(){
                alert("error");
            }
        });
     $("#replyForm${list.review_Num}").hide();
     $("#completeReply${list.review_Num}").show();
     
    });
 </script>


<script>
$(function() {
	$("#btn_replyCancel${list.review_Num}").click(function(){
		$("#replyForm${list.review_Num}").hide();
		$("#replyReview${list.review_Num}").show();
		});
});
</script>

</tbody>
</c:forEach>
</table>

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
<%--  <c:forEach begin="1" end="${pageNum}" var="num">
    <span>
     <a href="list?owner_Num=12&num=${num}">${num}</a>
  </span>
 </c:forEach> --%>
</div>

</body>
</html>