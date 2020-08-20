<%@page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>예약 상세페이지</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-3.5.1.js"></script>
  <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>

<form>
<table>

<tr><td>인원</td><td><select name="number_Of_People">
<option value="" selected disabled>인원</option>
<option value="1" >1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
</select>
</td></tr>

<tr><td>예약 날짜 선택</td><td>
<input type="text" id="datepicker" placeholder="날짜를 선택해주세요." name="date_Of_Use"></td></tr>

<tr><td>예약자명</td><td>
<input type="text" name="reserv_Name"></td></tr>

<tr><td>전화번호 입력</td><td>
<input type="text" name="customer_PhoneNumber"></td><td><input type="button" value="인증번호 전송"></td></tr>
 
<tr><td></td><td><input type="text" placeholder="인증번호 입력"></td><td><input type="button" value="인증번호 확인"></td></tr>

<tr><td></td><td></td><td><input type="button" value="결제하기"></td></tr>
</table>
</form>

<script>
$("#datepicker").datepicker({ minDate: 0}); //datepicker생성 및 오늘 날짜부터 선택 가능

$.datepicker.setDefaults({
    dateFormat: 'yy년 mm월 dd일' //Input Display Format 변경
}); 

$.datepicker.setDefaults({
    monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
    ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
    ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
    ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
});

</script>


</body>
</html>