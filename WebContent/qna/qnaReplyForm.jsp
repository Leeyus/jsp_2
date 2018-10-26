
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
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
		<div class="row">
			<form action="./qnaReplyProcess.jsp" method="post">
				<div class="form-group">
					<label for="title">Title:</label> <input type="text"
						class="form-control" id="title" placeholder="Enter Title"
						name="title">
				</div>
				<div class="form-group">
					<label for="writer">Writer:</label> <input type="text"
						class="form-control" id="writer" placeholder="Enter writer"
						name="writer"  >
				</div>
				<div class="form-group">
				<label for="contents">contents:</label>
      			<textarea class="form-control" rows="20" id="contents" name="contents"></textarea>
					
				</div>
				
				
				<button type="submit" class="btn btn-default">Writer</button>
			</form>

		</div>
		</div>

<jsp:include page="../tempu/footer.jsp"></jsp:include>
</body>
</html>