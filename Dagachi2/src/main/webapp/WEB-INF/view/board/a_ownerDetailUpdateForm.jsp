<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>가맹 상세 정보</title>
<script>
 function deleteSave(form) {
	if(confirm("삭제 하시겠습니까?")){
		alert("삭제 되었습니다");
		form._method.value="post"
		form.action="deleteInfo";
		form.submit();
		
		} else{
			alert("취소되었습니다");
			return false;
		}
} 
 function updateSave(form) {
		if(confirm("수정 하시겠습니까?")){
			alert("수정 되었습니다");
			form.action="updateInfo";
			form.submit();
			
			} else{
				alert("취소되었습니다");
				return false;
			}
	} 
</script>
</head>
<body>
<div align="center"><b>가맹 상세 정보</b></div>

<br>
<form id="updateInfoForm" method="post">
<table width="500" height="300" border="1" cellspacing="0" cellpadding="0" align="center"> 
    <tr height="30">

    <td align="left" width="125" >상호명: <input type="text" name="restaurant_Name" value="${articleInfo.restaurant_Name}" readonly="readonly" size="20"><br>
   	대표자 성명: <input type="text" name="owner_name" value="${articleInfo.owner_name}" readonly="readonly" size="5"><br>
    주민등록번호: <input type="text" name="owner_SecurityNum" value="${articleInfo.owner_SecurityNum}" readonly="readonly" size="13"><br>
    사업자 등록 번호: <input type="text" value="${articleInfo.restaurant_Num}" readonly="readonly" size="8"><br>
    주소지: <input type="text" name="restaurant_Address" value="${articleInfo.restaurant_Address}" size="40"><br>
    상세주소: <input type="text" name="restaurant_detail_Address" value="${articleInfo.restaurant_detail_Address}" size="40"><br>
    대표자 연락처: <input type="text" name="owner_phonenumber" value="${articleInfo.owner_phonenumber}" ><br>
    E-mail 계정: <input type="text" name="owner_email" value="${articleInfo.owner_email}" readonly="readonly"><br>
    가입 날짜: <input type="text" name="owner_Join_Date" readonly="readonly" value=<fmt:formatDate value="${articleInfo.owner_Join_Date}" pattern="yyyy-MM-dd"/>><br>

    <input type="hidden" name="_method" value="post" id="_method"/>
    <input type="hidden" name="restaurant_Num" value="${articleInfo.restaurant_Num}"/>
    <input type="hidden" name="owner_password" value="${articleInfo.owner_password}"/>
    <input type="hidden" name="owner_num" value="${articleInfo.owner_num}"/>
    <br>
   <div align="center">
    <input type="button" onclick="return updateSave(this.form)" value="수정"/>
    &nbsp;&nbsp;
    <input type="button" onclick="return deleteSave(this.form)" value="삭제"/>
    </div>
       </td>
  </tr>
</table>   
</form>
</body>
</html>