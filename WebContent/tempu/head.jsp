<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="<%= request.getContextPath() %>/notice2/noticeList.jsp">NOTICE</a></li>
        <li><a href="<%=request.getContextPath() %>/member2/memberList.jsp">MEMBER</a></li>
        <li><a href="<%= request.getContextPath()%>/qna/qnaList.jsp">QnA</a></li>
        <li><a href="#pricing">PRICING</a></li>
        <li><a href="#contact">CONTACT</a></li>
      </ul>
    </div>
  </div>
</nav>
<!-- 절대주소로해야함  request.getContextPath-->