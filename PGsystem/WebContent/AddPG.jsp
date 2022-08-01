<jsp:include page="oheader.jsp"/>
<div class="container">
	<div class="row">
		<div class="col-sm-8 mx-auto">
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
		<div style="margin:50px">
			<hr style="border-width:5px">
				<h4 style="text-align:center">Owner Registration</h4>
			<hr style="border-width:5px">
		</div>
		
			<form method="post" enctype="multipart/form-data" action="SavePg">
				<div class="form-group">
						<label>Owner ID :</label>
						<input type="text" class="form-control" readonly value="<%= session.getAttribute("ownerid")%>" required name="ownerid">
					</div>
					<div class="form-group">
						<label>PG Name :</label>
						<input type="text" class="form-control" required name="pgname" placeholder="PG Name">
					</div>
					<div class="form-group">
					<label>Type of PG : &emsp; </label>
						<input type="radio" name="type" value="Boys"> Boys &emsp;
						<input type="radio" name="type" value="Girls">Girls &emsp;
						<input type="radio" name="type" value="Both"> Both &emsp;
					</div>
					<div class="form-group">
						<label>State :</label>
						<input type="text" required class="form-control" name="state" placeholder="state">
					</div>
					<div class="form-group">
						<label>Address :</label>
						<textarea name="address" rows="2" class="form-control"></textarea>
					</div>
					<div class="form-group">
						<label>Rent Per Month :</label>
						<input type="text" required class="form-control" name="rent" placeholder="Rent">
					</div>
					<div class="form-group">
						<label>Picture :</label>
						<input type="file" accept=".jpg" required class="form-control" name="pic">
					</div>
					
					<hr style="border-width:5px"><h5 style="color:red; font-weight:bold; font-style:italic;">Facilities :</h5>
					
					<div class="form-group">
						<label>Electricity :&emsp; &emsp; &emsp;</label>
							<input type="radio" name="electricity" value="Yes"> Yes&emsp;
							<input type="radio" name="electricity" value="No"> No
					</div>
					<div class="form-group">
						<label>Fully Furnished :&emsp; </label>
							<input type="radio" name="furnished" value="Yes"> Yes&emsp;
							<input type="radio" name="furnished" value="No"> No 
					</div>
					<div class="form-group">
						<label>Parking :&emsp; &emsp; &emsp; &ensp;</label>
							<input type="radio" name="parking" value="Yes"> Yes&emsp;
							<input type="radio" name="parking" value="No"> No
					</div>
					<div class="form-group">
						<label>AC :&emsp; &emsp; &emsp; &emsp; &emsp; </label>
							<input type="radio" name="ac" value="Yes"> Yes&emsp;
							<input type="radio" name="ac" value="No"> No
					</div>
					<div class="form-group">
						<label>Balcony :&emsp; &emsp; &emsp; &nbsp; </label>
							<input type="radio" name="balcony" value="Yes"> Yes&emsp;
							<input type="radio" name="balcony" value="No"> No
					</div>
					<div class="form-group">
						<label>Laundary :&emsp; &emsp; &emsp; </label>
							<input type="radio" name="laundary" value="Yes"> Yes&emsp;
							<input type="radio" name="laundary" value="No"> No
					</div>
					<div class="form-group">
						<label>Security :&emsp; &emsp; &emsp; &ensp; </label>
							<input type="radio" name="security" value="Yes"> Yes&emsp;
							<input type="radio" name="security" value="No"> No
					</div>

					<hr style="border-width:5px"><h5 style="color:red; font-weight:bold; font-style:italic;">Meals :</h5>
					
					<div class="form-group">
						<label>Breakfast :&emsp; &emsp; &ensp; </label>
							<input type="radio" name="breakfast" value="Yes"> Yes&emsp;
							<input type="radio" name="breakfast" value="No"> No
					</div>
					<div class="form-group">
						<label>Lunch :&emsp; &emsp; &emsp; &ensp; </label>
							<input type="radio" name="lunch" value="Yes"> Yes&emsp;
							<input type="radio" name="lunch" value="No"> No
					</div>
					<div class="form-group">
						<label>Dinner :&emsp; &emsp; &emsp; &ensp; </label>
							<input type="radio" name="dinner" value="Yes"> Yes&emsp;
							<input type="radio" name="dinner" value="No"> No
					</div>
					<input type="submit" class="btn btn-success " value="Add PG">	
				</form>
			</div>
		</div>
	</div>
<jsp:include page="ofooter.jsp"/>