<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mem_dao" class="insta.member.MemberDAO"/>
<%
	request.setCharacterEncoding("UTF-8");

	String email = (String)session.getAttribute("j_email");
	String password = request.getParameter("pw1");

	int changePw = mem_dao.changePw(email, password);
	
	if(changePw == 1){
		session.invalidate();
		%>
		<script>
		alert("비밀번호 변경을 성공 하였습니다.");
		location.href="login.jsp";
		</script>
		<%
	}else{
		session.invalidate();
		%>
		<script>
		alert("비밀변호 변경을 실패 하였습니다.");
		location.href="login.jsp";
		</script>
		<%
	}

%>