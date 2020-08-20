<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>비밀번호 찾기</title>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
	function emailS() {

		var owner_email = $("#owner_email").val();

		$.ajax({
			url : "findPw",
			data : {
				owner_email : owner_email
			},
			type : "POST",
			success : function(data) {
				if(data==true){
				console.log(data);
				alert("이메일로 인증번호가 발송 되었습니다.")
				return false;
				}else{
					alert("없는 이메일 입니다.")
					return false;
				
					}
			},
			error : function() {
				
				alert("다시 시도하세요")
				return false;
			}
		});
	}
	function insertCode() {
		var fal = "false";
		var tr = "true";

		var owner_email = $("#owner_email").val();
		var inputCode = $("#inputCode").val();

		$.ajax({
			url : "insertCode",
			data : {
				owner_email : owner_email,
				inputCode : inputCode
			},
			type : "POST",
			success : function(result) {
				console.log(result);
				if (result == true) {
					alert("인증완료되었습니다.");
					$('input[name=certificationYN]').attr('value', tr);
					owner_email.onchange = function() {
						$('input[name=certificationYN]').attr('value', fal);
					}
					return false;
				}

			},
			error : function() {
				alert("인증번호가 일치하지않습니다, 인증번호를 다시 입력해주세요.");
				return false;
			}

		});
	}
	function emailC() {

		if ($("#certificationYN").val() == "false") {
			alert("이메일 인증을 해주세요");
			return false;
		} else {
			return true;
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
	<form method="post" action="changePw" name="findPw"
		onsubmit="return emailC()">
		<table>
			<tr>
				<td>E-Mail</td>
				<td><input type="email" id="owner_email" name="owner_email" /></td>
				<td><button type="button" name="send" onclick="emailS()">인증번호
						받기</button></td>
			<tr>
				<td>인증번호</td>
				<td><input type="text" id="inputCode" name="inputCode" /></td>
				<td>
					<button id="inputCodeButton" name="inputCodeButton" type="button"
						onclick="insertCode()">인증번호 확인</button> <input type="hidden"
					name="certificationYN" value="false">
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="button" value="홈으로" onclick="location.href='index'"> <input type="submit"
					value="찾기"></td>
			</tr>
		</table>
	</form>
</body>
</html>

