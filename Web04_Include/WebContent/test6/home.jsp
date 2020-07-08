<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test6/home.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
</head>
<body>
	<%-- include 될 jsp 페이지는 반드시 상대경로로 찾아가야한다. --%>
	<%-- thisPage 라는 파라미터 명으로 home 이라는 문자열 전달하기 --%>
	<div class="container">
		<jsp:include page="../include/navbar2.jsp">
			<jsp:param value="home" name="thisPage"/>
		</jsp:include>
		<h1>home.jsp 입니다.</h1>
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maiores impedit veniam praesentium adipisci assumenda cum asperiores recusandae voluptatem natus id alias quod magni sed nostrum neque molestias expedita quam blanditiis.</p>
	</div>
</body>
</html>