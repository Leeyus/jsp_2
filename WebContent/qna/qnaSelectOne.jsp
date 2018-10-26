<%@page import="com.iu.qna.QnaDTO"%>
<%@page import="com.iu.qna.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%	QnaDAO qnaDAO = new QnaDAO();
    	int num = Integer.parseInt(request.getParameter("num"));
    	QnaDTO qnaDTO = qnaDAO.selectOne(num);
    	
    	
    	
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../tempu/butt.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../tempu/head.jsp"></jsp:include>
<div class="container-fluid">
	<table class="table table-striped">
		<tr><td>Title</td><td>Contents</td><td>Writer</td><td>Reg_date</td><td>Hit</td></tr>
		<tr>
			<td><%= qnaDTO.getTitle() %></td>
			<td><%= qnaDTO.getContents() %></td>
			<td><%= qnaDTO.getWriter() %></td>
			<td><%= qnaDTO.getReg_date() %></td>
			<td><%= qnaDTO.getHit() %></td>
		</tr>	
	</table>
	<a href="qnaList.jsp" class="btn btn-warning">LIST</a>
	<a href="qnaUpdateForm.jsp?num=<%= qnaDTO.getNum() %>" class="btn btn-warning">Update</a>
	<a href="qnaDeleteProcess.jsp?num=<%= qnaDTO.getNum() %>" class="btn btn-warning">Delete</a>
	<a href="qnaReplyForm.jsp?num=<%= qnaDTO.getNum() %>" class= "btn btn-warning">Reply</a>
	
	</div>


<jsp:include page="../tempu/footer.jsp"></jsp:include>

</body>
</html>