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
		<blockquote class="blockquote text-center">
			<p class="text-info bg-dark font-weight-bold mb-0">할일 목록</p>
			<footer class="blockquote-footer">만든이<cite title="Source Title">김지훈</cite></footer>
		</blockquote>
		<div class="input-group">
			<div class="input-group-prepend">
				<span class="input-group-text">sex</span>
			</div>
			<form action="todo_insert.jsp">
				<input type="text" class="form-control" name="Content" placeholder="할일을 입력하세요."/>
				<button type="submit" class="btn btn-primary btn-lg btn-block" >추가</button>
			</form>
		</div>
		<table class="table table-bordered table-dark">
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