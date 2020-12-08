<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="member" class="insta.member.MemberDTO"/>

<jsp:useBean id="mem_dao" class="insta.member.MemberDAO"/>
<%
	request.setCharacterEncoding("UTF-8");

if(session.getAttribute("find_pw") != null){
	%>
	<script>
		location.href="changePw.jsp";
	</script>
	<% 
}else{
	
	member.setM_userid((String)session.getAttribute("j_id"));
	member.setM_password((String)session.getAttribute("j_pw"));
	member.setM_username((String)session.getAttribute("j_name"));
	member.setM_email((String)session.getAttribute("j_email"));	
	
if(mem_dao.join(member) == 0){
	%>
	<script>
	alert("회원가입 실패하였습니다.");
	location.href="login.jsp";
	</script>
	<%
}else{
%>
	<script>
	alert("회원가입 성공하였습니다.");
	location.href="login.jsp";
	</script>
<% 
}
}
%>