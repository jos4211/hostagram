<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="commentDTO" class="com.koreait.CommentDTO"/>
<jsp:useBean id="contentDAO" class="com.koreait.ContentDAO"/>

<c:set var="cmtList" value="${contentDAO.getComment()}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

	<c:forEach items="${cmtList}" var="val">
        ${val.coUserid }<br>
        ${val.coText }<br>
        ${val.coRegdate }<br>
     
		<br>
	</c:forEach>
	<c:if test="${empty list }">
        ${"데이터가 존재하지않아요."}
    </c:if>

</body>
</html>
