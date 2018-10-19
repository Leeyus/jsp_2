<%@page import="com.iu.notice.NoticeDTO"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    NoticeDAO no = new NoticeDAO();
    NoticeDTO noticeDTO = new NoticeDTO();
    String n = "Fill";
    noticeDTO.setTitle(request.getParameter("title"));
    noticeDTO.setContents(request.getParameter("contents"));
    noticeDTO.setWriter(request.getParameter("writer"));
    noticeDTO.setHit(Integer.parseInt(request.getParameter("hit")));
    int result = no.noticeWriteForm(noticeDTO);
    
    if(result>0){
    	n= "success";
    }
    
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var c = '<%=n%>';
	alert(c);
	location.href="noticeList.jsp";
</script>
</head>
<body>

</body>
</html>