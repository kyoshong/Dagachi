<%@page contentType="text/html; charset=utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>메뉴 수정</title>
</head>
<body>

<h4 style="text-align:center">메뉴 수정</h4>
<c:forEach items="${menuContent}" var="menuContent">
<form method= "post" enctype="multipart/form-data">
<table border="1" cellspacing="1" align="center">


<tr>
<td><label>메뉴 이름</label></td>
<td><input type="text" name="menu_Name" placeholder="${menuContent.menu_Name}" /></td>
<td><input type="hidden" name="owner_Num" value="${member.owner_num}"/></td>
</tr>

<tr>
<td><label>메뉴 설명</label></td>
<td><textarea cols="50" rows="5" name="menu_Des" placeholder="${menuContent.menu_Des}"></textarea></td>
</tr>

<tr>
<td><label>메뉴 가격</label></td>
<td><input type="text" name="menu_Price" placeholder="${menuContent.menu_Price}"/></td>
</tr>

<tr>
<td><label for="menu_Pic">사진 등록</label></td>
<td>
<input type="file" id="menu_Pic" name="file" />
<div class="select_img"><img src="" /></div>
</td>
</tr>

</table>

<button type="submit" class="btn_enroll">메뉴 수정</button>
<button type="button" class="btn_cancel" onclick="history.go(-1)">취소</button>
</form>
</c:forEach>
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