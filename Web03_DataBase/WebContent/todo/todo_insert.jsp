<%@page import="test.todo.dao.TodoListDao"%>
<%@page import="test.todo.dto.TodoListDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");

	// dto 객체 생성
	TodoListDto dto=new TodoListDto();
	// list.jsp에서 입력받은 값들을 받아옵니다.
	String content=request.getParameter("Content");
	// 빈값이 아닐경우에만 저장
	if(content.length() <= 0){
		out.println("<script> 값을 입력해주세요 </script>");
		return;
	}
	dto.setContent(content);
	
	TodoListDao dao=TodoListDao.getInstance();
	
	boolean isSuccess=dao.insert(dto);
	if(isSuccess=true){
		out.println("<script> <div class='alert alert-primary' role='alert' alert('내용을 성공적으로 저장했습니다.'); </script>");
		out.println("<script> location.href='list.jsp'; </script>");
	}else{
		out.println("<script> 저장에 실패했습니다. </script>");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/todo_insert.jsp</title>
</head>
<body>

</body>
</html>