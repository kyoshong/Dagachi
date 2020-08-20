<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>  
<head>
<title>게시물 목록</title>
</head>
<body>
<br><br>                          
회원이신가요 
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
<a href="owner/login">owner login</a>
<br><br>

현종이 입니다?

<a href="board/a_noticeList">게시물 목록</a> <br/>
<a href="board/a_adminAccountList">관리자 목록</a> <br/>
<a href="board/c_main">메인페이지</a>
<br><br>
현재입니다

<div align="center">
		<a href="board/a_ownerReceiptList">가맹대기</a> 
		<a href="board/a_ownerDetailInfoList">가맹정보</a> 
	</div>
	
</body>
</html>  