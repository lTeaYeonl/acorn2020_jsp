<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 로그아웃 처리하기
	session.invalidate(); // 세선 초기화
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/logout.jsp</title>
</head>
<body>
	<script>
		alert("로그아웃 되었습니다");
		location.href="${pageContext.request.contextPath }/index.jsp";
	</script>
</body>
</html>