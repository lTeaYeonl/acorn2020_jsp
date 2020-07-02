<%@page import="java.util.List"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%for(MemberDto tmp:List){ %>
<tr>
	<td><%=tmp.getNum() %></td>
	<td><%=tmp.getName() %></td>
	<td><%=tmp.getAddr() %></td>
</tr>
<%} %>
</body>
</html>