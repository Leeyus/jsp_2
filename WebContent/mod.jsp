<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <%@ include file=./module.jsp %> --%>
	<jsp:include page="./module.jsp"></jsp:include>
		<jsp:param value="iu" name="id"/>
		<h1>Mod Page</h1>

</body>
</html>