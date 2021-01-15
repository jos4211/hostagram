<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="./mainTitle.jsp" %>
</head>
<body>
<div id="wrap">
<form id="h_reform" action="login_ok.jsp">
<div id="container">
    <div class="main_rolling_pc box_inner">
        <div class="log_content">
            <div class="titleimg">
                <div class="phoneimg1">
                    <div class="instaimg">
                        <img class="instaimg1">
                        <img class="instaimg2">
                        <img class="instaimg3">
                    </div>
                </div>
                <div class="phoneimg2"> 
                    <div class="instaimg4"></div>
                </div>
            </div>
            <article class="log_main">
                <div class="log_container">
                    <div class="log_box">
                        <div class="img_instagram"></div>
                        <div class="login">
                            <input class="log_id " type="text" placeholder="닉네임 또는 이메일" name="m_userid">
                            <input class="log_pw " type="password" placeholder="비밀번호" name="m_password" >
                            <input type="submit" class="btn_login " value="로그인" disabled>
                            <div class="solied"></div>
                            <a class="passwordfind" href="./find_pw.jsp">비밀번호 찾기</a>
                        </div>
                    </div>
                </div>
                <div class="log_join">
                    <a href="join.jsp"> 회원가입</a>
                </div>
                <div class="log_app">
                    <p>앱 다운로드 하기</p>
                    <a href="https://apps.apple.com/app/instagram/id389801252?vt=lo" target="_blank" class="appstore"></a>
                    <a href="https://play.google.com/store/apps/details?id=com.instagram.android" target="_blank" class="googleplay"></a>
                </div>
            </article>
        </div>
    </div>
</div>
	<%@ include file="./mainFooter.jsp" %>
</form>
</div>
</body>
</html>