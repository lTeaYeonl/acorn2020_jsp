<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<<<<<< HEAD
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
=======
<title>/test6/home.jsp</title>
<%-- include 된 페이지에 필요한 css 도 여기서 로딩을 해야 된다. --%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
</head>
<body>
	<jsp:include page="../include/navbar3.jsp">
		<jsp:param value="home" name="thisPage"/>
	</jsp:include>
	<div class="container">
		<h1>home.jsp 입니다.</h1>
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque ullam cupiditate enim unde nihil fuga dignissimos placeat nostrum praesentium rem nisi distinctio animi error veritatis ipsam natus molestias ab labore!</p>
	</div>
</body>
</html>





>>>>>>> refs/remotes/upstream/master
