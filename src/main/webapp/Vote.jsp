<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Voter Panel</title>
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

label {
	position: absolute;
	left: 1px;
	font-size: 16px;
}

#voteSub {
	font-size: 20px;
	font-weight: bold;
	padding: 2px;
	border: 2px solid black;
}
</style>
</head>
<body>
	<%
		String str = request.getAttribute("List").toString();
		String[] lst = (str.substring(1, str.length() - 1)).split(",");

		String str2 = request.getAttribute("idList").toString();
		String[] lst2 = (str2.substring(1, str2.length() - 1)).split(",");
	%>
	<div class="box">
		<label><a href="home"> Home</a></label><br>
		<h2>
			<u>Voting Panel</u>
		</h2>
		<form action="voteCandidate" name="voteForm">
			Student ID : <input type="text" name="id" id="id"> <span
				id="idError"></span>
			<%
				for (int i = 0; i < lst.length; i++) {
					out.println("<br><br><input type=\"radio\" name=\"candidate\" value=\"" + lst2[i].trim() + "\"  > "
							+ lst[i]);
				}
			%>
			<span id="canError"></span> <br>
			<br>
			<br> <input type="submit" name="voteSub" id="voteSub"
				value="Vote">
		</form>
	</div>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function()
{
	$("#voteSub").click(function()
	{
		var sid =$("#id").val();
		var can =$('input[name="candidate"]:checked').val();
		if(sid == ""){
			$("#idError").html("* Please Enter Your Id");
			voteForm.id.focus();
			return false;
		}
		else if(isNaN(sid)){
			$("#idError").html("* Only numbers are allowed");
			voteForm.id.focus();
			return false;
		}
		else if(sid.length < 9 || sid.length>9 ){
			$("#idError").html("* Please Enter Valid Id");
			voteForm.id.focus();
			return false;
		}
		else{
			$("#idError").html("");
		}
		
		if(can == undefined){
			$('#canError').html('<br>* Please select Candidate.');
			return false;
		}
		else{
			$('#gen-error').html('');
		}
	});
});
</script>
</html>