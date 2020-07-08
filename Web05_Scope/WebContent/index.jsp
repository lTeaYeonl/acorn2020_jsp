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
		<h1>인덱스 페이지 입니다.</h1>
		<ul class="list-group">
			<li class="list-group-item"><a href="fortune">오늘의 운세</a></li>
			<li class="list-group-item"><a href="member">멤버 한명의 정보 가져오기</a></li>
			<li class="list-group-item"><a href="test/play.jsp">놀러가기</a></li>
		</ul>
		<form action="test/save.jsp" method="post">
			<div class="form-group">
				<input class="form-control" type="text" name="nick" placeholder="닉네임 입력..." />
				<button class="btn btn-primary" type="submit">닉네임 기억하기</button>
			</div>
		</form>
		<a href="test/delete.jsp">닉네임 삭제하기</a>
	</div>
</body>
</html>