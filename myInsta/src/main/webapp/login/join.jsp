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
<form id="h_reform" name="regform" method="post" action="join_ok.jsp" onsubmit="return checkForm()">
<div id="container">
       <div class="main_rolling_pc box_inner">
           <!-- 이 아래부터는 각자알아서 알맞게 -->
           <article class="join_main">
               <div class="join_container">
                   <div class="join_box">
                       <div class="img_instagram"></div>
                       <p>인스타에 오신걸 환영합니다.</p>
                       <div class="join">
                           <div class="solied"></div>
                           <div class="joim_txtinput">
                               <div class="join_txt">
                                       <input class="join_phemail join_input" type="text" 
                                       id="join_email"
                                       placeholder="이메일 주소" name="m_email">
                                       <div class="checkimg_email checkimg"></div>
                               </div>
                               <div class="join_txt">                 
                                   <input class="join_name join_input" 
                                   id="join_name"type="text" placeholder="이름" name="m_username">
                                   <div class="checkimg_name checkimg"></div>
                               </div> 
                               <div class="join_txt">
                                    <input class="join_id join_input" id="join_id" type="text" placeholder="닉네임" name="m_userid">
                                    <div class="checkimg_id checkimg"></div>
                               </div>
                               <div class="join_txt">
                               <input class="join_pw join_input" id="join_pw"type="password" placeholder="비밀번호" name="m_password">
                               <div class="checkimg_pw checkimg"></div>
                               </div>
                               <div class="idcheck_text" id="idcheck_text">
                               	
                               </div>
                               <input type="submit" class="btn_join" value="회원가입" disabled >
                               <p>가입하면 Instagram의 <a href="https://help.instagram.com/581066165581870" target="_blank">약관</a>, <a href="https://help.instagram.com/519522125107875" target="_blank">데이터 정책</a> 및 <a href="https://help.instagram.com/1896641480634370" target="_blank">쿠키 정책</a>에 동의하게 됩니다.</p>
                           </div>
                       </div>
                       </div>
                   </div>
                   <div class="join_back">
                       <a href="./login.jsp">돌아가기</a>
                   </div>
           </article>
       </div>
   </div>
	<%@ include file="./mainFooter.jsp" %>
</form>
</div>
</body>
</html>