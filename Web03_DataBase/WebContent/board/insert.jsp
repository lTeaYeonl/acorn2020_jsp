<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 인코딩
	request.setCharacterEncoding("utf-8");
	// 폼에서 값 읽어오기
	String writer=request.getParameter("writer");
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	// DB에 저장
	BoardDto dto=new BoardDto();
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setContent(content);
	//BoardDao 객체를 이용해서 DB 에 저장하고 성공 여부를 리턴 받는다
	boolean isSuccess=BoardDao.getInstance().insert(dto);
	// html에서 응답
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/insert.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
</head>
<body>
	<h1>알림</h1>
	<%if(isSuccess){ %>
	<div class="alert alert-success">
		<p>
			<strong><%=writer %></strong> 님이 작성한 글이 저장되었습니다.
			<a class="alert-link" href="list.jsp">확인</a>
		</p>
	</div>
	<%}else{ %>
	<div class="alert alert-danger">
		<p>
			글 저장에 실패했습니다.
			<a class="alert-link" href="insertform.jsp">다시 작성하기</a>
		</p>
	</div>
	<%} %>
</body>
</html>