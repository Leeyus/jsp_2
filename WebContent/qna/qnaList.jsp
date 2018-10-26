<%@page import="com.iu.qna.QnaDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.iu.qna.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	QnaDAO qnaDAO = new QnaDAO();
    int curPage=1;
	String kind = request.getParameter("kind");
	String search=request.getParameter("search");
	System.out.println("kind :"+kind);
	System.out.println("search :"+search);
	
	if(kind==null){
		kind="Title";
	}
	if(search==null){
		search="";
	}
	try{
		curPage=Integer.parseInt(request.getParameter("curPage"));
	}catch(Exception e){
		
	}
	int perPage=10;
	int startRow=(curPage-1)*perPage+1;
	int lastRow=curPage*perPage;
	List<QnaDTO> ar= qnaDAO.selectList(startRow, lastRow, kind, search);
	
	//페이징
	//1. 전체글 글의 갯수
	int totalCount = qnaDAO.getCount(kind, search);
	//2. 전체 페이지의 갯수
	int totalPage = totalCount/perPage;
	if(totalCount%perPage != 0){
		totalPage = totalCount/perPage+1;
	}
	//3. 전체 블럭의 갯수
	int perBlock=5;//블럭당 숫자의 갯수
	int totalBlock = totalPage/perBlock;
		if(totalPage%perBlock !=0 ){
			//totalBlock = totalPage/perBlock+1;
			totalBlock = totalBlock+1;
		}
	//4.curPage 의 번호로 curBlock구하기
	int curBlock = curPage/perBlock;
	if(curPage%perBlock !=0){
		curBlock = curPage/perBlock+1;
	}
	//5. curBlock 번호로 startNum, lastNum 구하기
	int startNum=(curBlock-1)*perBlock+1;
	int lastNum=curBlock*perBlock;
	
	if(curBlock == totalBlock){
		lastNum =totalPage;
	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../tempu/butt.jsp" %>
</head>
<body>
<%@ include file ="../tempu/head.jsp" %>
	<div class= "container-fluid">
		<div class= "row">
			<form class="form-inline" action="./qnaList.jsp">
					<div class="form-group">
					<select class="form-control" id="sel1" name="kind">
				        <option>Title</option>
				        <option>Contents</option>
				        <option>Writer</option>
			      	</select>
					
						<input type="text"class="form-control" id="search" placeholder="Enter search" name="search">
					</div>
					
					<button type="submit" class="btn btn-default">Submit</button>
				</form>

			</div>
		
			<table class="table table-striped">
			<tr><td>Num</td><td>Title</td><td>Writer</td><td>Date</td><td>Hit</td></tr>
			<%for(QnaDTO qnaDTO : ar){ %>
			<tr>
			<td><%=qnaDTO.getNum()%></td>
			<td><a href="./qnaSelectOne.jsp?num=<%= qnaDTO.getNum()%>">
				<%for(int i=0;i<qnaDTO.getDepth();i++) {%>
				--
				<%} %>
				<%=qnaDTO.getTitle() %></a></td>
			<td><%=qnaDTO.getWriter() %></td>
			<td><%=qnaDTO.getReg_date() %></td>
			<td><%=qnaDTO.getHit() %></td>
			</tr>
			<%} %>
			</table>
			
		</div>
		<div class="container-fluid">
		<div class="row">
			 
			<ul class="pagination">
			<li><a href="./noticeList.jsp?curPage=<%= 1%>&kind=<%=kind%>&search=<%=search%>"><span class="glyphicon glyphicon-backward"></span></a></li>
			<% if(curBlock>1){ %>
    			<li><a href="./noticeList.jsp?curPage=<%= startNum-1%>"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
    		<%} %>	
				<%for(int i=startNum;i<=lastNum;i++){ %>
					<li><a href="./noticeList.jsp?curPage=<%=i%>&kind=<%=kind%>&search=<%=search%>"><%=i%></a></li>
				<%} %>
			<%if(curBlock!=totalBlock){ %>	
				<li><a href="./noticeList.jsp?curPage=<%=lastNum+1%>"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
			<%} %>	
			<li><a href="./noticeList.jsp?curPage=<%=totalPage%>&kind=<%=kind%>&search=<%=search%>"><span class="glyphicon glyphicon-forward"></span></a></li>
			</ul>
    		
    			
		</div >
		</div>
		
			
			
		<div class="container-fluid">
			<div class="row">
			<div class="col-md-1">
			<a href="qnaWriteForm.jsp" class="btn btn-warning">작성</a>
			</div>
			</div>
		</div>
		
		
	


<%@ include file="../tempu/footer.jsp" %>
</body>
</html>