<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<style type="text/css">
	.btn{
		margin-top: 10px;
	}
	
</style>
</head>
<body>
	<div class= "container">
	<h1>ADD</h1>
	<form action="noticeWriteProcess.jsp">
		<label>Title</label>
		<input type="text" class="form-control" name = "title">
		<label for="comment">Contents</label>
		<input type="text" class= "form-control" name="contents">
		<label>Writer</label>
		<input type="text" class="form-control" name="writer">
		<label>Hit</label>
		<input type="number" class="form-control" name="hit">
		<button class="btn btn-warning">ADD</button>
		<a href="./noticeList.jsp" class="btn btn-warning">LIST</a>
	</form>
	</div>


</body>
</html>