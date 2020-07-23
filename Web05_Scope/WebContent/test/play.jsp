<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/play.jsp</title>
</head>
<body>
<<<<<<< HEAD
	<%
		// session 영역에 "nick" 이라는 키값으로 저장된 String type 읽어오기
		String nick=(String)session.getAttribute("nick"); // 없으면 null
	%>
	<p><strong><%=nick %></strong> 님 반갑습니다~</p>
	<p>jax go?</p>
	<a href="../index.jsp">인덱스로 가기</a>
</body>
</html>
=======
<%
	//session 영역에 "nick" 이라는 키값으로 저장된 String type 읽어오기
	String nick=(String)session.getAttribute("nick"); //없으면 null 
%>
<p> <strong><%=nick %></strong> 님 놀러 오셨네여?</p>
<p> 신나게 놀아 보아요 </p>
<a href="../index.jsp">인덱스로 가기</a>
</body>
</html>






>>>>>>> refs/remotes/upstream/master
