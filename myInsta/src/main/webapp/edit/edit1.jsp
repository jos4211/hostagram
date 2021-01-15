<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<jsp:useBean class="insta.member.MemberDAO" id="mem_dao"/>
<jsp:useBean class="insta.member.MemberDTO" id="member"/>
<jsp:setProperty property="*" name="member"/>


<c:if test="${empty sessionScope.id }">   
<!DOCTYPE html>
<%
request.setCharacterEncoding("utf-8");

String userid=(String)session.getAttribute("id");
String intro=(String)session.getAttribute("intro");


	
	%>		
	<script>
		alert("로그인 후 이용해주세요.");
		location.href = "../login/login.jsp";
	</script>
</c:if>
<html>
<head>
<%@ include file="./mainTitle.jsp" %>
</head>
<body>
<script>
function checknumber() {
let hpCheck = RegExp(/^\d{3}-\d{3,4}-\d{4}$/);


if(h_reform.m_number.value!="") {
if(!hpCheck.test($("#m_number").val())){
    alert("휴대폰 형식에 맞게 입력하세요. ('-'포함)");
    $("#m_number").val("");
    $("#m_number").focus();
    return false;
  }
}
  return true;
}

</script>
<div id="wrap">

	<%@ include file="./mainHead.jsp" %>
    <div id="container">
    <form id="h_reform" action="edit1_ok.jsp" onsubmit="return checknumber()">
        <div class="main_rolling_pc box_inner">
            <!-- 이 아래부터는 각자알아서 알맞게 -->
            <div class="content">
                        <ul class="price1">
						    <li><a href="./edit1.jsp" class="price1_choice">프로필 편집</a></li>
						    <li><a href="./edit2.jsp" class="price1_not_choice">비밀번호 변경</a></li>
						</ul>
                        <div class="price2">
                            <div>
                                <div class="price2_nav">
                                
                            
												
													
                               <div class="nav1 item_left" style="border-radius: 25px;"><a href="#"><img src="../uploads/${sessionScope.profile}" alt="" width="200" ></a></div>
                                    <div class="nav2 item_right"><br><a href="#" class="a_blue"><p class="profilep">${sessionScope.id}</p></a></div>
                                </div>
                                <div class="price2_main">
                                    <div class="price2_item">
                                        <div class="item_left"><label>이름</label></div>
                                        <div class="item_right"><input type="text" id="edit_changename" class="price_txt" name="m_username" value="${sessionScope.name}"><br><span class="sub">사람들이 이름, 별명 또는 비즈니스 이름 등 회원님의 알려진 이름을
                                        <br>사용하여 회원님의 계정을 찾을 수 있도록 도와주세요.</span></div>
                                    </div>
                                    <div class="price2_item">
                                        <div class="item_left"><label>사용자 이름</label></div>
                                       
                                        <div class="item_right"><input type="text" value="${sessionScope.id}" class="price_txt" disabled></div>
                                    </div>
                                   
                                    <div class="price2_item">
                                        <div class="item_left"><label>소개</label></div>
                                        <div class="item_right"><textarea name="m_intro" id="edit_changeintro" maxlength="50" >${sessionScope.intro}</textarea><br><span class="sub sub_re" >개인정보</span><span class="sub sub_re2">비즈니스나 반려동물 등에 사용된 
                                                                          계정인 경우에도 회원님의 개인정보를 입력하세요.</span></div>
                                        </div>                                                                   
                                    <div class="price2_item">
                                        <div class="item_left"></div>
                                        <div class="item_right last"><input id="edit_changebtn" type="submit" class="btn off" value="제출" disabled><button type="button" class="btn_withdrawal" id="btn_withdrawal">회원 탈퇴</button></div>
                                     
                                    <div id="withdrawalOk">
								        <div id="withdrawalOk_menu">
								            <div class="withdrawalOk_box">정말 호스타그램을 탈퇴하시겠습니까?</div>
								            <button type="button" id="ok_btn">확인</button>
								            <button type="button" id="no_btn">취소</button>
								        </div>
								    </div>
                                     <script>
                                    let nameCheck = RegExp(/^[가-힣]+$/);
                                    $("body").keyup(function(){
                                    	if(nameCheck.test($("#edit_changename").val()) && $("#edit_changeintro").val() != ""){
                                    		
                                    		$("#edit_changebtn").removeClass("off");
                                    		$("#edit_changebtn").addClass("on");
                                    		$("#edit_changebtn").attr("disabled", false);
                                    	}else{
                                    		$("#edit_changebtn").removeClass("on");
                                    		$("#edit_changebtn").addClass("off");
                                    	}
                                    
                                    	
                                    });
                                    $("#btn_withdrawal").click(function(){
    							    	$("#withdrawalOk").fadeIn();
                                    });
                                    
                                    $("#no_btn").click(function(){
                                    	$("#withdrawalOk").fadeOut();
                                    });
                                    
                                    $("#ok_btn").click(function(){
                                    	location.href="withdrawal_ok.jsp";
                                    });
                                    
                                    
                                    </script>
                                    </div>
                                </div>
                            </div>
                        </div>                       
                    </div>
            <!-- End -->         
        </div>
        </form>
    </div>
	<%@ include file="./mainFooter.jsp" %>

</div>
</body>
</html>