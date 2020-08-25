<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

<title>게시판</title>

<link rel="stylesheet" href="/myfirst/resources/css/bootstrap.min.css">

<link rel="stylesheet" href="/myfirst/resources/css/style.css">

<style type='text/css'>
<!--
a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	
}

a:active {
	text-decoration: underline;
}

a:hover {
	text-decoration: underline;
	background-image: url('text_dottdeline.gif');
	background-repeat: repeat-x;
	background-position: 50% 100%;
}
-->
</style>
<style>
<!--
@font-face {
	font-family: 굴림;
	src: url();
}

body, td, a, div, p, pre, input, textarea {
	font-family: 굴림;
	font-size: 9pt;
}
-->
</style>
</head>
<body>
	<center>
		<b>글내용 보기</b> <br>
		<form>
			<table class="table" width="500" border="1" cellspacing="0" cellpadding="0"
				align="center">
				<tr height="30">
					<td align="center" width="125">글번호</td>
					<td align="center" width="125" align="center">${article.owner_writeNo}</td>
				</tr>
				<tr height="30">
					<td align="center" width="125">작성자</td>
					<td align="center" width="125" align="center">${article.owner_name}</td>
					<td align="center" width="125">작성일</td>
					<td align="center" width="125" align="center">${article.date_Created}</td>
				</tr>
				<tr height="30">
					<td align="center" width="125">글제목</td>
					<td align="center" width="375" align="center" colspan="3">${article.owner_writeTitle}</td>
				</tr>
				<tr>
					<td align="center" width="125">글내용</td>
					<td align="left" width="375" colspan="3"><pre>${article.owner_content}</pre></td>
				</tr>
				<tr>
					<td align="center" width="125">답변</td>
					<td align="left" width="375" colspan="3"><pre>${answer.content}</pre></td>
				</tr>
				<tr height="30">
					<td colspan="4" align="right"><c:if
							test="${article.isAnswered == true}">
							<input type="button" value="답변수정"
								onclick="document.location.href='o_answerUpdate?questionId=${article.owner_writeNo}'">
						</c:if> <c:if test="${article.isAnswered == false}">
							<input type="button" value="답변하기"
								onclick="document.location.href='o_answerWrite?questionId=${article.owner_writeNo}'">
						</c:if> &nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="삭제"
						onclick="javascript:void();"> &nbsp;&nbsp;&nbsp;&nbsp; <input
						type="button" value="목록"
						onclick="document.location.href='o_questionList?p=${pageNum}'">
						&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="취소"
						onclick="javascript:window.history.back();"></td>
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
		<script src="/myfirst/resources/js/bootstrap.min.js"></script>
		<script src="/myfirst/resources/js/bootstrap.bundle.min.js"></script>
</body>
</html>
