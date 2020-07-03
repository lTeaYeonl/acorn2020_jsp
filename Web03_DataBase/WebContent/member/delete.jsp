<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 삭제하기
	int num=Integer.parseInt(request.getParameter("num"));
	// db 에서 실제로 삭제
	MemberDao.getInstance().delete(num);
	// 응답하기
	// context path 읽어오기
	String cPath=request.getContextPath();
	// 회원목록페이지로 강제 리다이렉팅
	response.sendRedirect(cPath+"/member/list.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/delete.jsp</title>
</head>
<body>

</body>
</html>