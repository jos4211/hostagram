<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="com.koreait.ContentDAO" id="con_dao"/>
<%

	int coidx = Integer.parseInt(request.getParameter("coidx"));
	int b_idx = Integer.parseInt(request.getParameter("b_idx"));

	con_dao.deleteComment(coidx);
	
%>
<script>
	location.href="contentPage.jsp?b_idx="+<%=b_idx%>;
</script>