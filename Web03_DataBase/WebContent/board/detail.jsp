<%@page import="test.board.dto.BoardDto"%>
<%@page import="test.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// GET 방식 파라미터로 전달되는 상세페이지의 번호 읽어오기 ?num=xx
	int num=Integer.parseInt(request.getParameter("num"));
	// BoardDao 객체를 이용해서 해당글의 정보를 얻어온다.
	BoardDto dto=BoardDao.getInstance().getData(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/detail.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
</head>
<body>
	<div class="container">
		<h1>상세 페이지</h1>
		<table class="table table-bordered table-sm">
			<tr>
				<th scope="col">글번호</th>
				<td scope="row"><%=dto.getNum() %></td>
			</tr>
			<tr>
				<th scope="col">작성자</th>
				<td scope="row"><%=dto.getWriter() %></td>
			</tr>
			<tr>
				<th scope="col">제목</th>
				<td scope="row"><%=dto.getTitle() %></td>
			</tr>
			<tr>
				<th scope="col">내용</th>
				<td scope="row"><textarea rows="10" disabled><%=dto.getContent() %></textarea></td>
			</tr>
		</table>
		<div class="text-center">
			<button onclick="update()">수정하기</button>
			<button onclick="deleteConfirm(<%=dto.getNum() %>)">삭제하기</button>
		</div>
	</div>
</body>
<script>
	function deleteConfirm(num){
		var isDelete=confirm(num+" 번 글을 삭제 하시겠습니까?");
		if(isDelete){
			location.href="delete.jsp?num="+num;
		}
	}
	function update(){
		location.href="updateform.jsp?num="+<%=dto.getNum() %>;
	}
</script>
</html>