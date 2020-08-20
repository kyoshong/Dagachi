<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>신규 가맹 접수</title>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<script>
 function deleteSave(form) {
	if(confirm("거절하시겠습니까?")){
		alert("거절 되었습니다");
		form._method.value="post"
		form.action="delete";
		form.submit();
		
		} else{
			alert("취소되었습니다");
			return false;
		}
} 

 function insertSave(form) {
		if(confirm("수락하시겠습니까?")){
			alert("수락 되었습니다");
			form._method.value="post"
			form.action="insert";
			form.submit();
			
			} else{
				alert("취소되었습니다");
				return false;
			}
	} 
 

</script>
</head>
<body>
<div align="center"><b>신규 가맹 접수 확인</b></div>

<br>
<form id="updateForm" method="post">
<table width="500" height="300" border="1" cellspacing="0" cellpadding="0" align="center"> 
    <tr height="30">

    <td align="left" width="125" >상호명: <input type="text" name="restaurant_Name" value="${article.restaurant_Name}" readonly="readonly" size="20"><br>
   	대표자 성명: <input type="text" name="owner_name" value="${article.owner_name}" readonly="readonly" size="5"><br>
    주민등록번호: <input type="text" name="owner_SecurityNum" value="${article.owner_SecurityNum}" readonly="readonly" size="13"><br>
    사업자 등록 번호: <input type="text" value="${article.restaurant_Num}" readonly="readonly" size="8"><br>
    주소지: <input type="text" name="restaurant_Address" value="${article.restaurant_Address}" readonly="readonly" size="40"><br>
    대표자 연락처: <input type="text" name="owner_phonenumber" value="${article.owner_phonenumber}" readonly="readonly"><br>
    E-mail 계정: <input type="text" name="owner_email" value="${article.owner_email}" readonly="readonly"><br>
    가입 날짜: <input type="text" name="owner_JoinRequest_Date" readonly="readonly" value=<fmt:formatDate value="${article.owner_JoinRequest_Date}" pattern="yyyy-MM-dd"/>><br>
    가입 수락: 
    <input type="hidden" name="_method" value="post" id="_method"/>
    <input type="hidden" name="restaurant_Num" value="${article.restaurant_Num}"/>
    <input type="hidden" name="owner_password" value="${article.owner_password}"/>
    <input type="hidden" name="owner_Join_Date" value="${article.owner_Join_Date}"/>

    <input type="button" onclick="return insertSave(this.form)" value="수락"/>
    <input type="button" onclick="return deleteSave(this.form)" value="거절"/>
    
       </td>
  </tr>
</table>   
</form>
</body>
</html>