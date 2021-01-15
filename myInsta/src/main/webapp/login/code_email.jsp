<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String email = request.getParameter("email");
	
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="./mainTitle.jsp" %>
</head>
<body>
<div id="wrap">
<form id="h_reform" name="regform" onsubmit="return checkForm()">
   <div id="container">
        <div class="main_rolling_pc box_inner">
            <!-- 이 아래부터는 각자알아서 알맞게 -->
            <article class="aut_main">
                <div class="aut_container">
                    <div class="aut_box">
                        <div class="aut_imgemail"></div>
                        <h3>마지막 단계</h3>
                        <p class="txtalert"></p>
                        <p><%=email %>으로 전송된 6자리 코드를 입력하세요</p>
                        <div class="authentication">
                            <div class="txtinput">
                                <input name="email_code" id="email_aut" class="aut_txt" type="text" placeholder="######" maxlength="6">
                        		<div class="codeCheck_Text"></div>
                                <input type="button" class="aut_btn on" id="emailaut_btn" value="확인"/>
                            </div>
                        </div>
                        <a class="aut_newcode" href="./join_ok.jsp">새 코드 요청하기</a>
                        </div>
                    </div>
                    <div class="aut_back">
                        <a href="./join.jsp">돌아가기</a>
                    </div>
            </article>
        </div>
    </div>
	<%@ include file="./mainFooter.jsp" %>
</form>
</div>
</body>
