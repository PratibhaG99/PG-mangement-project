<%@page import="pg.Dbconfig"%>
<%@page import="java.sql.*"%>
<jsp:include page="oheader.jsp"/>
<div class="container">
	<div class="row">
		<div class="col-sm-8 mx-auto">
		<% ;
			String pgname=session.getAttribute("pgname").toString();
			Connection c=Dbconfig.connect();
			String sql="select * from pg where pgname=?";
			PreparedStatement ps=c.prepareStatement(sql);
			ps.setString(1,pgname);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				%>
			<form method="post" action="Update">
				<h4 style="text-align:center; color:red; ">Update PG Details</h4>
			<hr style="border-width:5px">
				<div class="form-group">
						<label>Owner ID :</label>
						<input type="text" class="form-control" readonly value="<%= session.getAttribute("ownerid")%>" required name="ownerid">
					</div>
					<div class="form-group">
						<label>PG Name :</label>
						<input type="text" class="form-control"  readonly  required value="<%= rs.getString("pgname") %>" name="pgname" placeholder="PG Name">
					</div>
					<div class="form-group">
					<label>Type of PG : &emsp; </label>
						<input type="radio" name="type" value="Boys"> Boys &emsp;
						<input type="radio" name="type" value="Girls">Girls &emsp;
						<input type="radio" name="type" value="Both"> Both &emsp;
					</div>
					<div class="form-group">
						<label>State :</label>
						<input type="text" required class="form-control" value="<%= rs.getString("state") %>" name="state" placeholder="state">
					</div>
					<div class="form-group">
						<label>Address :</label>
						<textarea name="address" rows="2" class="form-control"><%= rs.getString("address")%></textarea>
					</div>
					<div class="form-group">
						<label>Rent Per Month :</label>
						<input type="text" required class="form-control" value="<%= rs.getString("rent") %>" name="rent" placeholder="Rent">
					</div>
					
					<input type="submit" class="btn btn-block btn-warning" value="Update">
			</form>
			<% 
			}
		%>
		</div>
	</div>
</div>
					
<jsp:include page="ofooter.jsp"/>