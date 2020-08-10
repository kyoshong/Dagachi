<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보 보기</title>

<script language="JavaScript">
	function infoSave() {
		if (document.info.newPassword.value == document.info.newPassword.newPassword2) {
			alert("비밀번호가 다릅니다.");
			document.info.newPassword2.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<form method="post" name="info" onsubmit="return infoSave()">
		<label>이름</label> 
		<input type="text" name="customer_name"
			value="${info.customer_name}" /><br /> 
			<label>이메일</label> 
			<input	type="text" name="customer_email" value="${info.customer_email}" /><br />
		<label>비밀번호</label> 
		<input type="password" name="customer_password"	value="${info.customer_password}" /><br /> 
		
		<label>변경할 비밀번호</label>
		<input type="password" name="newPassword" /><br /> 
		
		<label>변경비밀번호	확인</label> 
		<input type="text" name="newPassword2" /><br /> 
		
		<label>생년월일</label>
		<input type="text" name="customer_birth"value="<fmt:formatDate 
		value="${info.customer_birth}" pattern="yyyy.MM.dd"/>" /><br />


		<label>휴대폰번호 인증</label> 
		<input type="text" name="customer_phoneNumber"	value="${info.customer_phoneNumber}" /><br /> 
		<label>인증번호</label> 
		<input type="text" name="customer_name" value="${info.customer_name}" /><br />

		<button type="submit">수정</button>
		<input type="button" value="회원 탈퇴">
	</form>
</body>
</html>