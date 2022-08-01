<%@page import="pg.Dbconfig"%>
<jsp:include page="oheader.jsp"/>
<div class="container">
	<h2 style="color:green; text-align:center">Owner Dashboard</h2>
	<div class="container">
	<hr>
	<div class="row">
		<div class="col-sm-3 text-center">
			<div class="card m-2 bg-danger">
				<h4 style="color:white; padding:10px">PG Registered</h4>
				<h4 style="color:white; padding:10px"><%= Dbconfig.countRecords("pg") %></h4>
			</div>
		</div>
		<div class="col-sm-3 text-center">
			<div class="card m-2 bg-warning">
				<h4 style="color:white; padding:10px">Owners</h4>
				<h4 style="color:white; padding:10px"><%= Dbconfig.countRecords("owner") %></h4>
			</div>
		</div>
		<div class="col-sm-3 text-center">
			<div class="card m-2 bg-success">
				<h4 style="color:white; padding:10px">Users</h4>
				<h4 style="color:white; padding:10px"><%= Dbconfig.countRecords("user") %></h4>
			</div>
		</div>
		<div class="col-sm-3 text-center">
			<div class="card m-2 bg-primary">
				<h4 style="color:white; padding:10px">Bookings</h4>
				<h4 style="color:white; padding:10px"><%= Dbconfig.countRecords("booking") %></h4>
			</div>
		</div>
	</div>
	</div>
</div>
<jsp:include page="ofooter.jsp"/>