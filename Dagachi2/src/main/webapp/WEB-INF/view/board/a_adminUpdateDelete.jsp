<%@page import="java.util.function.Function"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<title>관리자 등록</title>

<script>


//alert check function
function chk() {

	var d = document.forms.adminUpdate;
	
	 //사용자명
	 if(d.admin_Name.value.trim() == "") {
		 alert("사용자명을 입력해 주세요.");
		d.admin_Name.focus();
		return false;
	}
	//암호
	else if(d.admin_Password.value.trim() == "") {
		 alert("암호를 입력해 주세요.");
		d.admin_Password.focus();
		return false;
	}
	//E-mail
	else if(d.admin_Email.value.trim() == "") {
		 alert("E-mail을 입력해 주세요.");
		d.admin_Email.focus();
		return false;
	}
	//연락처
	else if(d.admin_PhoneNumber.value.trim() == "") {
		 alert("연락처를 입력해 주세요.");
		d.admin_PhoneNumber.focus();
		return false;
	}
	//그룹
	else if(d.dept.value.trim() == "") {
		 alert("사용자 그룹을 입력해 주세요.");
		d.dept.focus();
		return false;
	}

	else {
		alert("수정되었습니다.")
		}

}


</script>

</head>
<body>

<form id="adminUpdate" action="adminUpdate" method="post" onsubmit="return chk()">
	<table border="3" align="center">
		<thead>
		<tr>
		<th border="2">관리자 정보수정</th>
		</tr>
		</thead>
		
		<td>
		<p style="padding-right: 4px; padding-left: 4px;align-self: center;">사용자 ID <input type="text" id="admin_Id"name="admin_Id" value="${adminUpdate.admin_Id}" readonly="readonly" style="background-color: #D0CECD;">
		<input type="text" id="admin_Num" name="admin_Num" value="${adminUpdate.admin_Num}" style="width: 16px;background-color: #D0CECD;text-align: center;" readonly="readonly"><br/>
		사용자명 <input type="text" id="admin_Name" name="admin_Name" value="${adminUpdate.admin_Name}"> <br/>
		암호 <input type="password" id="admin_Password" name="admin_Password" value="${adminUpdate.admin_Password}"><br/>
		E-mail <input type="text" id="admin_Email" name="admin_Email" value="${adminUpdate.admin_Email}"> <br/>
		연락처 <input type="text" id="admin_PhoneNumber" name="admin_PhoneNumber" value="${adminUpdate.admin_PhoneNumber}"> <br/>
		사용 여부   <select id="admin_Author" name="admin_Author" style="vertical-align: middle;padding-bottom:3px;" >			
		<option>사원</option>
		<option>슈퍼바이저</option>
		</select><br/>
		사용자 그룹 <input type="text" value="${adminUpdate.dept}" name="dept" >
		<p align="center">
		<input type="submit" value="수정">
		<input type="button" value="삭제" name="delete" onclick="location.href='adminDel?admin_Num=${adminUpdate.admin_Num}'">
		<input type="button" value="취소" onclick="history.go(-1)"></td></p>
		</p>
	</table>
</form>

</body>
</html>