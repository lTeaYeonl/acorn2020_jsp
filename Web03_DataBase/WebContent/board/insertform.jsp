<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/insertform.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
</head>
<body>
	<div class="container">
		<div class="navbar navbar-expand-sm navbar-dark bg-primary">
			<a class="navbar-brand" href="${pageContext.request.contextPath }/index.jsp">Acorn</a>
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/member/list.jsp">Member</a></li>
	       		<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/todo/list.jsp">Todo</a></li>
        		<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/board/list.jsp">Board</a></li>
			</ul>
		</div>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="../index.jsp">Home</a></li>
			<li class="breadcrumb-item"><a href="list.jsp">글목록</a></li>
			<li class="breadcrumb-item active">추가양식</li>
		</ol>
		<h1>글 작성 폼 입니다.</h1>
		<form action="insert.jsp" method="post">
			<div class="form-group">
				<label for="writer">작성자 명</label>
				<input class="form-control" type="text" name="writer" id="writer" />
			</div>
			<div class="form-group">
				<label for="title">제목</label>
				<input class="form-control" type="text" name="title" id="title" placeholder="50자 미만으로 입력해주세요" />
			</div>
			<div class="form-group">
				<label for="content">내용</label>
				<textarea class="form-control" name="content" id="content" rows="10" placeholder="100글자 미만으로 입력해주세요"></textarea>
			</div>
			<div class="text-center">
				<button class="btn btn-outline-primary btn-sm" type="submit">작성완료</button>
				<button class="btn btn-outline-danger btn-sm" type="reset">작성취소</button>
			</div>
		</form>
	</div>
</body>
</html>