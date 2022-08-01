<%@page import="pg.Dbconfig"%>
<%@page import="java.sql.*"%>
<jsp:include page="hheader.jsp"/>
	<%	
			String ownerid="0";
			String pgname="0";
			Connection con=Dbconfig.connect();
			String x=session.getAttribute("uname").toString();
			String sql0="select * from booking where uname=?";
			PreparedStatement ps0=con.prepareStatement(sql0);
			ps0.setString(1,x);
			ResultSet rs0=ps0.executeQuery();
			if(rs0.next()){
				pgname=rs0.getString("pgname");	
			}
			
			String sql="select * from pg where pgname=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,pgname);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				ownerid=rs.getString("ownerid");
				%>
				<div class="container">
					<div class="row">
					<div class="col-sm-6">
					<hr style="border-width:5px">
						<h2 style="color:green; font-weight:bold; font-style:italic; text-align:center" ><%= rs.getString("pgname") %></h2>
					<hr style="border-width:5px">
						<img style="height:300px;" src="<%=  rs.getString("photo")%>">
						<h5>Type: <%= rs.getString("type") %></h5>
						<h5>Address: <%= rs.getString("address") %>,<%= rs.getString("state") %></h5>
						<h5>Rent: Rs. <%= rs.getString("rent") %></h5>
					</div><%} 
					
			String sql2="select * from facilities where ownerid=?";
			PreparedStatement ps2=con.prepareStatement(sql2);
			ps2.setString(1,ownerid);
			ResultSet rs2=ps2.executeQuery();
			if(rs2.next()){%>
					<div class="col-sm-6 text-center">
						<h3 style="color:red; font-style:italic; text-align:center" >Facilities</h3>
					<hr style="border-width:5px">
						<h5>Electricity : &emsp; &emsp; &emsp;<%= rs2.getString("electricity") %></h5>
						<h5>Parking :&emsp; &emsp; &emsp; &ensp; <%= rs2.getString("parking") %></h5>
						<h5>AC :&emsp; &emsp; &emsp; &emsp; &emsp; <%= rs2.getString("ac") %></h5>
						<h5>Balcony : &emsp; &emsp; &emsp; &nbsp;<%= rs2.getString("balcony") %></h5>
						<h5>Fully Furnished : &emsp;<%= rs2.getString("furnished") %></h5>
						<h5>Laundary : &emsp; &emsp; &emsp; <%= rs2.getString("laundary") %></h5>
						<h5>Security : &emsp; &emsp; &emsp; &ensp; <%= rs2.getString("security") %></h5>
						
						<h3 style="color:red; font-style:italic; text-align:center" >Meals</h3>
					<hr style="border-width:5px">
					<%}
			
			String sql3="select * from meal where ownerid=?";
			PreparedStatement ps3=con.prepareStatement(sql3);
			ps3.setString(1,ownerid);
			ResultSet rs3=ps3.executeQuery();
			if(rs3.next()){%>
						<h5>Breakfast : &emsp; &emsp; &ensp; <%= rs3.getString("breakfast") %></h5>
						<h5>Lunch :&emsp; &emsp; &emsp; &ensp; <%= rs3.getString("lunch") %></h5>
						<h5>Dinner :&emsp; &emsp; &emsp; &ensp; <%= rs3.getString("dinner") %></h5>
						<a href="UserView.jsp" class="btn btn-primary btn-block ">Go Back</a>
					</div> 
					</div>
				</div>
				
				<% 
			}
			con.close();
		%>
<jsp:include page="hfooter.jsp"/>