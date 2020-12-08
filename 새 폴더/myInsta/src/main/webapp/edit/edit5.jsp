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
            <div class="content content_p5">
                        <ul class="price1">
						    <li><a href="./edit1.jsp" class="price1_not_choice">프로필 편집</a></li>
						    <li><a href="./edit2.jsp" class="price1_not_choice">비밀번호 변경</a></li>
						    <li><a href="./edit3.jsp" class="price1_not_choice">앱 및 웹사이트</a></li>
						    <li><a href="./edit4.jsp" class="price1_not_choice">이메일 및 SMS</a></li>
						    <li><a href="./edit5.jsp" class="price1_choice">푸시 알림</a></li>
						    <li><a href="./edit6.jsp" class="price1_not_choice">연락처 관리</a></li>
						    <li><a href="./edit7.jsp" class="price1_not_choice">공개 범위 및 보안</a></li>
						    <li><a href="./edit8.jsp" class="price1_not_choice">로그인 활동</a></li>
						    <li><a href="./edit9.jsp" class="price1_not_choice">Instagram에서 보낸 이메일</a></li>
						</ul>
                        <div class="price2 p5">
                            <div class="p5">
                                <div class="p5_main">
                                    <h1 class="p5_h">좋아요</h1>
                                    <label><input type="radio" name="ra1"> <span class="sp5">해제</span></label><br>
                                    <label><input type="radio" name="ra1"> <span class="sp5">내가 팔로우하는 사람</span></label><br>
                                    <label><input type="radio" name="ra1" checked> <span class="sp5">모든 사람</span></label><br>
                                    <p class="p5_p">johnappleseed님이 회원님의 사진을 좋아합니다.</p>
                                </div>
                            </div>
                            <div class="p5">
                                <div class="p5_main">
                                    <h1 class="p5_h">댓글</h1>
                                    <label><input type="radio" name="ra2"> <span class="sp5">해제</span></label><br>
                                    <label><input type="radio" name="ra2"> <span class="sp5">내가 팔로우하는 사람</span></label><br>
                                    <label><input type="radio" name="ra2" checked> <span class="sp5">모든 사람</span></label><br>
                                    <p class="p5_p">johnappleseed님이 회원님의 사진을 좋아합니다.</p>
                                </div>
                            </div>
                            <div class="p5">
                                <div class="p5_main">
                                    <h1 class="p5_h">댓글 좋아요</h1>
                                    <label><input type="radio" name="ra3"> <span class="sp5">해제</span></label><br>
                                    <label><input type="radio" name="ra3" checked> <span class="sp5">내가 팔로우하는 사람</span></label><br>
                                    <p class="p5_p">johnappleseed님이 회원님의 댓글을 좋아합니다: "멋지네요!"</p>
                                </div>
                            </div>
                            <div class="p5">
                                <div class="p5_main">
                                    <h1 class="p5_h">회원님이 나온 사진의 좋아요 및 댓글</h1>
                                    <label><input type="radio" name="ra4"> <span class="sp5">해제</span></label><br>
                                    <label><input type="radio" name="ra4" checked> <span class="sp5">내가 팔로우하는 사람</span></label><br>
                                    <label><input type="radio" name="ra4"> <span class="sp5">모든 사람</span><br>
                                    <p class="p5_p">johnappleseed님이 회원님이 태그된 게시물에 댓글을 남겼습니다.</p>
                                </div>
                            </div>
                            <div class="p5">
                                <div class="p5_main">
                                    <h1 class="p5_h">수락한 팔로우 요청</h1>
                                    <label><input type="radio" name="ra5"> <span class="sp5">해제</span></label><br>
                                    <label><input type="radio" name="ra5" checked> <span class="sp5">모든 사람</span></label><br>
                                    <p class="p5_p">John Appleseed(@johnappleseed)님이 팔로우 요청을 수락했습니다.</p>
                                </div>
                            </div>
                            <div class="p5">
                                <div class="p5_main">
                                    <h1 class="p5_h">Instagram 친구에 관한 알림</h1>
                                    <label><input type="radio" name="ra6"> <span class="sp5">해제</span></label><br>
                                    <label><input type="radio" name="ra6" checked> <span class="sp5">모든 사람</span></label><br>
                                    <p class="p5_p">Facebook 친구 John Appleseed님이 Instagram에서 사용하는 계정은 johnappleseed입니다.
                                    </p>
                                </div>
                            </div>
                            <div class="p5">
                                <div class="p5_main">
                                    <h1 class="p5_h">Instagram Direct 요청</h1>
                                    <label><input type="radio" name="ra7"> <span class="sp5">해제</span></label><br>
                                    <label><input type="radio" name="ra7" checked> <span class="sp5">모든 사람</span></label><br>
                                    <p class="p5_p">johnappleseed님이 메시지를 보내고 싶어합니다.
                                    </p>
                                </div>
                            </div>
                            <div class="p5">
                                <div class="p5_main">
                                    <h1 class="p5_h">Instagram Direct</h1>
                                    <label><input type="radio" name="ra8"> <span class="sp5">해제</span></label><br>
                                    <label><input type="radio" name="ra8" checked> <span class="sp5">모든 사람</span></label><br>
                                    <p class="p5_p">johnappleseed님이 메시지를 보냈습니다.
                                    </p>
                                </div>
                            </div>
                            <div class="p5">
                                <div class="p5_main">
                                    <h1 class="p5_h">알림</h1>
                                    <label><input type="radio" name="ra9"> <span class="sp5">해제</span></label><br>
                                    <label><input type="radio" name="ra9" checked> <span class="sp5">모든 사람</span></label><br>
                                    <p class="p5_p">"알림을 읽지 않으셨습니다" 등을 안내하는 알림입니다.
                                    </p>
                                </div>
                            </div>
                            <div class="p5">
                                <div class="p5_main">
                                    <h1 class="p5_h">첫 게시물과 스토리</h1>
                                    <label><input type="radio" name="ra10"> <span class="sp5">해제</span></label><br>
                                    <label><input type="radio" name="ra10"> <span class="sp5">내가 팔로우하는 사람</span></label><br>
                                    <label><input type="radio" name="ra10" checked> <span class="sp5">모든 사람</span></label><br>
                                    <p class="p5_p">johnappleseed님의 첫 Instagram 스토리 게시 등을 안내하는 알림입니다.
                                    </p>
                                </div>
                            </div>
                            <div class="p5 p5_last">
                                <div class="p5_main">
                                    <h1 class="p5_h">지원 요청</h1>
                                    <label><input type="radio" name="ra11"> <span class="sp5">해제</span></label><br>
                                    <label><input type="radio" name="ra11" checked> <span class="sp5">설정</span></label><br>
                                    <p class="p5_p">July 10에 요청하신 지원에 대한 내용이 업데이트되었습니다.
                                    </p>
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