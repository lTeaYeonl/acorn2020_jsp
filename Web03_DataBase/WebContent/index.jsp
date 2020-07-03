<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
</head>
<body>
<div class="container">
	<div class="navbar navbar-expand-sm navbar-dark bg-primary">
	      <a class="navbar-brand" href="${pageContext.request.contextPath }/index.jsp">Acorn</a>
	<ul class="navbar-nav">
		<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/member/list.jsp">Member</a></li>
        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/todo/list.jsp">Todo</a></li>
	</ul>
   </div>
	<div class="p-3 mb-2 bg-success text-white">인덱스 페이지 입니다.</div>
	<!-- <h1>인덱스 페이지 입니다.</h1> -->
	<ul class="list-group">
		<li class="list-group-item"><a href="member/list.jsp" class="list-group-item-action list-group-item-success">회원 목록 보기</a></li>
		<li class="list-group-item"><a href="todo/list.jsp" class="list-group-item-action list-group-item-success">할일 목록 보기</a></li>
	</ul>
</div>
</body>
</html>