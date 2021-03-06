<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>고객 로그인</title>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type='text/css'>
body{
font-family: 나눔바른고딕, NanumBarunGothic, 맑은고딕, "Malgun Gothic", 돋움, Dotum,
		"Apple SD Gothic Neo", sans-serif;
	font-size: 12px;
	color: rgb(33, 33, 33);
	letter-spacing: 0.03em;
}
table {
	width: 600px;
}

tr {
	height: 50px;
}

input[type=text], input[type=email], input[type=password] {
	padding: 5px 10px; /* 상하 우좌 */
	margin: 3px 0; /* 상하 우좌 */
	font-family: inherit; /* 폰트 상속 */
	border: 1px solid #ccc; /* 999가 약간 더 진한 색 */
	font-size: 14pt;
	box-sizing: border-box;
	border-radius: 3px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	-webkit-transition: width 0.4s ease-in-out;
	transition: width 0.4s ease-in-out;
}

input[type=text]:focus, input[type=email]:focus, input[type=password]:focus
	{
	border: 2px solid #555;
}

input[type=submit], input[type=button] {
	margin-top: 10px;
	width: 150px;
	height: 40px;
	line-height: 22px;
	padding: 5px, 10px; /* 상하 우좌 */
	background: #E6E6E6;
	color: #000000;
	font-size: 15px;
	font-weight: normal;
	letter-spacing: 1px;
	border: none;
	cursor: pointer;
	border-radius: 3px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
}

input[type=submit]:hover {
	background-color: #FFBF00;
}
</style>
</head>
<body>
	<c:if test="${member == null}">
		<form method="post" action="c_login">
			<div class="form-group has-feedback">
				<label class="control-label" for="userId">아이디  </label>
				<!-- 이메일로 가입함 -->
				<input class="form-control" type="text" id="CuserId" maxlength="40"
					placeholder="이메일을 입력해 주세요" name="customer_Email" />
			</div>
			<br>
			<div class="form-group has-feedback">
				<label class="control-label" for="userPass">패스워드  </label> <input
					class="form-control" type="password" id="CuserPass" maxlength="40"
					placeholder="비밀번호" name="customer_Password" />
			</div>
			<br>
			<div class="form-group has-feedback">
				<button class="btn btn-success" type="submit" id="login">로그인</button>
			</div>
			<div class="form-group has-feedback">
			<br>
				<div>
					<input type="button" value="회원가입"
						onclick="location.href='c_crtAccount'">
				</div>
				<br>
				<div>비밀번호를 잊으셨나요?
  				<input type="button" value="비밀번호 찾기" onclick="location.href='findPass'"/></div>
			</div>
		</form>
	</c:if>
	<c:if test="${member != null}">
		<p>${member.customer_Name}님 환영합니다.</p>
		
		<a href="customer_logout">로그아웃</a>
		<a href="/dagachi/index_YHJ.jsp">홈</a>
	</c:if>
	<c:if test="${msg == false}">
		<p style="color: #f00;">로그인에 실패했습니다. 아이디 또는 패스워드를 다시 입력해주십시오.</p>
	</c:if>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$("#login").on("click", function() {
			if ($("#CuserId").val() == "") {
				alert("아이디를 입력해주세요.");
				$("#CuserId").focus();
				return false;
			}
			if ($("#CuserPass").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#CuserPass").focus();
				return false;
			}
		});
	})
</script>
</html>