<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%-- /include/navbar.jsp --%>
<%
	// 요청 파라미터 읽어내기
=======
<%-- /include/navbar.jsp  --%>
<%
	//요청 파라미터 읽어내기
>>>>>>> refs/remotes/upstream/master
	String thisPage=request.getParameter("thisPage");
%>
<div>
	navbar 입니다. <strong><%=thisPage %></strong> 에 포함되었음
</div>