<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>게시판</title>

<link rel="stylesheet" href="/resources/css/bootstrap.min.css">

<link rel="stylesheet" href="/resources/css/style.css">

<link href="style.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>

  
<body > 
	<center><b>글쓰기</b>
	<br>
	<form method="post" name="answerUpdate" action="answerUpdate" onsubmit="return writeSave()">
	<input type="hidden" name="_method" value="put" />
	<input type="hidden" name="Customer_Question_id" value="${questionId}" />
	<table width="400" border="1" cellspacing="0" cellpadding="0"  align="center">

 	<tr>
   		<td  width="70"   align="center" >제 목</td>
   		<td  width="330">
   			<input type="text" size="40" maxlength="50" name="title"
   				value="${answer.title}">
		</td>
 	</tr>
 	<tr>
   		<td  width="70"   align="center" >내 용</td>
   		<td  width="330" >
    		<textarea name="content" rows="13" cols="40">${answer.content}
    		</textarea>
    	</td>
 	</tr>
	<tr>     
		<td colspan=2  align="center">
		  <input type="submit" value="수정" > 
		  <input type="button" value="목록" OnClick="window.location='c_questionList'">
		  <input type="button" value="취소" OnClick="javascript:window.history.back();'">
		</td>
	</tr>
	</table>

	</form>   
	
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/bootstrap.bundle.min.js"></script>  
	  
</body>
</html> 