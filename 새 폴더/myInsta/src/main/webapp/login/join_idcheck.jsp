<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mem_dao" class="insta.member.MemberDAO"/>
<%
	String userid = request.getParameter("userid");
	String email = request.getParameter("email");
	
		if(mem_dao.idCheck(userid,email) == 0){
			out.println("no");
		}else{
			out.println("ok");
		}
%>