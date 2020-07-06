<%@page import="test.board.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="test.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
</head>
<body>
	<%
		// BoardDao 객체의 참조값 얻어오기
		BoardDao dao=BoardDao.getInstance();
		// 글 목록 얻어오기
		List<BoardDto> list=dao.getList();
	%>
	<div class="container">
		<div class="navbar navbar-expand-sm navbar-dark bg-primary">
			<a class="navbar-brand" href="${pageContext.request.contextPath }/index.jsp">Acorn</a>
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/member/list.jsp">Member</a></li>
	        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/todo/list.jsp">Todo</a></li>
	        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/board/board.jsp">Board</a></li>
		</ul>
		</div>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="../index.jsp">Home</a></li>
			<li class="breadcrumb-item active"><a href="board.jsp">글 목록</a></li>
		</ol>
		<h1>글 목록입니다.</h1>
		<table class="table table-bordered table-sm">
			<thead>
				<tr>
					<th scope="col">글번호</th>
					<th scope="col">작성자</th>
					<th scope="col">제목</th>
					<th scope="col">등록일</th>
				</tr>
			</thead>
			<tbody>
				<%for(BoardDto tmp:list){ %>
					<tr>
						<td scope="row"><%=tmp.getNum() %></td>
						<td scope="row"><%=tmp.getWriter() %></td>
						<td scope="row"><%=tmp.getTitle() %></td>
						<td scope="row"><%=tmp.getRegdate() %></td>
					</tr>
				<%} %>
			</tbody>
		</table>
		<a href="${pageContext.request.contextPath }/board/insertform.jsp">글 추가하기</a>
	</div>
</body>
</html>