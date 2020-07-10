<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
</head>
<body>
	<div class="container">
		<h1>인덱스 페이지</h1>
		<form action="test/insert.jsp" method="post">
			<div class="form-group">
				<input class="form-control" type="text" name="msg" placeholder="서버에 할말 입력..."/>
				<button class="btn btn-primary" type="submit">전송</button>
			</div>
		</form>
		<%
			// 로그인 된 아이디 읽어오기
			String id=(String)session.getAttribute("id");
			if(id==null){
		%>
		
		<%}else{ %>
		<img class="img-fluid" src="${pageContext.request.contextPath }/image/1.png"  alt="박일도!!!" />
		<p><strong><%=id %></strong> 님 로그인 중입니다.. 
			<a href="test/logout.jsp">로그아웃</a>
		</p>
		<%} %>
		<ul>
			<li><a href="member/play.jsp">일도형♥ 전용 공간1</a></li>
			<li><a href="member/study.jsp">일도형♥ 전용 공간2</a></li>
			<li><a href="member/buy.jsp?num=1&amount=10">구입하기</a></li>
		</ul>
	</div>
</body>
</html>