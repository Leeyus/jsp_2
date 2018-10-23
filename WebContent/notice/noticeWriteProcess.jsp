<%@page import="com.iu.notice.NoticeDTO"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    NoticeDAO no = new NoticeDAO();
    NoticeDTO noticeDTO = new NoticeDTO();
    String n = "Fill";
    noticeDTO.setTitle(request.getParameter("title"));
    noticeDTO.setWriter(request.getParameter("writer"));
    noticeDTO.setContents(request.getParameter("contents"));
    
    int result = no.noticeWriteForm(noticeDTO);
    
    if(result>0){
    	n= "success";
    }
    request.setAttribute("message", n);
    request.setAttribute("path", "./noticeList.jsp?surPage=1");
    
   /*  RequestDispatcher view = request.getRequestDispatcher("../common/result.jsp");
    view.forward(request, response); */
    //redirect
    response.sendRedirect("../index.jsp");//이동 해야할 주소
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

</body>
</html>