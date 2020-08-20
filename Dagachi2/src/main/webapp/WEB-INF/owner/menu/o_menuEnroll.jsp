<%@page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>메뉴 등록</title>
</head>
<body>
<h4 style="text-align:center">메뉴 등록</h4>

<form method= "post" enctype="multipart/form-data">
<table border="1" cellspacing="1" align="center">

<tr>
<td><label>가맹 번호</label></td>
<td><input type="text" name="owner_Num"/></td>
</tr>

<tr>
<td><label>메뉴 이름</label></td>
<td><input type="text" name="menu_Name" /></td>
</tr>

<tr>
<td><label>메뉴 설명</label></td>
<td><textarea cols="50" rows="5" name="menu_Des"></textarea></td>
</tr>

<tr>
<td><label>메뉴 가격</label></td>
<td><input type="text" name="menu_Price" /></td>
</tr>

<tr>
<td><label for="menu_Pic">사진 등록</label></td>
<td>
<input type="file" id="menu_Pic" name="file" />
<div class="select_img"><img src="" /></div>
</td>
</tr>

</table>

<button type="submit" class="btn_enroll">등록</button>
<button type="button" class="btn_cancel" onclick="history.go(-1)">취소</button>
</form>

<script>
  $("#review_Pic").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img img").attr("src", data.target.result).width(500);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
 </script>

</body>
</html>