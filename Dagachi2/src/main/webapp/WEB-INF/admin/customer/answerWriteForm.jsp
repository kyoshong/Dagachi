<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>게시판</title>

<link rel="stylesheet" href="/myfirst/resources/css/bootstrap.min.css">

<link rel="stylesheet" href="/myfirst/resources/css/style.css">

<link href="style.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>


<body>
	<center>
		<b>글쓰기</b> <br>
		<form method="post" name="answerWrite" action="answerWrite"
			onsubmit="return writeSave()">
			<input type="hidden" name="Customer_Question_id"
				value="${questionId}">

			<table class="table" width="400" border="1" cellspacing="0"
				cellpadding="0" align="center">

				<tr>
					<td>제 목</td>
					<td><input type="text" size="40" maxlength="50" name="title"
						value="[RE] ${questionTitle}"></td>
				</tr>
				<tr>
					<td>답변 내용</td>
					<td><textarea name="content" rows="13" cols="40"></textarea></td>
				</tr>

				<tr>
					<td>질문 내용</td>
					<td><textarea readonly="true">${questionContent}</textarea></td>
				</tr>

				<tr>
					<td colspan=2 align="center">
					<input type="submit" value="글쓰기">
						<input type="reset" value="다시작성">
						 <input type="button"
						value="질문목록보기" OnClick="window.location='c_questionList'"></td>
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
