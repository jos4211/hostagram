<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String iscode = request.getParameter("iscode");
String code = (String)session.getAttribute("code");
code = code.replaceAll("\\p{Z}","");
System.out.println(code);
System.out.println(iscode);

if(code.equals(iscode)){
	System.out.println("코드일치");
	out.println("ok");
}else{
	out.println("no");
}

%>