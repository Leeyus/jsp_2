<%@page import="com.iu.notice.NoticeDTO"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%	NoticeDAO no = new NoticeDAO();
    	int num = Integer.parseInt(request.getParameter("num"));
    	NoticeDTO noticeDTO=no.noticeSelectOne(num);
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
<div class="container-fluid">
	<table class="table table-striped">
		<tr><td>Title</td><td>Contents</td><td>Writer</td><td>Reg_date</td><td>Hit</td></tr>
		<tr>
			<td><%= noticeDTO.getTitle() %></td>
			<td><%= noticeDTO.getContents() %></td>
			<td><%= noticeDTO.getWriter() %></td>
			<td><%= noticeDTO.getReg_date() %></td>
			<td><%= noticeDTO.getHit() %></td>
		</tr>	
	</table>
	<a href="noticeList.jsp" class="btn btn-warning">LIST</a>
	<a href="noticeDeleteProcess.jsp?num=<%= num %>" class="btn btn-warning">Delete</a>
	</div>

</body>
</html>