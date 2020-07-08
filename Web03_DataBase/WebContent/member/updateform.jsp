<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 선택한 데이터 하나만 가져오기
// 데이터 뿌려주기
// hidden 값으로 하나, disable 값으로 하나 num 선언
// 수정하기 버튼 누르면 update.jsp로 이동하도록
// 초기화 = reset
// 수정 취소하기 = list.jsp로 이동
int num=Integer.parseInt(request.getParameter("num"));

MemberDao dao=MemberDao.getInstance();
MemberDto dto=dao.getData(num);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/updateform.jsp</title>
<link rel="stylesheet" href="/Web03_DB/css/bootstrap.css" />
</head>
<body>
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
		<li class="breadcrumb-item active">수정양식</li>
	</ol>
		<h1>회원 정보 수정 폼</h1>
		<form action="update.jsp" method="post">
			<label for="num" style="display:none;">번호</label>
			<!-- disabled 속성이 추가된 input 요소는 수정이 불가능하고 form 을 제출 했을 때 전송도 되어지지 않는다. -->
			<input type="hidden" name="num" value="<%= dto.getNum() %>" />
			<div class="form-group">
				<label for="num">번호</label>
				<input class="form-control" type="text" name="num" value="<%= dto.getNum() %>" disabled />
			</div>
			<div class="form-group">
				<label for="name">이름</label>
				<input class="form-control" type="text" name="name" value="<%= dto.getName() %>"/>
			</div>
			<div class="form-group">
				<label for="addr">주소</label>
				<input class="form-control" type="text" name="addr" value="<%= dto.getAddr() %>"/>
			</div>
			<button class="btn btn-outline-primary btn-sm" type="submit">수정하기</button>
			<button class="btn btn-outline-warning btn-sm" type="reset">초기화하기</button>
		</form>
		<div>
			<button class="btn btn-outline-danger btn-sm" onclick="location='${pageContext.request.contextPath }/member/list.jsp'">돌아가기</button>
		</div>
	</div>
</body>
</html>