<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="insta.member.MemberDTO" %>

<jsp:useBean id="mem_dao" class="insta.member.MemberDAO"/>
<jsp:useBean id="member" class="insta.member.MemberDTO"/>

<%
String m_userid = request.getParameter("userid");

if(mem_dao.idCheck(m_userid) == 1){
	out.println("ok");
}else{
	out.println("no");
}

%>