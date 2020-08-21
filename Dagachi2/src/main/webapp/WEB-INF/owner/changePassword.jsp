<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보 보기</title>

<script language="JavaScript">
	function changePw() {
		if (document.newPw.owner_password.value != document.newPw.owner_password2.value) {
			alert("비밀번호가 다릅니다.");
			document.newPw.owner_password2.focus();
			return false;
		}else if(document.newPw.owner_password2.value==''&&document.newPw.owner_password.value==''){
			alert("비밀번호를 입력하세요.")
			return false;}
		else{
			alert("비밀번호 변경이 완료되었습니다.")
			}
	}
</script>
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
<b>내정보 수정</b>
	<form method="post" name="newPw" action="newPassword" onsubmit="return changePw()" >
	<input type="hidden" id="owner_email" name="owner_email" value="${owner_email}">
		
		<label>변경할 비밀번호</label>
		<input type="password" name="owner_password" /><br /> 
		
		<label>변경비밀번호	확인</label> 
		<input type="password" name="owner_password2" /><br /> 
		

		<button type="submit">수정</button>
	</form>
     
</body>
</html>