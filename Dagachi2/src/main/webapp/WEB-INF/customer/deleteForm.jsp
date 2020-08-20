<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">

<script language="JavaScript">         
  function deleteSave(){
if(document.delForm.passwd.value==''){
alert("비밀번호를 입력하십시요.");
document.delForm.password.focus();
return false;
	}else{
		alert("회원 탈퇴 완료되었습니다.");
		
		}
}   
     
</script>
</head>

<body>
<center><b>글삭제</b>
<br>
<form method="POST" name="delForm" action="delete" onsubmit="return deleteSave()">
  
      <input type="hidden" name="num" value="${num}"></td>
   
<table border="1" align="center" cellspacing="0" cellpadding="0" width="360">
  <tr height="30">
     <td align=center  >
       <b>비밀번호를 입력해 주세요.</b></td>
  </tr>
  <tr height="30">
     <td align=center >비밀번호 :  
       <input type="password" name="password" size="8" maxlength="12">

</tr>
<tr height="30">
    <td align=center >
      <input type="submit" value="회원탈퇴" >
      <input type="button" value="뒤로가기"
       onclick="document.location.href='myInfo'">    
   </td>
</tr> 
</table>
</form>
</body>
</html>