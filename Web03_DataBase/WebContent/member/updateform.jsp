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
		<h1>회원 정보 수정 폼</h1>
		<form action="update.jsp" method="post">
			<label for="num" style="display:none;">번호</label>
			<input type="hidden" name="num" value="<%= dto.getNum() %>" />
			<label for="num">번호</label>
			<input type="text" name="num" value="<%= dto.getNum() %>" disabled /><br />
			<label for="name">이름</label>
			<input type="text" name="name" value="<%= dto.getName() %>"/><br />
			<label for="addr">주소</label>
			<input type="text" name="addr" value="<%= dto.getAddr() %>"/><br />
			<button type="submit">수정하기</button>
			<button type="reset">초기화하기</button>
		</form>
		<button onclick="location='${pageContext.request.contextPath }/member/list.jsp'">돌아가기</button>
	</div>
</body>
</html>