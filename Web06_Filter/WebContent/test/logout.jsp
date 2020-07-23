<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
<<<<<<< HEAD
	// 로그아웃 처리하기
	session.invalidate(); // 세션초기화
	// Context Path
	String cPath=request.getContextPath();
	// 리다이렉트 응답
	response.sendRedirect(cPath+"/index.jsp");
%>
=======
	//로그아웃 처리하기
	session.invalidate(); //세션 초기화 
	//Context Path
	String cPath=request.getContextPath();
	//리다일렉트 응답
	response.sendRedirect(cPath+"/index.jsp");
%>    
>>>>>>> refs/remotes/upstream/master
