<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script language="JavaScript">
$(function() {$("button[name^='reserv_num']").on("click", function del() {
		 if (confirm("예약을 취소 하시겠습니까?") == true){
			 console.log($(this).val());
			
			   
	var num = $(this).val();
				$.ajax({
					url: "orderDelete",
					data: {num : num},
					type: "POST",
					success : function(data){
						 alert("취소 완료되었습니다.")
					},
					error : function(){
						alert("에러")		
					}
				});
		
		 }else{   //취소
		     return false;
		 }
			
		 
  });
});

</script>
<body>
<form method="post" name="order" onsubmit="return del()" >
<table border="1" width="1000" cellpadding="0" cellspacing="0"
		align="center">
			
		
		<tr height="30">
			<td align="center"  height="50" colspan="8">예약 상세 페이지</td>
 </tr>
	<tr height="30" >
      <td align="center"  width="100" >사진</td>
      <td align="center"  width="100" >상호명</td>
      <td align="center"  width="100" >예약일자</td>
      <td align="center"  width="100" >예약시간</td>
	  <td align="center"  width="100" >예약금</td>
 	  <td align="center"  width="150" >사장번호</td>
 	  <td align="center"  width="150" >예약상태</td>
 	  <td align="center"  width="150" >예약취소</td>
    </tr>
<c:forEach var="list" items="${list}">
<input type="hidden" value="${list.reserv_num}" name=reserv_num id="reserv_num">
		<tr>
			<td align="center" width="100"> <a href="test"><img
				src="../${list.restaurant_Pic}" width="100" height="100"> </a></td>
			 <td  align="center"><a href="test" > ${list.restaurant_Name}</a></td>
			 <td  align="center"><a href="test">  <fmt:formatDate value="${list.date_of_use}" pattern="yyyy.MM.dd"/></a></td>
			  <td  align="center"><a href="test"> ${list.time_of_use}</a></td>
			 <td  align="center"><a href="test"> ${list.reserv_Fee}</a></td>
			 <td  align="center"><a href="test"> ${list.owner_phonenumber} //예약 번호 ${list.reserv_num}</a></td>
			 <td align="center"><a href="test"> ${list.reserv_Confirm}</a></td>
			 <td align="center" > 
			 <button type="button" id="reserv_num${list.reserv_num}"  
			 name="reserv_num${list.reserv_num}" value="${list.reserv_num}"
			 <c:if test="${list.reserv_Confirm eq '확정'}">hidden</c:if>>예약취소</button></td>
	</tr>
	
	</c:forEach>
	
	</table></form>
</body>
</html>