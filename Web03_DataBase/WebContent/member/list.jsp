<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>/member/list.jsp</title>
		<link rel="stylesheet" href="/Web03_DB/css/bootstrap.css" />
	</head>
	<body>
		<%
			//MemberDao 객체의 참조값 얻어오기 
			MemberDao dao=MemberDao.getInstance();
			//회원 목록 얻어오기
			List<MemberDto> list=dao.getList();
		%>
		<div class="container">
			<div class="navbar navbar-expand-sm navbar-dark bg-primary">
				<a class="navbar-brand" href="${pageContext.request.contextPath }/index.jsp">Acorn</a>
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath }/member/list.jsp">Member</a></li>
		        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/todo/list.jsp">Todo</a></li>
		        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/board/list.jsp">Board</a></li>
			</ul>
			</div>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="../index.jsp">Home</a></li>
				<li class="breadcrumb-item active"><a href="list.jsp">회원목록</a></li>
			</ol>
			<h1>회원 목록입니다.</h1>
			<table class="table table-bordered table-dark table-sm">
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">이름</th>
						<th scope="col">주소</th>
						<th scope="col">수정</th>
						<th scope="col">삭제</th>
					</tr>
				</thead>
				<tbody>
				<%for(MemberDto tmp:list){ %>
					<tr>
						<td scope="row"><%=tmp.getNum() %></td>
						<td scope="row"><%=tmp.getName() %></td>
						<td scope="row"><%=tmp.getAddr() %></td>
						<td scope="row"><a href="updateform.jsp?num=<%=tmp.getNum() %>">수정</a></td>
						<td scope="row"><a href="javascript:deleteConfirm(<%=tmp.getNum() %>)">삭제</a></td>
					</tr>
				<%} %>	
				</tbody>
			</table>
			<a href="${pageContext.request.contextPath }/member/insertform.jsp">회원 추가 하러 가기</a>
		</div>
		<script>
			// 삭제 링크를 눌렀을 때 호출되는 함수
			function deleteConfirm(num){
				var isDelete=confirm(num+" 번 글을 삭제 하시겠습니까?");
				if(isDelete){
					location.href="delete.jsp?num="+num;
				}
			}
		</script>
	</body>
</html>