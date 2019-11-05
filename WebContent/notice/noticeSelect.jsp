<%@page import="com.nuri.notice.noticeDTO"%>
<%@page import="com.nuri.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.nuri.notice.noticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head> 
<body>
	<h1>Notice Select Result Page</h1>
	<div class="container">
		<table class="table">
			<thead>
				<tr class="info"><th>NUM</th><th>TITLE</th><th>WRITER</th><th>DATE</th><th>HIT</th></tr>
			</thead>
			<tbody>
				<tr class="active">
					<td>${requestScope.dto.num}</td>
					<td>${requestScope.dto.title}</td>
					<td>${requestScope.dto.writer}</td>
					<td>${requestScope.dto.reg_date}</td>
					<td>${requestScope.dto.hit}</td>
				</tr>
			</tbody>
		</table>
		<div class="container">
 			<form>
    		<div class="form-group">
      			<label for="comment">Contents:</label>
      			<textarea class="form-control" rows="5" id="comment" >${requestScope.dto.contents}</textarea>
    		</div>
  			</form>
  			
  			<a href="./noticeUpdate.notice?num=${requestScope.dto.num}">Update</a>
  		</div>
	</div>
	
	<ul class="pager">
<%-- 	<% if(memberDTO != null && memberDTO.getId().equals(noticeDTO.getWriter())){ %> --%>
<%--   		<li><a href="./noticeUpdate.jsp?num=<%= noticeDTO.getNum() %>">UPDATE</a></li> --%>
<%--  		<li><a href="./noticeDeleteResult.jsp?num=<%= noticeDTO.getNum() %>">DELETE</a></li> --%>
<%--  	<% } %> --%>
<%--  		<li><a href="./noticeUpdate.jsp?num=<%= noticeDTO.getNum() %>">UPDATE</a></li> --%>
<%--  		<li><a href="./noticeDeleteResult.jsp?num=<%= noticeDTO.getNum() %>">DELETE</a></li> --%>
	</ul>
	
</body>
</html>