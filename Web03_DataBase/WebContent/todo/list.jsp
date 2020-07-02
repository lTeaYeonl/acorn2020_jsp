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
			<p class="mb-0">할일 목록입니다. 어쩌구 저쩌구 레릿고 암더 코리안 힙합 모범 노블레스 오블리제 페뷰레쓰</p>
			<footer class="blockquote-footer">만든이<cite title="Source Title">김지훈</cite></footer>
		</blockquote>
		<form action="todo_insert.jsp">
			<input type="text" name="Content" placeholder="할일을 입력하세요."/>
			<button type="submit" class="btn btn-primary btn-lg btn-block" >추가</button>
		</form>
		<table class="table table-bordered table-dark">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">할일</th>
					<th scope="col">등록일</th>
				</tr>
			</thead>	
			<tbody>
				<%for(TodoListDto tmp:list){ %>
					<tr>
						<td scope="row"><%=tmp.getNum() %></td>
						<td scope="row"><%=tmp.getContent() %></td>
						<td scope="row"><%=tmp.getRegdate() %></td>
					</tr>
				<%} %>
			</tbody>
		</table>
	</div>
</body>
</html>