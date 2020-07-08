<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/member.jsp</title>
</head>
<body>
	<%
	// MemberServlet 에서 "dto" 라는 키값으로 담은 MemberDto type 얻어오기
		MemberDto dto=(MemberDto)request.getAttribute("dto");
		int num=dto.getNum();
		String name=dto.getName();
		String addr=dto.getAddr();
	%>
	<p>회원정보 출력</p>
	<p>번호 : <strong><%=num %></strong></p>
	<p>이름 : <strong><%=name %></strong></p>
	<p>주소 : <strong><%=addr %></strong></p>
</body>
</html>