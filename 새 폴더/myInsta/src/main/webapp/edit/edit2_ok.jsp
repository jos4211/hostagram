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

String userid=(String)session.getAttribute("id");
request.setCharacterEncoding("UTF-8");
String passwordre=request.getParameter("m_passwordre");
System.out.println(userid);

member.setM_password(passwordre);
member.setM_userid(userid);
int cnt=mem_dao.changePw2(member); 
if(cnt==0){  

}else{ 
out.println("<script>"); 
out.println(" alert('비밀번호가 수정되었습니다');"); 
out.println(" location.href='../edit/edit2.jsp';"); 
out.println("</script>"); }
%>







</body>
</html>