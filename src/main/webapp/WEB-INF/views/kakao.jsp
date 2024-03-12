<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<button id="kakao-login" onclick=kakaologin()>카카오톡 로그인</button>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() 
{
    $('#kakao-login').click(function() 
    {
    	window.location.href = 'https://kauth.kakao.com/oauth/authorize' +
    							'?response_type=code' +
    							'&client_id=ec9d318361ecd986f0d840a73495c081' +
    							'&redirect_uri=http://localhost:8099/kakaoLogin';
    });
});




</script>
</body>
</html>