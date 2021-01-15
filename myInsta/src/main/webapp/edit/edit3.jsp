<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="./mainTitle.jsp" %>
<script>
   $(function(){
       $('#sp_re').on('click',function(){
           $('#sp').css('border-bottom', '1px solid rgba(38, 38, 38, .3)').css('color', '#8e8e8e');
           $(this).css('border-bottom', '1px solid black').css('color', '#000');
           $('#p_txt').html("Instagram을 사용하여 로그인한 앱과 웹사이트이며 한동안 사용하지 않았을 수 있습니<br>다. 회원님이 이전에 공유한 정보에는 계속 액세스할 수 있지만 개인 정보를 추가로 요청<br>하는 권한은 만료되었습니다.");
           $('#p2_txt').html("Instagram 계정에 대한 액세스 권한을 보유한 앱 중 만료된 앱이 없습니다.");
       });
       $('#sp').on('click',function(){
           $('#sp_re').css('border-bottom', '1px solid rgba(38, 38, 38, .3)').css('color', '#8e8e8e');
           $(this).css('border-bottom', '1px solid black').css('color', '#000');
           $('#p_txt').html("Instagram을 사용하여 로그인하고 최근에 사용한 앱과 웹사이트로, 회원님이 공유하도록<br> 선택한 정보를 요청할 수 있습니다.");
           $('#p2_txt').html("Instagram 계정에 액세스하도록 허용한 앱이 없습니다.");
       });
   });
</script>
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
						    <li><a href="./edit3.jsp" class="price1_choice">앱 및 웹사이트</a></li>
						    <li><a href="./edit4.jsp" class="price1_not_choice">이메일 및 SMS</a></li>
						    <li><a href="./edit5.jsp" class="price1_not_choice">푸시 알림</a></li>
						    <li><a href="./edit6.jsp" class="price1_not_choice">연락처 관리</a></li>
						    <li><a href="./edit7.jsp" class="price1_not_choice">공개 범위 및 보안</a></li>
						    <li><a href="./edit8.jsp" class="price1_not_choice">로그인 활동</a></li>
						    <li><a href="./edit9.jsp" class="price1_not_choice">Instagram에서 보낸 이메일</a></li>
						</ul>
                        <div class="price2 p3">
                            <div>
                                <div class="p3_nav">
                                    <h2 class="p3_h">앱 및 웹사이트</h2>
                                </div>
                                <div class="p3_main">
                                    <nav class="p3_main1">
                                        <a href="#" class="sp" id="sp"><span>활성</span></a><a href="#"><span class="sp sp_re" id="sp_re">만료됨</span></a>
                                    </nav>
                                    <div class="p3_main2">
                                        <p id="p_txt">Instagram을 사용하여 로그인하고 최근에 사용한 앱과 웹사이트로, 회원님이 공유하도록<br> 선택한 정보를 요청할 수 있습니다.</p>
                                    </div>
                                    <div class="p3_main3">
                                        <p id="p2_txt">Instagram 계정에 액세스하도록 허용한 앱이 없습니다.</p>
                                    </div>
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