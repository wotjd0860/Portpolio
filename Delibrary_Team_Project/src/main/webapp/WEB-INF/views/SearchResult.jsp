<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script>
		window.onload = function() {
			var result = opener.document.getElementById("result").textContent;
			document.getElementById("parentOutput").innerText = result;
		}
    </script>
</head>
<body>
	<input type="text" id="childInput">
    <div id="parentOutput"></div><button id="getParentOutput">부모창 입력 가져오기</button>
</body>
</html>