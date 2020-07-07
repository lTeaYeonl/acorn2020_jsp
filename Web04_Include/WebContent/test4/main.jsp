<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	include 디렉티브를 이용해서 jsp 페이지를 include 하면
	해당 페이지에 include 된 jsp 페이지가 통합되어서 jsp 페이지가 만들어진다.
	결국 실행시점에 사용되는 페이지는 1개만 사용된다.
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test1/main.jsp</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<%
		// header.jsp 페이지와 별개의 main.jsp 페이지 이기 때문에
		// 서로 코딩 내용에 영향을 받지 않는다.
		String name="jax";
	%>

	<h1>main.jsp 페이지 입니다.</h1>
	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vitae veniam ratione distinctio incidunt molestias accusantium ipsam explicabo quaerat quae quia tempore ullam omnis aspernatur culpa aut esse placeat laborum harum.</p>
	<a href="other.jsp">other 페이지</a>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>