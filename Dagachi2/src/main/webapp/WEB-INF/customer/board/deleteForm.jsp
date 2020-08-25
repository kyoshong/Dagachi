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
document.delForm.passwd.focus();
return false;
}
}   
     
</script>
</head>

<body>
<center><b>글삭제</b>
<br>
<form method="POST" name="delForm" action="c_boarddelete" onsubmit="return deleteSave()">
	<input type="hidden" name="_method" value="delete" />
	<table border="1" align="center" cellspacing="0" cellpadding="0" width="360">
		<tr height="30">
			<td align=center  >
       			<b>삭제하시겠습니까 ?</b>
       		</td>
  		</tr>

		<tr height="30">
    		<td align=center >
    			<input type="hidden" name="num" value="${num}">
   				<input type="hidden" name="p" value="${pageNum}">
      			<input type="submit" value="글삭제" >
      			<input type="button" value="글목록"
       				onclick="document.location.href='c_boardlist?p=${pageNum}'">    
   			</td>
		</tr> 
	</table>
</form>
</body>
</html>