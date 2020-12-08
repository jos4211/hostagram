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
						    <li><a href="./edit6.jsp" class="price1_choice">연락처 관리</a></li>
						    <li><a href="./edit7.jsp" class="price1_not_choice">공개 범위 및 보안</a></li>
						    <li><a href="./edit8.jsp" class="price1_not_choice">로그인 활동</a></li>
						    <li><a href="./edit9.jsp" class="price1_not_choice">Instagram에서 보낸 이메일</a></li>
						</ul>
                        <div class="price2 p6">
                            <div class="p6_content">
                                <div class="p6_main">
                                    <h1 class="p6_h">연락처 관리</h1>
                                </div>
                                <div class="p6_main2">
                                    <p>Instagram에 업로드한 연락처입니다. 동기화된 연락처를 삭제하려면 모두 삭제를 누르세요. 이 페이지에서 연락처를 삭제해도 
                                    휴대폰에 추가하는 새 연락처가 계속 업로드됩니다. 동기화를 중지하려면 기기 설정으로 이동하여 연락처에 대한 액세스 권한을 해제하세요.</p>
                                </div>
                                <div class="p6_main2">
                                    <p>업로드한 연락처 정보는 Instagram이 회원님에게 친구를 추천하거나 이용 환경을 개선하는 데 사용됩니다. 이 연락처 정보는 회원님만 볼 수 있습니다.</p>
                                </div>
                                <div class="p6_main3">
                                    <p>동기화된 연락처 0개</p>
                                    <button>모두 삭제</button>
                                </div>
                                <div class="p6_main4">
                                    <p>Instagram에 연락처를 업로드하면 여기에 표시됩니다.</p>
                                </div>
                                <div class="p6_main5">
                                    <button>모두 삭제</button>
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