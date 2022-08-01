<%@page import="pg.Dbconfig"%>
<%@page import="java.sql.*"%>
<jsp:include page="hheader.jsp"/>
<h5 style="float:right; color:green; font-style:italic">Welcome: <a href="UserView.jsp" class="btn btn-primary"><%= session.getAttribute("uname") %></a></h5><br>
	<div class="container">
	<hr>
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
		<% 	
				Connection c=Dbconfig.connect();
				Statement s=c.createStatement();
				ResultSet rs=s.executeQuery("select * from pg");
				while(rs.next()){
					%>
					<div class="col-sm-4 text-center">
						<div class="card m-2 bg-success">
							<img style="height:200px; " src="<%=  rs.getString("photo")%>">
							<h5 style="color:yellow; font-weight:bold;">PG Name: <%= rs.getString("pgname") %></h5>
							<h5 style=color:white;>Type: <%= rs.getString("type") %></h5>
							<h5 style=color:white;>Address: <%= rs.getString("address") %>,<%= rs.getString("state") %></h5>
							
							<h5 style=color:white;>Rent: Rs.<%= rs.getString("rent") %></h5>
							<form method="post" action="PgDetails">
								
								<input type="submit" class="btn btn-danger btn-block" name=x value="<%= rs.getString("pgname") %> ">
							</form>
						</div>
					</div>
					
					<% 
				}
				c.close();
				
		%>
	</div>
	</div>
<jsp:include page="hfooter.jsp"/>