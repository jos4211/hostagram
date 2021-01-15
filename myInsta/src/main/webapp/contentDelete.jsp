<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="board_dao" class="insta.board.BoardDAO"/>    
<%
	int b_idx = Integer.parseInt(request.getParameter("b_idx"));

	board_dao.deleteBoard(b_idx);
	
%>
<script>
	alert("게시물 삭제를 완료 했습니다.");
	location.href="mainfeed.jsp";
</script>