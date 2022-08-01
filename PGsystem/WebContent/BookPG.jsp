<%@page import="pg.Dbconfig"%>
<%@page import="java.sql.*"%>
<jsp:include page="hheader.jsp"/>
<div class="container">
	<% 
		String x= session.getAttribute("uname").toString();
		Connection con=Dbconfig.connect();
		String sql0="select * from booking where uname=?";
		PreparedStatement ps0=con.prepareStatement(sql0);
		ps0.setString(1,x);
		ResultSet rs0=ps0.executeQuery();
		if(rs0.next()){
			 response.sendRedirect("ViewPG.jsp");
			 session.setAttribute("msg", "Can't book, you already have booking!!");
	}
	%>
	<%
			String sql="select * from user where uname=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,x);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				%>
				<div class="row">
				<div class="col-sm-6 ">
						<h3 style="color:red; font-style:italic; text-align:center" >User Details</h3>
						<hr style="border-width:5px">
						<h5>User Name :&emsp; &emsp; &emsp; <%= rs.getString("uname") %></h5>
						<h5>E-mail ID :&emsp; &emsp; &emsp; &ensp; <%= rs.getString("email") %></h5>
						<h5>Phone Number :&emsp; &ensp; <%= rs.getString("phone") %></h5>
						<h5>ID Proof :</h5>
						<img style="height:300px;" src="<%=  rs.getString("idproof")%>">
				</div>
				
				<% 
			}
						
						String y= session.getAttribute("pgbooked").toString();
						String sql2="select * from pg where pgname=?";
						PreparedStatement ps2=con.prepareStatement(sql2);
						ps2.setString(1,y);
						ResultSet rs2=ps2.executeQuery();
						if(rs2.next()){
				%>
				<div class="col-sm-6 ">
						<h3 style="color:red; font-style:italic; text-align:center" >PG Details</h3>
						<hr style="border-width:5px">
						<h4 style="color:green; font-weight:bold; font-style:italic; " >PG Name :<%= rs2.getString("pgname") %></h4>
						<h5>Type: <%= rs2.getString("type") %></h5>
						<h5>Address: <%= rs2.getString("address") %>,<%= rs2.getString("state") %></h5>
						<h5>Rent: <%= rs2.getString("rent") %></h5>
						<img style="height:300px; margin:10px;" src="<%=  rs2.getString("photo")%>">
						<form method="post" action="BookPg">
							<div class="form-group">
								<label>Date of Check In :</label>
								<input type="date" class="form-control" required name="cdate">
							</div>
							<input type="submit" class="btn btn-warning btn-block " value="Confirm Booking">
						</form>
						<a href="ViewPG.jsp" class="btn btn-primary btn-block ">Go Back</a>
					</div>
				</div>
				<% 
				}
			con.close();
		%>
		</div>
<jsp:include page="hfooter.jsp"/>