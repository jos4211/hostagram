<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="com.koreait.ContentDAO" id="con_dao"/>
<%

	String co_text = request.getParameter("text");

	int co_useridx = Integer.parseInt(request.getParameter("midx"));
	int co_mcidx = Integer.parseInt(request.getParameter("bidx"));

	con_dao.setComment(co_useridx, co_mcidx, co_text);
	
%>
<script>
	location.href="contentPage.jsp?b_idx="+<%=co_mcidx%>;
</script>