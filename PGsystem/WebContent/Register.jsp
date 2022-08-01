<jsp:include page="hheader.jsp"/>
 <a style="float:right" href="Login.jsp" class="btn btn-success btn-warning" >Login</a><br>
<div class="row">
	<div class="col-sm-6 mx-auto">
		<div>
			<h4 style="text-align:center">Registration</h4>
		</div>
		<%
				if(session.getAttribute("msg")!=null)
				{
					%>
					<div class="alert alert-success text-center font-weight-bold">
						<%=session.getAttribute("msg") %>
					</div>
					<%
					session.removeAttribute("msg");
				}
				%>
			<form method="post"  enctype="multipart/form-data" action="Register">
				<div class="form-group">
					<label>User Name</label>
						<input type="text" required class="form-control" name="uname" placeholder="User Name">
					</div>
					<div class="form-group">
						<label>E-Mail</label>
						<input type="email" required class="form-control" name="email" placeholder="E-Mail">
					</div>
					<div class="form-group">
						<label>Phone Number</label>
						<input type="text"  maxlength="10" pattern="[0-9]{10}" required class="form-control" name="phone" placeholder="Phone Number">
					</div>
					<div class="form-group">
						<label>ID Proof</label>
						<input type="file" accept=".jpg" required class="form-control" name="id">
					</div>
					<div class="form-group">
						<label>Password</label>
						<input type="password" required class="form-control" name="upwd" placeholder="Password">
					</div>
					<div class="form-group">
						<input type="checkbox" required >
						<lable>I agree to all terms and conditions.</lable>
					</div>
					<input type="submit" class="btn btn-primary" value="Register">
				</form>
		</div>
</div>
<jsp:include page="hfooter.jsp"/>