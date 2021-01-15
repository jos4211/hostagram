<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="contentDAO" class="com.koreait.ContentDAO" />
<%
if(session.getAttribute("idx") == null){
	%>
	<script>
		alert("잘못된 접속입니다.");
		location.href="../login/login.jsp";
	</script>
	<%
}else{
	int idx = Integer.parseInt(String.valueOf(session.getAttribute("idx")));
	System.out.println(idx);
	contentDAO.withdrawal(idx);
%>
	<script>
		alert("회원탈퇴가 완료 되었습니다.");
		location.href="../login/login.jsp";
	</script>
<%
}
%>
