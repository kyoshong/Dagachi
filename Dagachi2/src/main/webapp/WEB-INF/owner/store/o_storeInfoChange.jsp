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
<title>매장 정보 수정</title>
</head>
<body>

<form enctype="multipart/form-data" method="post">
<table>

<tr>
<td><input type="hidden" name="owner_Num" value="${owner_Num}"></td>
</tr>
<tr>
<td><input type="hidden" name="restaurant_Num" value="${restaurant_Num}"/></td>
</tr>

<tr>
<td><label>매장명</label></td>
<td><input type="text" name="restaurant_Name" value="${restaurant_Name}" readonly/></td>
</tr>

<tr>
<td><label>업종</label></td>
<td><select id="sector" name="restaurant_Sector">
<option value="한식">한식</option>
<option value="양식">양식</option>
<option value="중식">중식</option>
<option value="일식">일식</option>
<option value="분식">분식</option>
<option value="디저트">디저트</option>
<option value="기타">기타</option>
</select>
</td>
</tr>

<tr>
<td><label>매장전화번호</label></td>
<td><input type="text" name="owner_PhoneNumber"/></td>
</tr>

<tr>
<td><label>시간대</label></td>
<td><input type="text" name="opening_Hours"/></td>
</tr>

<tr>
<td><label>수용 인원</label></td>
<td><input type="text" name="capacity"/></td>
</tr>

<tr>
<td><label>검색키워드</label></td>
<td><input type="checkbox" name="dating" value="Y" />데이트

<input type="checkbox" name="groupReserv" value="Y"/>단체

<input type="checkbox" name="friend" value="Y"/>친구

<input type="checkbox" name="family" value="Y"/>가족
</td>
</tr>



<%-- <%=request.getRealPath("/") %> --%>

<tr>
<td><label for="restaurant_Pic">매장사진</label></td>
<td>
<input type="file" id="restaurant_Pic" name="file" />
<div class="select_img"><img src="" /></div>
</td>
<tr>

<tr>
<td><label>매장주소</label></td>
<td>
<!-- <input id="postcode1" type="text" value="" style="width:50px;" readonly/>

	&nbsp;-&nbsp;

	<input id="postcode2" type="text" value="" style="width:50px;" readonly/>

	&nbsp;&nbsp; -->

	<input id="zonecode" type="text" value="" style="width:50px;" readonly/>

	&nbsp;
	<input type="button" onClick="openDaumZipAddress();" value = "주소 찾기" />

	<br/>

	<input type="text" id="address" name="restaurant_Address" style="width:240px;" value="${restaurant_Address}" readonly/>

	<input type="text" id="address_etc" name="restaurant_Detail_Address" style="width:200px;" value="${restaurant_Detail_Address}"/>
</td>
</tr>

<tr>
<td><label>유아 놀이방</label></td>
<td><select name="playGround">
<option value="Y">있음</option>
<option value="N">없음</option>
</select>
</td>
</tr>

<tr>
<td><label>주차장</label></td>
<td><select name="parking_Lot">
<option value="Y">있음</option>
<option value="N">없음</option>
</select>
</td>
</tr>

</table>

<button type="submit" class="btn_enroll">등록</button>
</form>

<script>
  $("#restaurant_Pic").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img img").attr("src", data.target.result).width(500);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
</script>

<!-- <script> /* 체크박스 */
if ($('input[name=checkBoxDating]').is(":checked")) {
    $('input[name=dating]').val('Y');
} else {
    $('input[name=dating]').val('N');
}

if ($('input[name=checkBoxGroup]').is(":checked")) {
    $('input[name=groupReserv]').val('Y');
} else {
    $('input[name=groupReserv]').val('N');
}

if ($('input[name=checkBoxFriend]').is(":checked")) {
    $('input[name=friend]').val('Y');
} else {
    $('input[name=friend]').val('N');
}

if ($('input[name=checkBoxFamily]').is(":checked")) {
    $('input[name=family]').val('Y');
} else {
    $('input[name=family]').val('N');
}

</script> -->


</body>
</html>