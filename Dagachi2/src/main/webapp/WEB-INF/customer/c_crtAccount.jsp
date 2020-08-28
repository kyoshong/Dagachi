<%@page import="java.util.Calendar"%>
<%
	Calendar cal = Calendar.getInstance(); // 현재 날짜/시간 등의 각종 정보 얻기
int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH) + 1;
int day = cal.get(Calendar.DAY_OF_MONTH);
String monthstr = "";
if (month < 10) {
	monthstr = "0" + month;
} else {
	monthstr = String.valueOf(month);
}
String daystr = "";
if (day < 10) {
	daystr = "0" + day;
} else {
	daystr = String.valueOf(day);
}
String today = year + monthstr + daystr;
request.setAttribute("today", today);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>고객 회원가입</title>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<style>
input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}
</style>
</head>
<body>
	<section id="container">
		<form method="post" action="c_crtAccount">
			<div class="form-group has-feedback">
				<label class="control-label" for="CuserId">아이디 : </label> <input
					class="form-control" type="email" id="CuserId"
					placeholder="이메일을 입력해 주세요" name="customer_Email" /><br>
				<br>
				<button type="button" class="idCheck">아이디 중복확인</button>
				<button type="button" class="emailSend">이메일 인증</button>
			</div>
			<br>
			<div class="result">
				<div class="msg">아이디를 확인하세요.</div>
			</div>
			<br>

			<tr>
				<td>인증번호</td>
				<td><input type="text" id="inputCode" name="inputCode" /></td>
				<td><input type="hidden" id="certificationYN" name="certificationYN" value="false">
				<button type="button" id="inputCodeButton" name="inputCodeButton">인증번호 확인</button></td>
			</tr>

			<br>
			<br>
			<div>
				<label class="control-label" for="CinputCode"></label>
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="CuserPass">패스워드 : </label> <input
					class="form-control" type="password" id="CuserPass1"
					placeholder="비밀번호" name="customer_Password" />
			</div>
			<br>
			<div class="form-group has-feedback">
				<label class="control-label" for="CuserPass">패스워드 확인 : </label> <input
					class="form-control" type="password" id="CuserPass2"
					placeholder="비밀번호확인" />
			</div>
			<div class="alert alert-success" id="alert-success">비밀번호가
				일치합니다.</div>
			<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지
				않습니다.</div>
			<br>
			<div class="form-group has-feedback">
				<label class="control-label" for="CuserName">성명 : </label> <input
					class="form-control" type="text" id="CuserName"
					name="customer_Name" />
			</div>
			<br>
			<div class="form-group has-feedback">
				<label class="control-label" for="CuserGender">성별 :</label> <input
					class="form-control" type="radio" id="CgenderM" value="M"
					name="customer_Gender" /> <label for="CgenderM">남자</label> <input
					class="form-control" type="radio" id="CgenderW" value="F"
					name="customer_Gender" /> <label for="CgenderW">여자</label>
			</div>
			<br>
			<div class="form-group has-feedback">
				<label class="control-label" for="CuserTel">전화번호(-없이 번호만
					입력해주세요)</label><br> <input class="form-control" type="tel"
					id="CuserPhoneNumber" placeholder="전화번호입력" maxlength="11"
					name="customer_PhoneNumber" />
			</div>
			<br>
			<div class="form-group has-feedback">
				<label class="control-label" for="CuserBirth">생년월일 : </label> <input
					class="form-control" type="number" id="CuserBirth"
					placeholder="ex) 20000101" name="customer_Birth" />
			</div>
			<br> <input type="hidden" name="customer_Join_Date"
				value="${today}" id="CuserJoin_Date" readonly />
			<div class="form-group has-feedback">
				<button class="btn btn-success" type="submit" id="submit">회원가입</button>
				<button class="cencle btn btn-danger" type="button">취소</button>
			</div>
		</form>
	</section>
</body>

<script type="text/javascript">
	$(document).ready(function() {
		// 취소
		$(".cencle").on("click", function() {
			location.href = "c_login";
		})

		//필수항목 입력 확인
		$("#submit").on("click", function() {
			if ($("#CuserId").val() == "") {
				alert("아이디를 입력해주세요.");
				$("#CuserId").focus();
				return false;
			}
			if ($("#CuserPass1").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#CuserPass1").focus();
				return false;
			}
			if ($("#CuserPass2").val() == "") {
				alert("비밀번호를 확인해주세요.");
				$("#CuserPass2").focus();
				return false;
			}
			if ($("#CuserName").val() == "") {
				alert("성명을 입력해주세요.");
				$("#CuserName").focus();
				return false;
			}
			if ($("#CuserPhoneNumber").val() == "") {
				alert("전화번호를 입력해주세요.");
				$("#CuserPhoneNumber").focus();
				return false;
			}
			if ($("#CuserBirth").val() == "") {
				alert("생년월일 입력해주세요.");
				$("#CuserBirth").focus();
				return false;
			}
		});
	})
	
	//비밀번호 일치여부 확인
	$(function() {
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("input").keyup(function() {
			var CuserPass1 = $("#CuserPass1").val();
			var CuserPass2 = $("#CuserPass2").val();
			if (CuserPass1 != "" || CuserPass2 != "") {
				if (CuserPass1 == CuserPass2) {
					$("#alert-success").show();
					$("#alert-danger").hide();
					$("#submit").removeAttr("disabled");
				} else {
					$("#alert-success").hide();
					$("#alert-danger").show();
					$("#submit").removeAttr("disabled", "disabled");
				}
			}
		});
	});

	//<button type="button" class="idCheck">아이디 중복확인</button>
	//아이디 중복확인
	$(".idCheck").click(function() {

		var chk = {
			"customer_Email" : $("#CuserId").val()
		};
		$.ajax({
			url : "idCheck",
			type : "post",
			data : chk,
			success : function(data) {
				if (data == 1) {
					$(".result .msg").text("이미 가입된 계정입니다.");
					$(".result .msg").attr("style", "color:#f00");
				} else {
					$(".result .msg").text("사용 가능한 계정입니다.");
					$(".result .msg").attr("style", "color:#00f");
				}
			}
		});
	});
	
	//<button type="button" class="emailSend">이메일 인증</button>
	//이메일 인증
	$(".emailSend").click(function() {

		var customer_Email = $("#CuserId").val();
		$.ajax({
			url : "emailSend",
			type : "POST",
			data : {
				"customer_Email" : customer_Email
			},//?
			success : function(data) {
				console.log(data);
				alert("이메일로 인증번호가 발송 되었습니다.")
				return false;
			},
			error : function() {
				console.log(data);
				alert("다시 시도하세요")
				return false;
			}
		});
	});

	//이메일 인증 확인
	$("#inputCodeButton").click(function() {
		var fal = "false";
		var tr = "true";

		var customer_Email = $("#CuserId").val();
		var inputCode = $("#inputCode").val();
		$.ajax({
			url : "certification",
			data : {
				"customer_Email" : customer_Email,
				"inputCode" : inputCode
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
			}
		});
	});
</script>
</html>