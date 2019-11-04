<%@page import="com.nuri.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.nuri.notice.noticeDTO"%>
<%@page import="com.nuri.notice.noticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String result = (String)request.getAttribute("result");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 	<script type="text/javascript"> -->
<%-- 		location.href="../common/common_result.jsp?message=<%= message%>"; --%>
<!-- 	</script> -->
	
<%-- 	<a href="../common/common_result.jsp>message<%= message %>" class="btn btn-default">RESULT</a> --%>
</body>
</html>