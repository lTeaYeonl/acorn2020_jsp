<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/ajax/test01.jsp</title>
</head>
<body>
	<button id="getBtn">요청하기</button>
	<button id="getBtn2">요청하기2</button>
	<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
	<script>
		// id 가 getBtn 인 곳에 "click" 이벤트가 일어 났을 때 호출되는 함수 등록
		$("#getBtn").on("click", function(){
			// jquery 의 기능을 이용해서 ajax 요청하기
			$.ajax({
				method:"GET",
				url:"${pageContext.request.contextPath }/ajax/getmsg.jsp",
				data:"num=1&name=kimchungha",
				success:function(responseData){
					console.log(responseData);
				}
			});
		})
		
		$("#getBtn2").on("click", function(){
			$.ajax({
				method:"get", // 소문자로 작성해도 된다.
				url:"getmsg.jsp", // 상대 경로도 가능하다.
				data:{}, // 요청 파라미터를 object 로 전달해도 된다.
				success:function(data){ // 함수에 전달받는 변수명은 마음대로 작성 가능
					console.log(data);
				}
			})
		})
	</script>
</body>
</html>