<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>

  
<body > 
	<center><b>글쓰기</b>
	<br>
	<form method="post" name="writeform" action="write" onsubmit="return writeSave()">
	<input type="hidden" name="owner_num" value="0">
	<table width="400" border="1" cellspacing="0" cellpadding="0"  align="center">

 	<tr>
   		<td  width="70"   align="center" >제 목</td>
   		<td  width="330">
   			<input type="text" size="40" maxlength="50" name="owner_writeTitle">
		</td>
 	</tr>
 	<tr>
   		<td  width="70"   align="center" >내 용</td>
   		<td  width="330" >
    		<textarea name="owner_content" rows="13" cols="40"></textarea>
    	</td>
 	</tr>
	<tr>     
		<td colspan=2  align="center">
		  <input type="submit" value="글쓰기" > 
		  <input type="reset" value="다시작성">
		  <input type="button" value="목록보기" OnClick="window.location='o_boardlist'">
		</td>
	</tr>
	</table>

	</form>     
</body>
</html> 