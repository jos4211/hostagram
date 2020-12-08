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
<form id="h_reform" action="find_pw_ok.jsp" name="regform" method="post">
            <div id="container">
                <div class="main_rolling_pc box_inner">
                    <!-- 이 아래부터는 각자알아서 알맞게 -->
                    <article class="aut_main">
                        <div class="aut_container">
                            <div class="aut_box">
                                <div class="aut_findpassword"></div>
                                <h3>비밀번호 찾기</h3>
                                <p class="txtalert"></p>
                                <p>사용자 이름 또는 이메일을 입력하면 다시 계정에 로그인할 수 있는 링크를 보내드립니다.</p>
                                <div class="authentication">
                                    <div class="txtinput">
                                        <input name="id" class="aut_txt" id="pw" type="text" placeholder="이메일, 사용자 이름">
                                        <input type="submit" class="aut_btn on" value="확인">
                                    </div>
                                </div>
                                <a class="aut_newcode" id="pwfind_joinbtn" href="./join.jsp" >회원가입</a>
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
