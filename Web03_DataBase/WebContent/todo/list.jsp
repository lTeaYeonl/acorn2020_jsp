<%@page import="test.todo.dto.TodoListDto"%>
<%@page import="java.util.List"%>
<%@page import="test.todo.dao.TodoListDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/list.jsp</title>
<link rel="stylesheet" href="/Web03_DB/css/bootstrap.css" />
</head>
<body>
	<%
		// DB에서 읽어온 할일 목록
		// TodoListDao 객체로 참조값 얻어오기
		TodoListDao dao=TodoListDao.getInstance();
		// 할일 목록 얻어오기
		List<TodoListDto> list=dao.getList();
	%>
	<div class="container">
		<div class="navbar navbar-expand-sm navbar-dark bg-primary">
	      <a class="navbar-brand" href="${pageContext.request.contextPath }/index.jsp">Acorn</a>
	      <ul class="navbar-nav">
	         <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/member/list.jsp">Member</a></li>
	         <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath }/todo/list.jsp">Todo</a></li>
        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/board/list.jsp">Board</a></li>
	      </ul>
	   	</div>
		<blockquote class="blockquote text-center">
		<br>
			<p class="text-white bg-success font-weight-bold mb-0">할일 목록</p>
			<footer class="blockquote-footer">만든이<cite title="Source Title">김지훈</cite></footer>
		</blockquote>
			<form action="todo_insert.jsp" method="post">
				<div class="form-row mb-2">
					<div class="col">
						<input type="text" class="form-control" name="Content" placeholder="할일을 입력하세요."/>
					</div>
					<div class="col">
						<button type="submit" class="btn btn-success btn-lg btn-block" >추가</button>
					</div>
				</div>
			</form>
		<table class="table table-bordered table-dark table-sm">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">할일</th>
					<th scope="col">등록일</th>
					<th scope="col">삭제</th>
				</tr>
			</thead>	
			<tbody>
				<%for(TodoListDto tmp:list){ %>
					<tr>
						<td scope="row"><%=tmp.getNum() %></td>
						<td scope="row"><%=tmp.getContent() %></td>
						<td scope="row"><%=tmp.getRegdate() %></td>
						<td scope="row"><a href="delete.jsp?num=<%=tmp.getNum() %>">삭제</a></td>
					</tr>
				<%} %>
			</tbody>
		</table>
	</div>
</body>
</html>