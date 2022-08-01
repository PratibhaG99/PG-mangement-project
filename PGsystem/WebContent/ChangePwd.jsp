<jsp:include page="oheader.jsp"/>
<div class="container">
	<div class="row">
		<div class="col-sm-6 mx-auto">
			<div>
				<h3 style="text-align:center ;color:green">Change Password</h3>
			</div>
			<% 
			if(session.getAttribute("msg")!=null)
				{
					%>
					<div class="alert alert-warning text-center font-weight-bold">
						<%=session.getAttribute("msg") %>
					</div>
					<%
					session.removeAttribute("msg");
				}
				%>
			<form method="post" action="Changepwd">
				<div class="form-group">
					<label>Current Password</label>
					<input type="password" required class="form-control" name="pwd" placeholder="Current Password">
				</div>
				<div class="form-group">
					<label>New Password</label>
					<input type="password" required class="form-control" name="npwd" placeholder="New Password">
				</div>
				<div class="form-group">
					<label>Confirm Password</label>
					<input type="password" required class="form-control" name="cpwd" placeholder="Confirm Password">
				</div>
				<input type="submit" class="btn btn-success btn-block" value="Change Password">
			</form>
		</div>
	</div>
</div>
<jsp:include page="ofooter.jsp"/>