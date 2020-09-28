<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>  
<head>
<title>게시물 목록</title>
</head>
<body>
<br><br>                          
회원이신가요 <br>
<a href="customer/heartList">내 찜 목록</a>
<a href="customer/orderList">내 주문리스트</a>

<a href="customer/myInfo">내정보 수정</a>

<br><br>
관리자 입미까?
<br>
<a href="admin/list">Admin's Review list</a>
<br>	
<a href="admin/infoList">Customer Info list</a>

<br><br>
사장입니까?
<a href="owner/joinForm">회원 가입하기</a>
<br>

<a href="owner/loginOwnerForm">owner login</a>

<br><br>
------------------------------------------------------------------------
현종이 입니다?
<br>

<a href="mem/customer/c_crtAccount">고객 회원가입</a><br><br>

<a href="mem/customer/c_login">고객 로그인</a><br><br>

<a href="mem/admin/a_adminInsert">관리자 회원가입</a><br><br>

<a href="mem/admin/a_login">관리자 로그인</a><br><br>

<li><a href="customer/c_boardlist">Customer Question Page</a></li>
<li><a href="owner/o_boardlist">Owner Question Page</a></li>

<!-- <a href="mem/admin/admin/a_register">폴더 안 관리자 회원가입 </a><br><br>
<a href="mem/admin/admin/a_login">폴더 안 관리자 로그인</a><br><br>-->
-----------------------------------------------------------------------
현재입니다<br>
<a href="board/a_noticeList">게시물 목록</a> <br/>
<a href="board/a_adminAccountList">관리자 목록</a> <br/>
<a href="board/c_main">메인페이지</a>
<br><br>
--------------------------------------------------------------------------------------------------
용환입니다
<div align="left">
		<a href="board/a_ownerReceiptList">가맹대기</a> <br>
		<a href="board/a_ownerDetailInfoList">가맹정보</a> <br>
		<a href="customer/c_searchRestaurant">음식점 상세검색</a>
	</div><br><br>
---------------------------------------------------------------
	한기입니다.
<br>
<a href="reviewCustomer/reviewCustomerList?owner_Num=12&num=1">리뷰 게시판</a><br>
<a href="reviewCustomer/postReview?owner_Num=12&num=1">리뷰 작성</a><br>
<%-- <a href="review/list?owner_Num=${owner_Num}"</a>리뷰 게시판<br> --%>
<a href="reviewOwner/reviewOwnerList?num=1">사장님 리뷰 게시판</a><br>
<a href="storeManagement/storeInfoChangeForm">매장정보수정</a><br>
<a href="menuManagement/menuList">메뉴관리</a><br>
<a href="er/reservationForm">예약페이지 폼</a><br>
<a href="reservationStastics/timeChart">예약현황분석</a><br>
<a href="owner/ownerInfoChange">내 정보 수정(사장)</a><br>



---------------------------------------------------------------
선하

<ul>
<li><a href="owner/main">사장님페이지</a></li>

<li><a href="admin/c_questionList">admin Customer Question List</a></li>
<li><a href="admin/o_questionList">admin Owner Question List</a></li>

</ul>

-0928
</body>
</html>  