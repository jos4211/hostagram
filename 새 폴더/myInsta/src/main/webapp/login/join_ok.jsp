<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="insta.member.MemberDTO" %>

<jsp:useBean id="mem_dao" class="insta.member.MemberDAO"/>
<jsp:useBean id="member" class="insta.member.MemberDTO"/>

	
<%
	request.setCharacterEncoding("UTF-8");

	String email = "";
	if(request.getParameter("m_userid") != null){
		
		session.setAttribute("j_id", request.getParameter("m_userid"));
		session.setAttribute("j_pw", request.getParameter("m_password"));
		session.setAttribute("j_name", request.getParameter("m_username"));
		session.setAttribute("j_email", request.getParameter("m_email"));
		
		email = request.getParameter("m_email");
		
	}else if(request.getParameter("m_userid") == null){
		
		email = (String)session.getAttribute("j_email");
		
	}else {
		%>
		<script>
		alert("잘 못된 경로입니다.");
		location.href="join.jsp";
		</script>
		<%
	}
	
	
	// 코드번호 생성
	String code = "";
	String codenum = "";
	for(int i=0; i<6; i++) {
		
		int num = (int)(Math.random()*10);
		if(i<5) {
			code += num + " ";
		}else {
			code += num;	
		}
	}
	
	session.setAttribute("code", code);
	System.out.println(code);
%>

<script>
	let xhr = new XMLHttpRequest();
	xhr.open("GET", "../send?email=<%=email%>&code=<%=code%>", true);
	xhr.send();
	
	location.href="code_email.jsp?email=<%=email%>";
</script>
