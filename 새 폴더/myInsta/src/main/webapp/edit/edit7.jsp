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
            <div class="content content_p7">
                        <ul class="price1">
						    <li><a href="./edit1.jsp" class="price1_not_choice">프로필 편집</a></li>
						    <li><a href="./edit2.jsp" class="price1_not_choice">비밀번호 변경</a></li>
						    <li><a href="./edit3.jsp" class="price1_not_choice">앱 및 웹사이트</a></li>
						    <li><a href="./edit4.jsp" class="price1_not_choice">이메일 및 SMS</a></li>
						    <li><a href="./edit5.jsp" class="price1_not_choice">푸시 알림</a></li>
						    <li><a href="./edit6.jsp" class="price1_not_choice">연락처 관리</a></li>
						    <li><a href="./edit7.jsp" class="price1_choice">공개 범위 및 보안</a></li>
						    <li><a href="./edit8.jsp" class="price1_not_choice">로그인 활동</a></li>
						    <li><a href="./edit9.jsp" class="price1_not_choice">Instagram에서 보낸 이메일</a></li>
						</ul>
                        <div class="price2 p7">
                            <div class="p7_content">
                                <div class="p7_main">
                                    <h1 class="p7_h">계정 공개 범위</h1>
                                    <label><input type="checkbox"> <span class="sp7">비공개 계정</span></label>
                                    <p>계정이 비공개 상태인 경우 회원님이 승인한 사람만 Instagram에서 회원님의 사진과 동영상을 볼 수 있습니다. 기존 팔로워는 영향을 받지 않습니다.</p>
                                </div>
                                <div class="p7_main">
                                    <h1 class="p7_h">활동 상태</h1>
                                    <label><input type="checkbox" checked> <span class="sp7">활동 상태 표시</span></label>
                                    <p>Instagram 앱에서 최근 활동한 시간 정보가 회원님이 팔로우하는 계정 및 메시지를 보낸 모든 사람에게 표시됩니다. 
                                    이 설정을 해제하면 다른 계정의 활동 상태를 볼 수 없습니다.</p>
                                </div>
                                <div class="p7_main">
                                    <h1 class="p7_h">스토리 공유</h1>
                                    <label><input type="checkbox" checked> <span class="sp7">공유 허용</span></label>
                                    <p>사람들이 회원님의 스토리를 메시지로 공유할 수 있습니다</p>
                                </div>
                                <div class="p7_main">
                                    <h1 class="p7_h">댓글</h1>
                                    <p><a href="#">댓글 설정 수정</a></p>
                                </div>
                                <div class="p7_main">
                                    <h1 class="p7_h">내가 나온 사진</h1>
                                    <label><input type="radio" name="ra1" checked> <span class="sp7">자동으로 추가</span></label><br>
                                    <label><input type="radio" name="ra1"> <span class="sp7">수동으로 추가</span></label><br>
                                    <p>회원님이 나온 사진을 프로필에 추가할 방법을 선택하세요. 회원님이 나온 사진에 대해 <a href="#">더 알아보기</a></p>
                                </div>
                                <div class="p7_main">
                                    <h1 class="p7_h">계정 데이터</h1>
                                    <p><a href="#">계정 데이터 보기</a></p>
                                </div>
                                <div class="p7_main">
                                    <h1 class="p7_h">2단계 인증</h1>
                                    <p><a href="#">2단계 인증 설정 수정</a></p>
                                </div>
                                <div class="p7_main">
                                    <h1 class="p7_h">데이터 다운로드</h1>
                                    <p><a href="#">다운로드 요청</a></p>
                                </div>
                                <div class="p7_main p7_last">
                                    <h1 class="p7_h">공개 범위 및 보안 도움말</h1>
                                    <p><a href="#">지원</a></p>
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