<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Candidate</title>
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
	left: 35%;
}

span {
	color: red;
	font-size: 13px;
}

#canSub {
	font-size: 20px;
	font-weight: bold;
	padding: 2px;
	border: 2px solid black;
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
			<u>Add Candidate</u>
		</h2>
		<form method="post" action="addCandidate" name="addCanForm">
			Student ID : <input type="text" name="roll" id="roll"> <span
				id="idError"></span><br>
			<br> First Name : <input type="text" name="fname" id="fname">
			<span id="fnameError"></span><br>
			<br> Last Name : <input type="text" name="lname" id="lname">
			<span id="lnameError"></span><br>
			<br> <input type="submit" id="canSub">
		</form>
	</div>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function()
{
	$("#canSub").click(function()
	{
		var sid =$("#roll").val();
		var finame=$("#fname").val();
		var laname=$("#lname").val();
		
		if(sid == ""){
			$("#idError").html("* Please Enter Your Id");
			addCanForm.roll.focus();
			return false;
		}
		else if(isNaN(sid)){
			$("#idError").html("* Only numbers are allowed");
			addCanForm.roll.focus();
			return false;
		}
		else if(sid.length < 9 || sid.length>9 ){
			$("#idError").html("* Please Enter Valid Id");
			addCanForm.roll.focus();;
			return false;
		}
		else{
			$("#idError").html("");
		}
		
		var re = /^[a-zA-Z ]*$/;
		if(finame == ""){
			$("#fnameError").html("* First name is required.");
			addCanForm.fname.focus();
			return false;
		}
		else if(!re.test(finame)) 
		{
			$("#fnameError").html("* First name contains only letters.");
			addCanForm.fname.focus();
			return false;
		}
		else{
			$("#fnameError").html("");
		}
		
		if(laname == ""){
			$("#lnameError").html("* Last name is required.");
			addCanForm.lname.focus();
			return false;
		}
		else if(!re.test(laname)) 
		{
			$("#lnameError").html("* Last name contains only letters.");
			addCanForm.lname.focus();
			return false;
		}
		else{
			$("#lnameError").html("");
		}
	});
});
</script>
</html>