<%@page import="pg.Dbconfig"%>
<%@page import="java.sql.*"%>
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
			<%
			String x=session.getAttribute("uname").toString(); 
			Connection c=Dbconfig.connect();
			String sql="select * from user where uname=?";
			PreparedStatement ps=c.prepareStatement(sql);
			ps.setString(1, x);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				%>
				<h5 style="color:green; font-weight:bold; font-style:italic; text-align:center;">User Name: <%= rs.getString("uname") %></h5>
				<div class="row">
				<div class="col-sm-4">
				<br><br>
				<a href="Logout" class="btn float-left btn-danger" >Logout</a><br><br>
						<h5>E-mail ID :&emsp; &emsp; &emsp; &ensp; <%= rs.getString("email") %></h5>
						<h5>Phone Number :&emsp; &ensp; <%= rs.getString("phone") %></h5>
						<h5>ID Proof :</h5>
						<img style="height:300px;" src="<%=  rs.getString("idproof")%>">
				</div><% }
			String sql2="select * from booking where uname=?";
			PreparedStatement ps2=c.prepareStatement(sql2);
			ps2.setString(1, x);
			ResultSet rs2=ps2.executeQuery();
			if(rs2.next()){
				%><div class="col-sm-8"><% 
				if(rs2.getString("rent_pay").equals("No")){
					%> 
						<h4 style="color:red; background-color:yellow; text-align:center">REMINDER: "Pay Your rent"</h4><br>
					<% 
				}
			%>	
					<a href="Leave" class="btn float-right btn-warning" >Leave PG</a><br><br>
					<h3 style="color:red; font-style:italic; text-align:center" >Booking Details</h3>
					<hr style="border-width:5px">
					<table  class="table table-border">
					<thead class="table-dark">
					<tr>
						<th>Use Name</th>
						<th>Owner ID</th>
						<th>PG Name</th>
						<th>Check In Date</th>
						<th>Rent Paid</th>
						<th>PG Details</th>
					</tr>
					</thead>
					<tr>
						<td><%= rs2.getString("uname") %></td>
						<td><%= rs2.getString("ownerid") %></td>
						<td><%= rs2.getString("pgname") %></td>
						<td><%= rs2.getString("checkin_date") %></td>
						<td><%= rs2.getString("rent_pay") %></td>
						<td><a href="UserNpg.jsp" class="btn btn-primary btn-sm" >View Details</a></td>
					</tr>
					</table>
					
				</div>
				</div>		
			
				<%} 
			c.close();
		%>
	</div>
<jsp:include page="hfooter.jsp"/>