<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>리모컨</title>
</head>
<body>

<a href="reviewCustomer/reviewCustomerList?owner_Num=12&num=1">리뷰 게시판</a><br>
<a href="reviewCustomer/postReview?owner_Num=12&num=1">리뷰 작성</a><br>
<%-- <a href="review/list?owner_Num=${owner_Num}"</a>리뷰 게시판<br> --%>
<a href="reviewOwner/reviewOwnerList?owner_Num=12&num=1">사장님 리뷰 게시판</a><br>
<a href="storeManagement/storeInfoChangeForm">매장정보수정</a><br>
<a href="menuManagement/menuList?owner_Num=12">메뉴관리</a><br>
<a href="reservationCustomer/reservationForm">예약페이지 폼</a><br>
<a href="reservationStastics/timeChart?owner_Num=12">예약현황분석</a><br>
</body>
</html>