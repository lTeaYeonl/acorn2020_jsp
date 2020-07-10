<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/loginform.jsp</title>
</head>
<body>
	<h1>로그인 폼 입니다.</h1>
	<form action="login.jsp" method="post">
		<div class="form-group">
			<input class="form-control" type="text" name="id" placeholder="아이디를 입력하세요..."/>
			<input class="form-control" type="text" name="pwd" placeholder="비밀번호를 입력하세요..."/>
			<button class="btn btn-primary" type="submit">가입</button>
		</div>
	</form>
</body>
</html>