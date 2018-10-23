<%@page import="com.iu.member.MemberDTO"%>
<%@page import="com.iu.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    MemberDAO memberDAO = new MemberDAO();
    MemberDTO memberDTO = new MemberDTO();
    String s ="JoinFaill";
    memberDTO.setId(request.getParameter("id"));
    memberDTO.setPw(request.getParameter("pw"));
    memberDTO.setName(request.getParameter("name"));
    memberDTO.setEmail(request.getParameter("email"));
    memberDTO.setKind(request.getParameter("kind"));
    memberDTO.setClassMate(request.getParameter("classmate"));
	
    int result = memberDAO.insert(memberDTO);
    
    if(result>0){
    	s="JoinSuccess";
    }
    
    request.setAttribute("message", s);
    request.setAttribute("path", "../index.jsp");
    
    //Foward
    //이동해야할페이지의 주소
   	RequestDispatcher view = request.getRequestDispatcher("../common/result.jsp");
    view.forward(request, response);
    
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