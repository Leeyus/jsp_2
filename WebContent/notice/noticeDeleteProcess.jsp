<%@page import="com.iu.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	int num = Integer.parseInt(request.getParameter("num"));
    	NoticeDAO no = new NoticeDAO();
    	int result  = no.noticeDeleteProcess(num);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
<% if(result>0){%>
alert("Delete Success");
location.href="./noticeList.jsp";
<%}else{%>
alert("Delete Fail");
history.go(-1);
<%}%>
</script>
</head>
<body>

</body>
</html>