<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게임리뷰게시판</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
</head>
<body>
	<div class="d-flex flex-row-reverse">
		<div class="border border-secondary h-75 d-inline-block"
			style="padding: 10px; margin: 10px; width: 400px;">
			<div class="row">
				<div class="col-9">
					<input class="form-control" type="text" id="message">
				</div>
				<div class="col-3">
					<button class="btn btn-outline-success w-100" onclick="send()">전송</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<script type="text/javascript">
	var webSocket;

	function connect() {
		var url = "ws://" + document.location.host + "/context-path/chat";
		webSocket = new WebSocket(url);

		webSocket.onopen = function(event) {
			console.log("WebSocket 연결 성공");
		};

		webSocket.onmessage = function(event) {
			var message = event.data;
			// 수신한 메시지를 화면에 출력하는 등의 동작 수행
			console.log("수신 메시지: " + message);
		};

		webSocket.onclose = function(event) {
			console.log("WebSocket 연결 종료");
		};

		webSocket.onerror = function(event) {
			console.log("WebSocket 에러 발생");
		};
	}

	function send() {
		var message = document.getElementById("message").value;
		webSocket.send(message);
	}
</script>
</html>