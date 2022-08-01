<%@page import="pg.Dbconfig"%>
<%@page import="java.sql.*"%>
<jsp:include page="oheader.jsp"/>
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
<table  class="table table-border text-center table-striped">
			<thead class="table-dark">
			<tr>
				<th>PG Name</th>
				<th>Rent</th>
				<th>Type</th>
				<th>Operation</th>	
			</tr>
			</thead>
			<tbody>
			<% 
			String ownerid="0";
			String x=session.getAttribute("oname").toString();
			Connection c=Dbconfig.connect();
			String sql="select * from owner where oname=?";
			PreparedStatement ps=c.prepareStatement(sql);
			ps.setString(1,x);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				ownerid= rs.getString("ownerid");
			}
			String sql2="select * from pg where ownerid=?";
			PreparedStatement ps2=c.prepareStatement(sql2);
			ps2.setString(1, ownerid);
			ResultSet rs2=ps2.executeQuery();%> 
			<%
			while(rs2.next()){
				%>
				
				<tr>
						<form method="post" action="PgOperation">
						<td><input type="text" readonly value="<%= rs2.getString("pgname")%>" required name="pgname"></td>
						<td>Rs. <%=rs2.getString("rent") %></td>
						<td><%= rs2.getString("type") %></td>
						<td><input type="submit" name="delete" value="Delete" class="btn btn-danger btn-sm">
							<input type="submit" name="update" value="Update" class="btn btn-primary btn-sm"></td>
						</form>
				</tr>
			
				<% 	
			}
			%>
			</tbody>
			</table>
<jsp:include page="ofooter.jsp"/>