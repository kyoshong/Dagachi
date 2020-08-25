<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>게시판</title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">

<link rel="stylesheet" href="/resources/css/style.css">

<style type='text/css'>
<!--
a:link { color:black; text-decoration:none; }
a:visited {  }
a:active { text-decoration:underline; }
a:hover { text-decoration:underline; background-image:url('text_dottdeline.gif'); background-repeat:repeat-x; background-position:50% 100%; }
-->
</style>
<style>
<!--
@font-face {font-family:굴림; src:url();}
body,td,a,div,p,pre,input,textarea {font-family:굴림;font-size:9pt;}
-->
</style>
</head>


<body > 
<center><b>글수정</b>
<br>
<form method="post" name="updateform" action="update" onsubmit="return writeSave()">
<input type="hidden" name="_method" value="put" />
<table class="table" width="400" border="1" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td  width="70"   align="center">이 름</td>
    <td align="left" width="330">
       <input type="text" size="10" maxlength="10" name="owner_name" value="${article.owner_name}">
   <input type="hidden" name="owner_writeNo" value="${article.owner_writeNo}"></td>
  </tr>
  <tr>
    <td  width="70"   align="center" >제 목</td>
    <td align="left" width="330">
       <input type="text" size="40" maxlength="50" name="owner_writeTitle" value="${article.owner_writeTitle}"></td>
  </tr>
  <tr>
    <td  width="70"   align="center" >내 용</td>
    <td align="left" width="330">
     <textarea name="owner_content" rows="13" cols="40">${article.owner_content}</textarea></td>
  </tr>

  <tr>     
   <td colspan=2  align="center">
     <input type="submit" value="글수정" > 
     <input type="reset" value="다시작성">
     <input type="button" value="목록보기"
       onclick="document.location.href='o_boardlist?p=${pageNum}'">
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