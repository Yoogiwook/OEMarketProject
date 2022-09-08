<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
	<title>Room</title>
</head>
<body>
	<div align="center">
	<form method="post" action="/room">
		<table>
			<tr>
				<th><input type="text" value="${login.us_nickname}" name="cr_buyer"></th>
				<th><input type="submit" value="전송"></th>
			</tr>
		</table>
	</form>
	</div>


</body>
</html>