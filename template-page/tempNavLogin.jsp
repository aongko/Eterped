<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="home.jsp">Bluelight Online Shop</a>
		</div>
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li><a href="home.jsp">Home</a></li>
				<% 
					if (session.getAttribute("type").equals("0")) {
				%>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Change Password<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="changePassword.jsp">Change Password</a></li>
								<li><a href="userList.jsp">User List</a></li>
							</ul>
						</li>
				<% } else { %>
						<li><a href="changePassword.jsp">Change Password</a></li>
				<% } %>
				<li><a href="product.jsp">Product</a></li>
				<li><a href="testimonial.jsp">Testimonial</a></li>
				<li><a href="testimonial.jsp">Services</a></li>
				</li> -->
			</ul>
		</div><!--/.navbar-collapse -->
	</div>
</div>

<img src="image/starlight.jpg" width="100%" height="300px"/>