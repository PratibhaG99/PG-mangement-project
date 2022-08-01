<jsp:include page="hheader.jsp"/>
<div class="row">
	<div class="col-sm-6 mx-auto">
	<div>
		<h4 style="text-align:center">Login</h4>
	</div>
	<%
				if(session.getAttribute("msg")!=null)
				{
					%>
					<div class="alert alert-danger text-center font-weight-bold">
						<%=session.getAttribute("msg") %>
					</div>
					<%
					session.removeAttribute("msg");
				}
				%>
		<form method="post" action="Login">
			<div class="form-group">
				<label>E-mail</label>
			<input type="text" required class="form-control" name="email" placeholder="E-mail">
			</div>
			<div class="form-group">
				<label>Password</label>
				<input type="password" required class="form-control" name="upwd" placeholder="Password">
			</div>
			<input type="submit" class="btn btn-success" value="Login">
			<h5>New User?Create your account <a href="Register.jsp">here</a></h5>
		</form>
		</div>
</div>
<jsp:include page="hfooter.jsp"/>