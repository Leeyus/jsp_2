<%@page import="com.iu.member.MemberDTO"%>
<%@page import="com.iu.notice.NoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% MemberDTO memberDTO = (MemberDTO)session.getAttribute("member"); %>
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>Bootstrap Theme Company Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="../tempu/butt.jsp"></jsp:include>
  
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

<jsp:include page="../tempu/head.jsp"></jsp:include>

<div class="container-fluid">
			<form action="./noticeWriteProcess.jsp" method="post">
				<div class="form-group">
					<label for="title">Title:</label> <input type="text"
						class="form-control" id="title" placeholder="Enter Title"
						name="title">
				</div>
				<div class="form-group">
					<label for="writer">Writer:</label> <input type="text"
						class="form-control" id="writer" value="<%=memberDTO.getId()%>" placeholder="Enter writer"
						name="writer"  readonly="readonly">
				</div>
				<div class="form-group">
				<label for="contents">contents:</label>
      			<textarea class="form-control" rows="20" id="contents" name="contents"></textarea>
					
				</div>
				
				
				<button type="submit" class="btn btn-default">Writer</button>
			</form>
		</div>
		
	<jsp:include page="../tempu/footer.jsp"></jsp:include>	


</body>
</html>
