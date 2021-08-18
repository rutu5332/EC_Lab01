<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vote Result</title>
<style>
body {
	font-size: 20px;
}

.box {
	border: 5px solid black;
	padding: 10px;
	width: 30%;
	text-align: center;
	position: absolute;
	top: 20%;
	left: 35%
}

label {
	position: absolute;
	left: 1px;
	font-size: 16px;
}
</style>
</head>
<body>
	<div class="box">
		<label><a href="home"> Home</a></label><br>
		<h2>
			<u> Poll Result</u>
		</h2>
		<%
			String str[] = (request.getAttribute("Names").toString()).split("/");
			String str2[] = (request.getAttribute("Values").toString()).split("/");
			if(str.length > 0)
				out.println("<br><b>Won</b> : " + str[0] + "(" + str2[0] + ")<br><br>");
			if(str.length > 1)
				out.println("Loss : " + str[1] + "(" + str2[1] + ")");
		%>
		<br>
		<br>
	</div>
</body>
</html>