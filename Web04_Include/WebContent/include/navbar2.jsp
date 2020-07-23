<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /include/navbar2.jsp --%>
<%
<<<<<<< HEAD
	// 파라미터로 전달되는 thisPage의 value 값 읽어내기
	String thisPage=request.getParameter("thisPage");
%>
<div class="navbar navbar-expand-sm navbar-dark bg-primary">
	<ul class="navbar-nav">
		<li class="nav-item <%if(thisPage.equals("home")){%>active<%}%>">
			<a class="nav-link" href="${pageContext.request.contextPath }/test6/home.jsp">Home</a>
		</li>
		<li class="nav-item <%if(thisPage.equals("game")){%>active<%}%>">
			<a class="nav-link" href="${pageContext.request.contextPath }/test6/game.jsp">Game</a>
		</li>
		<li class="nav-item <%if(thisPage.equals("study")){%>active<%}%>">
			<a class="nav-link" href="${pageContext.request.contextPath }/test6/study.jsp">Study</a>
		</li>
	</ul>
</div>
=======
	//파라미터로 전달되는 thisPage 의 value 값 읽어내기
	String thisPage=request.getParameter("thisPage");
%>
<%if(thisPage.equals("home")){ %>
<div class="navbar navbar-expand-sm navbar-dark bg-primary">
	<ul class="navbar-nav">
		<li class="nav-item active">
			<a class="nav-link" href="${pageContext.request.contextPath }/test6/home.jsp">Home</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="${pageContext.request.contextPath }/test6/game.jsp">Game</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="${pageContext.request.contextPath }/test6/study.jsp">Study</a>
		</li>
	</ul>
</div>
<%}else if(thisPage.equals("game")){ %>
<div class="navbar navbar-expand-sm navbar-dark bg-primary">
	<ul class="navbar-nav">
		<li class="nav-item">
			<a class="nav-link" href="${pageContext.request.contextPath }/test6/home.jsp">Home</a>
		</li>
		<li class="nav-item active">
			<a class="nav-link" href="${pageContext.request.contextPath }/test6/game.jsp">Game</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="${pageContext.request.contextPath }/test6/study.jsp">Study</a>
		</li>
	</ul>
</div>
<%}else if(thisPage.equals("study")){ %>
<div class="navbar navbar-expand-sm navbar-dark bg-primary">
	<ul class="navbar-nav">
		<li class="nav-item">
			<a class="nav-link" href="${pageContext.request.contextPath }/test6/home.jsp">Home</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="${pageContext.request.contextPath }/test6/game.jsp">Game</a>
		</li>
		<li class="nav-item active">
			<a class="nav-link" href="${pageContext.request.contextPath }/test6/study.jsp">Study</a>
		</li>
	</ul>
</div>
<%} %>
>>>>>>> refs/remotes/upstream/master
