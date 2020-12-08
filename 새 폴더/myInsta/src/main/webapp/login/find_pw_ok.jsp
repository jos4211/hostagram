<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mem_dao" class="insta.member.MemberDAO"/>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String email = mem_dao.findPw(id);
	if(email == null){
		%>
		<script>
			alert("입력하신 정보의 회원이 존재하지 않습니다.");
			location.href="find_pw.jsp";
		</script>
		<%
	}else{
		session.setAttribute("j_email", email);
		session.setAttribute("find_pw", "find");
%>
	<script>
		location.href="join_ok.jsp";
	</script>
<%} %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>

</body>
</html>