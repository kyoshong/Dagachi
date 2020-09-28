<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>비밀번호찾기</title>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
</head>
<body>
<form method="post" action="changePw" name="findPw"
		onsubmit="return emailCertification()">
		<table>
			<tr>
				<td>E-Mail</td>
				<td><input type="email" id="customer_Email" name="customer_Email" /></td>
				<td><button type="button" name="send" class="emailReceive">인증번호
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
<script type="text/javascript">

	$(".emailReceive").click(function() {
		
		var customer_Email = $("#customer_Email").val();
		$.ajax({
			url : "findPass",
			type : "POST",
			data : {"customer_Email" : customer_Email},
			success : function(data){
				
				console.log(data);
				alert("해당 이메일로 인증번호가 발송 되었습니다.")
				return false;
				
			},
			error : function() {
				alert("다시 시도하세요")
				return false;
			}
		});
	});
	
	function insertCode() {
		var fal = "false";
		var tr = "true";
		var customer_Email = $("#customer_Email").val();
		var inputCode = $("#inputCode").val();
		$.ajax({
			url : "insertCode",
			data : {
				customer_Email : customer_Email,
				inputCode : inputCode
			},
			type : "POST",
			success : function(result) {
				console.log(result);
				if (result == true) {
					alert("인증완료되었습니다.");
					$('input[name=certificationYN]').attr('value', tr);
					customer_Email.onchange = function() {
						$('input[name=certificationYN]').attr('value', fal);
					}
					return false;
				}else{
					alert("인증번호가 일치하지않습니다, 인증번호를 다시 입력해주세요.");
					return false;
				}
			},
			error : function() {
				alert("인증번호가 일치하지않습니다, 인증번호를 다시 입력해주세요.");
				return false;
			}
		});
	}
	
	function emailCertification() {
		if ($("#certificationYN").val() == "false") {
			alert("이메일 인증을 해주세요");
			return false;
		} else {
			return true;
		}
	}
</script>
</html>