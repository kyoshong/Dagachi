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
    ['오전(9~12)',     ${list.get(0)}],
    ['점심(12~15)',      ${list.get(1)}],
    ['15~18',  ${list.get(2)}],
    ['저녁(18~21)', ${list.get(3)}],
    ['밤 9시 이후',    ${list.get(4)}]
  ]);

  var options = {
    title: '예약 시간 분석'
  };

  var chart = new google.visualization.PieChart(document.getElementById('piechart'));

  chart.draw(data, options);
}
</script>
</html>