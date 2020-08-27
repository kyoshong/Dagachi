<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>회원 가입</title>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수
						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}
						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
						
						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("restaurant_Address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("restaurant_detail_Address")
								.focus();
					}}
				}).open();
	}
</script>

<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
	function joinCheck() {

		if ($("#restaurant_Name").val() == "") {
			alert("상호명을 입력해주세요");
			document.joinInfoForm.restaurant_Name.focus();

			return false;
		} else if ($("#owner_SecurityNum").val() == "") {
			alert("주민등록번호를 입력해주세요");
			document.joinInfoForm.owner_SecurityNum.focus();

			return false;

		} else if ($("#restaurant_Num").val() == "") {
			alert("사업자등록번호를 입력해주세요");
			document.joinInfoForm.restaurant_Num.focus();

			return false;
		} else if ($("#owner_phonenumber").val() == "") {
			alert("대표 연락처를 입력해주세요");
			document.joinInfoForm.owner_phonenumber.focus();

			return false;
		} else if ($("#restaurant_Address").val() == "") {
			alert("업체주소지를 입력해주세요");
			document.joinInfoForm.restaurant_Address.focus();

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
	width: 100px;
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
	<form name="joinInfoForm" method="post" action="joinPostOwner"
		onsubmit="return joinCheck()">
		<input type="hidden" id="owner_name" name="owner_name"
			value="${owner_name}"> <input type="hidden" id="owner_email"
			name="owner_email" value="${owner_email}"> <input
			type="hidden" id="owner_password" name="owner_password"
			value="${owner_password}">


			<table width="940" style="padding: 5px 0 5px 0;">
				<tr height="2" bgcolor="#FFC8C3">
					<td colspan="2"
						style="font-size: 24px; font-style: bold text-align: center; font-family: 나눔바른고딕, NanumBarunGothic, 맑은고딕">가맹
						신청</td>
				</tr>
				<tr>
					<th>상호명</th>
					<td><input type="text" name="restaurant_Name"></td>
				</tr>
				
				<tr>
					<th>주민등록번호</th>
					<td><input type="text" name="owner_SecurityNum"></td>
				</tr>
				<tr>
					<th>사업자등록번호</th>
					<td><input type="text" name="restaurant_Num"> </td>
				</tr>
				<tr>
					<th>대표 연락처</th>
					<td><input type="text" name="owner_phonenumber"></td>
				</tr>
				<tr>
				<th>업체주소지</th>
				<td><input type="text" id="sample6_postcode" placeholder="우편번호"></td>
				<td><input type="button" onclick="sample6_execDaumPostcode()"
					value="주소찾기"></td></tr>
					<tr>
					<th></th>
				<td><input type="text" id="restaurant_Address" name="restaurant_Address" placeholder="주소"><br>
					<input type="text" id="restaurant_detail_Address" name="restaurant_detail_Address" placeholder="상세주소">
				</td>
			</tr>
			
			<tr>
			<tr height="2" bgcolor="#FFC8C3">
				<td colspan="2"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="회원가입"> <input type="button" value="뒤로가기"
					onclick="history.back()"></td>
			</tr>
		</table>
	</form>

</body>
</html>
