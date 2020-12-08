<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean class="insta.member.MemberDAO" id="mem_dao"/>
<jsp:useBean class="insta.member.MemberDTO" id="member"/>
<jsp:setProperty property="*" name="member"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<%
	if(mem_dao.login(member) != null){
		session.setAttribute("id", member.getM_userid());
		session.setAttribute("idx", member.getM_idx());
		session.setAttribute("name", member.getM_username());
		session.setAttribute("intro", member.getM_intro());
		session.setAttribute("profile", member.getM_filepath());
		System.out.println(member.getM_username()+member.getM_userid());
%>
	<script>
		alert("로그인 되었습니다.");
		location.href="../follow.jsp";
	</script>
<%
	}else{
%>
	<script>
		alert("아이디 또는 비밀번호를 확인하세요.");
		history.back();
	</script>
<%
	}
%>
</body>
</html>