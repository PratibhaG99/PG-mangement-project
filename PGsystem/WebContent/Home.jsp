<%@page import="pg.Dbconfig"%>
<%@page import="java.sql.*"%>
<jsp:include page="hheader.jsp"/>
<div class="container">
	<h2 style="text-align:center; font-style:italic; color:orange;">Welcome to Home Page of Second Home</h2>
	<div class="container">
	<hr>
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
						</div>
					</div>
					
					<% 
				}
				c.close();
				
		%>
	</div>
	</div>
	<hr style="border-width:5px">
		<h5 style="text-align:center">To find best place according to your requirement, Login and explore the options.</h5>
	<hr style="border-width:5px">
</div>
<jsp:include page="hfooter.jsp"/>