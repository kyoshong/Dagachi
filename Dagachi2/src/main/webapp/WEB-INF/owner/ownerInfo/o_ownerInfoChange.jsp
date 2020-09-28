<%@page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">

		function openDaumZipAddress() {

			new daum.Postcode({

				oncomplete:function(data) {

					/* jQuery("#postcode1").val(data.postcode1);

					jQuery("#postcode2").val(data.postcode2); */

					jQuery("#zonecode").val(data.zonecode);

					jQuery("#address").val(data.address);

					jQuery("#address_etc").focus();

					console.log(data);

				}

			}).open();

		}

</script>


<title>정보 수정</title>
</head>
<body>
<h4>내 정보</h4>
<form method="post" onsubmit="return success()">

<label>이름</label>
<input type="text" name="owner_name" value="${ownerInfo.owner_name}">
<input type="hidden" name="owner_num" value= "${ownerInfo.owner_num}">
<br>

<label>이메일 계정</label>
<input type="text" name="owner_email" value="${ownerInfo.owner_email }"  readonly><br>

<label>비밀번호</label>
<input type="password" id="pwd" name="owner_password" value="${ownerInfo.owner_password }" required><br>

<label>비밀번호 확인</label>
<input type="password" id="pwd_check" class="pw" value="${ownerInfo.owner_password }" required >
<span id="alert-success" style="display: none;">비밀번호가 일치합니다.</span>
<span id="alert-danger" style="display: none; color: #d92742; font-weight: bold; ">비밀번호가 일치하지 않습니다.</span><br>



<label>주민등록번호</label>
<input type="text" name="owner_SecurityNum" value="${ownerInfo.owner_SecurityNum}" ><br>

<label>상호명</label>
<input type="text" name="restaurant_Name" value="${ownerInfo.restaurant_Name}" ><br>

<label>사업자등록번호</label>
<input type="text" name="restaurant_Num" value="${ownerInfo.restaurant_Num}" ><br>

<label>업체 주소지</label>
<input id="zonecode" type="text" value="" style="width:50px;" readonly/>
&nbsp;
<input type="button" onClick="openDaumZipAddress();" value = "주소 찾기" /><br/>
<input type="text" id="address" name="restaurant_Address" style="width:240px;" value="${ownerInfo.restaurant_Address}" readonly/>
<input type="text" id="address_etc" name="restaurant_detail_Address" style="width:200px;" value="${ownerInfo.restaurant_detail_Address}"/><br>



<label>대표 연락처</label>
<input type="text" name="owner_phonenumber" value="${ownerInfo.owner_phonenumber }" ><br>


<input type="submit" id="submit" value="수정">
<input type="button" value="취소" onclick="goBack();">

</form>


<!-- 비밀번호 일치/불일치 -->
<script>
$('.pw').focusout(function () {
    var pwd1 = $("#pwd").val();
    var pwd2 = $("#pwd_check").val();

    if ( pwd1 != '' && pwd2 == '' ) {
        null;
    } else if (pwd1 != "" || pwd2 != "") {
        if (pwd1 == pwd2) {
            $("#alert-success").css('display', 'inline-block');
            $("#alert-danger").css('display', 'none');
        } else {
            alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
            $("#alert-success").css('display', 'none');
            $("#alert-danger").css('display', 'inline-block');
        }
    }
});
</script>


<!-- 취소버튼 -->

<script>
function goBack(){

	window.history.back();
}
</script>

<script>
function success() {
	alert("수정되었습니다.");
}
</script>



</body>
</html>