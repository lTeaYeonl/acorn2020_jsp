<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// form 값 받아오기
request.setCharacterEncoding("utf-8");

int num=Integer.parseInt(request.getParameter("num"));
String name=request.getParameter("name");
String addr=request.getParameter("addr");
// 받아온 값 db에 저장
MemberDto dto=new MemberDto(num, name, addr);
boolean isSuccess=MemberDao.getInstance().update(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/update.jsp</title>
</head>
<body>
	<%if(isSuccess){ %>
		<script>
			alert("<%=dto.getNum() %>번 회원의 정보를 수정했습니다");
			location.href="list.jsp";
		</script>
	<%}else{ %>
		<script>
			alert("수정실패!");
			location.href="updateform.jsp?num=<%=dto.getNum() %>";
		</script>
	<%} %>
</body>
</html>