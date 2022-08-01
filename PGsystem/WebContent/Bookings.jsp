<%@page import="pg.Dbconfig"%>
<%@page import="java.sql.*"%>
<jsp:include page="oheader.jsp"/>
	<div class="container">
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
			<%
			String ownerid="0";
			String uname="0";
			String x=session.getAttribute("oname").toString(); 
			%>
			<table  class="table table-border text-center table-striped">
			<thead class="table-dark">
			<tr>
				<th>Customer Name</th>
				<th>Check In Date</th>
				<th>PG Name</th>
				<th>Customer Email</th>
				<th>Rent Paid</th>
				<th>Update Rent</th>
			</tr>
			</thead>
		<tbody>
			<% 
			Connection c=Dbconfig.connect();
			String sql="select * from owner where oname=?";
			PreparedStatement ps=c.prepareStatement(sql);
			ps.setString(1, x);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				ownerid= rs.getString("ownerid");
			}
			String sql2="select * from booking where ownerid=?";
			PreparedStatement ps2=c.prepareStatement(sql2);
			ps2.setString(1, ownerid);
			ResultSet rs2=ps2.executeQuery();
			while(rs2.next()){
				uname= rs2.getString("uname");
				String sql3="select * from user where uname=?";
				PreparedStatement ps3=c.prepareStatement(sql3);
				ps3.setString(1, uname);
				ResultSet rs3=ps3.executeQuery();
				while(rs3.next()){
					%>
					<tr>
						<form method="post" action="Rent">
						<td><input type="text" readonly value="<%= rs2.getString("uname")%>" required name="uname"></td>
						<td><%= rs2.getString("checkin_date") %></td>
						<td><%= rs2.getString("pgname") %></td>
						<td><%= rs3.getString("email") %></td>
						<td><%= rs2.getString("rent_pay") %></td>
							<td><input type="submit" class="btn btn-success btn-sm" name=rent value="Yes">
							<input type="submit" class="btn btn-danger btn-sm" name=rent value="No"></td>
						</form>
					</tr>
					
					<% 
				}
			}
			c.close();
			%>
			</tbody>
			</table>
		</div>
<jsp:include page="ofooter.jsp"/>