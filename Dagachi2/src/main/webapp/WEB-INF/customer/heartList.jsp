<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>찜 리스트</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://use.fontawesome.com/0206006232.js"></script>
<script type="text/javascript">
function heart(){
	var num= ${owner_num};
	if(num.hasClass("liked")){
	      $(num).html('<i class="fa fa-heart-o" aria-hidden="true"></i>');
	      $(num).removeClass("liked");
	      return "deleteHeart";
	    }else{
	      $(num).html('<i class="fa fa-heart" aria-hidden="true"></i>');
	      $(num).addClass("liked");
	      return "addHeart";
	    }
	
}
</script>
<style type='text/css'>
.fa-heart-o {
  color: red;
  cursor: pointer;
}

.fa-heart {
  color: red;
  cursor: pointer;
}
</style>
</head>
<body>


	<div align="center" width="50" style="font-size: 24px">찜 목록</div>


<form action="deleteHeart" name="heart" method="POST" onsubmit="return heart()">
	<c:forEach var="list" items="${list}">
	<input type="hidden" value="${list.owner_num}" name="owner_num" id="${list.owner_num}" class="liked">
		<div style="float: left; width: 33%;">

			<table border="2" width="500" align="center">

				<tr>
					<td align="center" width="50"><a href="test"> <img
							src="../${list.restaurant_Pic}" id="restaurant_Pic">
					</a> <br> <a href="test" id="restaurant_Name">${list.restaurant_Name}</a>
					<i class="fa fa-heart" aria-hidden="true"></i>
					<button type="submit"  id="heart">
					 </button>
				
		 </td>
				</tr>
			</table>
		</div>

	</c:forEach>
</form>

</body>
</html>