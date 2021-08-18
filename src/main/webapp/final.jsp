<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Thank You</title>
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
</style>
</head>
<body>
	<div class="box">
		<b> <a href="home">Home</a></b>
		<%
			if (request.getAttribute("link") != "") {
		%>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b> <a
			href="candidate.jsp"><%=request.getAttribute("link")%></a></b>
		<%
			}
		%>
		<br>
		<br>

		<%=request.getAttribute("message")%>
		<br>
		<br>
	</div>
</body>
</html>