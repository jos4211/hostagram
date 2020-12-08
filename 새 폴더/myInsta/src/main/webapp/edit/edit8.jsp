<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="./mainTitle.jsp" %>
</head>
<body>
<div id="wrap">
<form id="h_reform">
	<%@ include file="./mainHead.jsp" %>
    <div id="container">
        <div class="main_rolling_pc box_inner">
            <!-- 이 아래부터는 각자알아서 알맞게 -->
            <div class="content">
	            <ul class="price1">
				    <li><a href="./edit1.jsp" class="price1_not_choice">프로필 편집</a></li>
				    <li><a href="./edit2.jsp" class="price1_not_choice">비밀번호 변경</a></li>
				    <li><a href="./edit3.jsp" class="price1_not_choice">앱 및 웹사이트</a></li>
				    <li><a href="./edit4.jsp" class="price1_not_choice">이메일 및 SMS</a></li>
				    <li><a href="./edit5.jsp" class="price1_not_choice">푸시 알림</a></li>
				    <li><a href="./edit6.jsp" class="price1_not_choice">연락처 관리</a></li>
				    <li><a href="./edit7.jsp" class="price1_not_choice">공개 범위 및 보안</a></li>
				    <li><a href="./edit8.jsp" class="price1_choice">로그인 활동</a></li>
				    <li><a href="./edit9.jsp" class="price1_not_choice">Instagram에서 보낸 이메일</a></li>
				</ul>
            </div>
            <!-- End -->   
        </div>
    </div>
	<%@ include file="./mainFooter.jsp" %>
</form>
</div>
</body>
</html>