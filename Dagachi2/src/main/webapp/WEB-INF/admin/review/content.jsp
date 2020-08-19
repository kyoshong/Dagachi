<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<html>
<head>
<title>게시판</title>

<style type="text/css">
   .select_img img {margin:20px 0;}
   .thumbImg {width: 200px; height : 200px;}
</style>


<script language="JavaScript">
	function reviewDelete() {
		 if (confirm("리뷰 정말로 삭제하시겠니") == true){    //확인
		  	
		 }else{   //취소
		     return false;
		 }
	}
</script>
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
<body> 
<center><b>글내용 보기</b>
<br>
<form method="POST" name="delForm" action="reviewDelete" onsubmit="return reviewDelete()">
<table width="500" border="1" cellspacing="0" cellpadding="0" align="center"> 
   <input type="hidden" name="p" value="${pageNum}"></td>

  <tr height="30">
    <td align="center" width="125" >글번호</td>
    <td align="center" width="125" align="center"><input type="hidden" name="num" value="${article.review_Num}"> ${article.review_Num}</td>
    <td align="center" width="125" >예약번호</td>
    <td align="center" width="125" align="center">${article.reserv_num}
</td>
  </tr>
  <tr height="30">
    <td align="center" width="125" >작성자</td>
    <td align="center" width="125" align="center">${article.customer_name}</td>
    <td align="center" width="125"  >작성일</td>
    <td align="center" width="125" align="center">
    <fmt:formatDate value="${article.review_date}" pattern="yyyy.MM.dd"/>
  </tr>
  <tr height="30">
    <td align="center" width="125" >가게명</td>
    <td align="center" width="375" align="center" colspan="3">${article.restaurant_Name}</td>
  </tr>
  <tr>
    <td align="center" width="200" >글내용</td>
    <td align="left" width="1000" colspan="3"><pre>${article.review_Content}</pre></td>
    
  </tr>
   <tr>
    <td align="center" width="200" >사진</td>
    <td>
    <img src="../${article.review_Pic}" border="0"  height="16" class="thumbImg"></td>

  </tr>
  <tr height="30">     
    <td colspan="4"  align="right" >

  <input type="submit" value="리뷰삭제">
   &nbsp;&nbsp;&nbsp;&nbsp;

       <input type="button" value="글목록"
       onclick="history.go(-1)">
    </td>
  </tr>
</table>   
</form>     
</body>
</html>    