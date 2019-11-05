<%@page import="com.nuri.notice.noticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
<c:import url="../layout/nav.jsp"></c:import>

	<div class="container">
  		<div class="jumbotron">
    		<h1>Notice List Page</h1>
		</div>
	</div>
	<div class="container">
	  <table class="table table-striped">
	    <thead>
	      <tr>
	        <th>NUM</th><th>TITLE</th><th>WRITER</th><th>DATE</th><th>HIT</th>
	      </tr>
	    </thead>
	    <tbody>
	    	<c:forEach items="${requestScope.list}" var="dto" varStatus="st">
		      <tr>
		        <td>${pageScope.dto.num}</td>
		        <td><a href="./noticeSelect.notice?num=${pageScope.dto.num}">${pageScope.dto.title}</a></td>
		        <td>${pageScope.dto.writer}</td>
		        <td>${pageScope.dto.reg_date}</td>
		        <td>${pageScope.dto.hit} : st ${st.last}</td>
		      </tr>
	    	</c:forEach>
	    </tbody>
	  </table>
	  <div>
	  	<c:forEach begin="1" end="10" step="1" var="i" varStatus="st">
	  		${pageScope.i}
	  	</c:forEach>
	  </div>
	  <!--  session에 member, memberDTO 포함되어 있다는 것 -->
	  <c:if test="${not empty sessionScope.member}">
		  <a href="./noticeWrite.notice">Write</a>
	  </c:if>
	  
	  <c:choose>
	  	<c:when test=""></c:when>
	  	<c:otherwise></c:otherwise>
	  </c:choose>
<%-- 	  <%if(memberDTO != null && memberDTO.getGrade() == 3){ %> --%>
<!-- 	  	<a href="./noticeWrite.jsp" class= "btn btn-default">Write</a> -->
<%-- 	  <%} %> --%>
	</div>
</body>
</html>