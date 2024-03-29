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
	<div class="container">
	  <h2>Notice Update Page</h2>
	  <form action="./noticeUpdate.notice?num=${requestScope.dto.num}" method="post" id="frm" onsubmit=true>
	  	<input type="hidden" name="num" value="${requestScope.dto.num}">
	  	
	    <div class="form-group">
	      <label for="name">TITLE</label>
	      <input type="text" class="form-control" id="title" value="${requestScope.dto.title}" name="title">
	    </div>
	    
	    <div class="form-group">
	      <label for="name">WRITER</label>
	      <input type="text" class="form-control" id="writer" value="${requestScope.dto.writer}" name="writer" readonly="readonly">
	    </div>
	    
	    <div class="form-group">
      		<label for="comment">Contents:</label>
      		<textarea class="form-control" rows="5" id="contents" name="contents">${requestScope.dto.contents}</textarea>
   		</div>
   		
   		<button type="submit" class="btn btn-default" id="submit">UPDATE</button>
		<a href="./noticeList.jsp" class="btn btn-default">LIST</a>
   		
	  </form>
	 </div>
	 
	 <script type="text/javascript">
	 
	 	$("#submit").click(function() {
			if($("#title").prop("value") == "" || $("#contents").prop("value") == ""){
				alert("수정내용을 입력하세요");
				return false;
			}else{
				$("#frm").submit()
			}
		});
	 
	 </script>
</body>
</html>