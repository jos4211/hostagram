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
						    <li><a href="./edit4.jsp" class="price1_choice">이메일 및 SMS</a></li>
						    <li><a href="./edit5.jsp" class="price1_not_choice">푸시 알림</a></li>
						    <li><a href="./edit6.jsp" class="price1_not_choice">연락처 관리</a></li>
						    <li><a href="./edit7.jsp" class="price1_not_choice">공개 범위 및 보안</a></li>
						    <li><a href="./edit8.jsp" class="price1_not_choice">로그인 활동</a></li>
						    <li><a href="./edit9.jsp" class="price1_not_choice">Instagram에서 보낸 이메일</a></li>
						</ul>
                        <div class="price2 p4">
                            <div>
                                <div class="p4_nav">
                                    <h2 class="p4_h">받아보기:</h2>
                                </div>
                                <div class="p4_main">
                                    <label><input type="checkbox" checked> <span class="sp4">의견 이메일</span></label>
                                    <p>Instagram에서 의견을 보내보세요.</p>
                                </div>
                                <div class="p4_main">
                                    <label><input type="checkbox" checked> <span class="sp4">알림 이메일</span></label>
                                    <p>확인하지 않은 알림을 받아보세요.</p>
                                </div>
                                <div class="p4_main">
                                    <label></label><input type="checkbox" checked> <span class="sp4">제품 이메일</span></label>
                                    <p>Instagram 도구에 관한 팁을 확인해보세요.</p>
                                </div>
                                <div class="p4_main">
                                    <label><input type="checkbox" checked> <span class="sp4">뉴스 이메일</span></label>
                                    <p>Instagram의 새로운 기능에 대해 자세히 알아보세요.</p>
                                </div>
                                <div class="p4_main">
                                    <label></label><input type="checkbox" checked> <span class="sp4">SMS 이메일</span></label>
                                    <p>SMS로 알림을 받아보세요.</p>
                                </div>
                            </div>
                        </div>
                    </div>
            <!-- End -->   
        </div>
    </div>
	<%@ include file="./mainFooter.jsp" %>
</form>
</div>
</body>
</html>