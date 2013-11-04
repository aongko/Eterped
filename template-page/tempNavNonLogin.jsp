<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="login.jsp">Eterped</a>
			<span style="margin-top:-13%; margin-left:100%; width:100%" class="navbar-brand">
				<% String errLog = (String)request.getAttribute("errLog");
					if (errLog != null) { %>
						<span style="color:red; font-size:20px"> <%= errLog %> </span>
				<% } %>
			</span>
		</div>
		<div class="navbar-collapse collapse">
			<form class="navbar-form navbar-right" method="post" action="Login">
				<div class="form-group">
					<input type="text" name="username" placeholder="Username" class="form-control">
				</div>
				<div class="form-group">
					<input type="password" name="password" placeholder="Password" class="form-control">
				</div>
				<button type="submit" class="btn btn-success">Sign in</button>
			</form>
		</div>
	</div>
</div>

<img src="image/starlight.jpg" width="100%" height="300px"/>