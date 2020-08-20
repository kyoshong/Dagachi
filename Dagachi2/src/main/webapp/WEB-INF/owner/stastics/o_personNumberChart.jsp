<%@page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<body>

<a href="timeChart?owner_Num=12">시간별</a> &nbsp; 
<a href="personNumberChart?owner_Num=12">인원별</a>
<div id="piechart" style="width: 900px; height: 500px;"></div>
</body>

<script>
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {

  var data = google.visualization.arrayToDataTable([
    ['Task', 'Hours per Day'],
    ['1,2인',     ${list.get(0)}],
    ['3,4인',      ${list.get(1)}],
    ['5~8인',  ${list.get(2)}],
    ['단체(9인이상)', ${list.get(3)}],
  ]);

  var options = {
    title: '예약 인원 수 분석'
  };

  var chart = new google.visualization.PieChart(document.getElementById('piechart'));

  chart.draw(data, options);
}
</script>
</html>