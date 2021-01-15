<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty sessionScope.id }"> 
</c:if>
 
<%
	request.setCharacterEncoding("utf-8");
%>
 
<!DOCTYPE html>
<html>
<head>
<%@ include file="./mainTitle.jsp" %>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<script>
let pwcheckbutton = false;
var pw = $("#m_passwordre").val();
let join_pwcheck = false;

function memberModify(){

	
	let pwCheck = RegExp(/^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^+=]).*$/);
	if($("#m_passwordre").val() == "") {
		alert("새 비밀번호를 입력하세요.");							
		return false;
	}
	
	if(!pwCheck.test($("#m_passwordre").val())){
        alert("비밀번호를 형식에 맞게 입력하세요.");
        $("#m_passwordre").val("");
        $("#m_passwordre").focus();
        return false;
    }
	
				
	if($("#m_passwordre2").val() == "") {
		alert("새 비밀번호 확인을 다시 입력하세요.");							
		return false;		
	}				
	if($("#m_passwordre").val() != $("#m_passwordre2").val()) {
		alert("비밀번호가 일치하지 않습니다.");				
		return false;		
	}
	return true;
}

</script>

<div id="wrap">



	<%@ include file="./mainHead.jsp" %>
    <div id="container">
    <form id="h_reform" name="h_reform" action="edit2_ok.jsp" onsubmit="return memberModify()">
        <div class="main_rolling_pc box_inner">
            <!-- 이 아래부터는 각자알아서 알맞게 -->
            <div class="content">
                        <ul class="price1">
						    <li><a href="./edit1.jsp" class="price1_not_choice">프로필 편집</a></li>
						    <li><a href="./edit2.jsp" class="price1_choice">비밀번호 변경</a></li>
						</ul>
						
                        <div class="price2">
                       
                            <div>
                                <div class="price2_nav">
                                    <div class="nav1 item_left"><a href="#"></a></div>
                                    <div class="nav2 item_right nav2_ft"><span><img src="../images/735145cfe0a4.png" alt=""></span></div>
                                </div>
                                <div class="price2_main">
                                    
                                   
                                    <div class="price2_item">
                                        <div class="item_left"><label>새 비밀번호</label></div>
                                        <div class="item_right"><input type="password" name="m_passwordre" id="m_passwordre" class="price_txt"></div>
                                    </div>
                                    <div class="price2_item">
                                        <div class="item_left"><label>새 비밀번호 확인</label></div>
                                        <div class="item_right"><input type="password" name="m_passwordre2" id="m_passwordre2" class="price_txt"></div>
                                    </div>
                                    <div class="price2_item">
                                        <div class="item_left"></div>
                                        
                                    </div>
                                    <div class="price2_item">
                                        <div class="item_left"></div>
                                        <div class="item_right last"><button class="changepw_btn">비밀번호 변경</button></div>
                                      
                                    </div>
                                </div>
                            </div>
                        </div>
            <!-- End -->   
		    </div>
        </div>
        </form>
    </div>
	<%@ include file="./mainFooter.jsp" %>

</div>
</body>
</html>