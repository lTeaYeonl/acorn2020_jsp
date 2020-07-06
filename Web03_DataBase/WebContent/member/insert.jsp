<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 폼에서 전송되는 이름과, 주소를 읽어온다.
	request.setCharacterEncoding("utf-8");
	String name=request.getParameter("name");
	String addr=request.getParameter("addr");
	// 2. MemberDao 객체를 이용해서 DB에 저장한다.
	MemberDto dto=new MemberDto();
	dto.setName(name);
	dto.setAddr(addr);
	MemberDao dao=MemberDao.getInstance();
	dao.insert(dto);
	// 3. 응답한다.
	String cPath=request.getContextPath();
	// response.sendRedirect(cPath+"/member/list.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/insert.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
</head>
<body>
	<div class="alert alert-success">
		<strong><%=dto.getName() %></strong> 회원의 정보가 추가 되었습니다.
		<a class="alert-link" href="list.jsp">확인</a>
	</div>
</body>
</html>