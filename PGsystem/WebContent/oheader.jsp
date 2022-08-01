
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Second Home</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="icon" href="images/pglogo.png">
</head>
<style>
a{
	text-decoration:none;
	display:block;
	color:white;
	padding:10px;
	border-bottom:1px dashed white;
	font-weight:bold;
}

a:hover{
	background-color:grey;
}

.header{
	height:150px;
	background-image:url('images/header.jpg');
	background-repeat:no-repeat;
	text-align:center;
	background-size:100% 100%;
	line-height:150px;
	font-family:Arial;
	color:white;
	margin:0;
}

</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-2 p-0 bg-dark" style="min-height:100vh">
				<img src="images/pglogo.png" class="rounded-circle"
				style="width:220px;height:150px">
				<a href="AddPG.jsp">Add PG</a>
				<a href="ManagePg.jsp">Manage PG</a>
				<a href="Bookings.jsp">Bookings</a>
				<a href="ChangePwd.jsp">Change Password</a>
				<a href="Logout">Logout</a>
			</div>
		<div class="col-sm-10 p-0">
			<h1 class="header">
				SECOND HOME
			</h1>
			<h5 style="float:right; color:blue; font-style:italic">Welcome: <%= session.getAttribute("oname") %></h5>
	