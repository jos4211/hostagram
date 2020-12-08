<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="./mainTitle.jsp" %>
</head>
<body>
<div id="wrap">
<form id="h_reform" action="changePw_ok.jsp" name="regform" method="post">
            <div id="container">
                <div class="main_rolling_pc box_inner">
                    <!-- 이 아래부터는 각자알아서 알맞게 -->
                    <article class="aut_main">
                        <div class="aut_container">
                            <div class="aut_box">
                                <div class="changepw_img"></div>
                                <h3>비밀번호 변경</h3>
                                <p class="txtalert"></p>
                                <div class="authentication">
                                    <div class="txtinput">
                                        <input name="pw1" class="aut_txt" id="pw1" type="password" placeholder="변경할 비밀번호">
                                        <input name="pw2" class="aut_txt" id="pw2" type="password" placeholder="비밀번호 재입력">
                                        <input type="submit" class="aut_btn" id="changepw_btn" value="확인" disabled>
                                    </div>
                                </div>
                                </div>
                            </div>
                            <div class="aut_back">
                                <a href="./login.jsp">로그인으로 돌아가기</a>
                            </div>
                    </article>
                </div>
            </div>
	<%@ include file="./mainFooter.jsp" %>
</form>
</div>
</body>