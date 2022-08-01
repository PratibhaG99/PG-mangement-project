<%@page import="pg.Dbconfig"%>
<jsp:include page="hheader.jsp"/>
<div class="container">
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
		<div class="row">
		<div class="col-sm-6">
		<div>
			<h4 style="text-align:center">Owner Registration</h4>
		</div>
			<form method="post" action="OwnerReg">
				<div class="form-group">
						<label>Owner ID</label>
						<input type="text" readonly value="<%= Dbconfig.getOwnerID()%>" required class="form-control" name="pid">
					</div>
					<div class="form-group">
					<label>Owner Name</label>
						<input type="text" required class="form-control" name="oname" placeholder="Owner Name">
					</div>
					<div class="form-group">
						<label>E-Mail</label>
						<input type="email" required class="form-control" name="email" placeholder="E-Mail">
					</div>
					<div class="form-group">
						<label>Password</label>
						<input type="password" required class="form-control" name="pwd" placeholder="Password">
					</div>
					<input type="submit" class="btn btn-success btn-block" value="Register">
				</form>
			</div>
			<div class="col-sm-6">
		<div>
			<h4 style="text-align:center">Owner Login</h4>
		</div>
			<form method="post" action="OwnerLog">
				<div class="form-group">
					<label>Owner ID</label>
						<input type="text" required class="form-control" name="ownerid" placeholder="Owner ID">
					</div>
					<div class="form-group">
						<label>Password</label>
						<input type="password" required class="form-control" name="pwd" placeholder="Password">
					</div>
					<input type="submit" class="btn btn-success btn-block" value="Login">
				</form>
				</div>
</div>
</div>
<jsp:include page="hfooter.jsp"/>