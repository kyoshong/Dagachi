<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>owner Login</title>

<style type='text/css'>
body {
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
<c:if test="${member==null}">
<form method="post" action="loginOwner">
 <p>
  <label for="owner_email">이메일</label>
  <input type="text" id="owner_email" name="owner_email" />
 </p>
 <p>
  <label for="owner_password">비밀번호</label>
  <input type="password" id="owner_password" name="owner_password" />
 </p>
 <p><button type="submit">로그인</button></p>
 <p><input type="button" value="회원가입" onclick="location.href='joinForm'"></p>
<br><p>비밀번호를 잊으셨다면..?
  <input type="button" value="비밀번호 찾기" onclick="location.href='findPassword'"></p>
 <a href="/index.jsp">홈</a>
 </form>
 </c:if>
 <c:if test="${msg == false}">
 <p style="color:#f00;">로그인에 실패했습니다. 아이디 또는 패스워드를 다시 입력해주십시오.</p>
 </c:if>
 <c:if test="${member !=null}">
 <p>${member.owner_name} 님 환영합니다.</p>
 <p><a href="logoutOwner">로그아웃</a></p>
 <p><a href="/index.jsp">홈</a></p>
</c:if>
</body>
</html>