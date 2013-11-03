<!DOCTYPE HTML>
<html>
	<head>
		<title>Eterped</title>
		
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<link rel="shortcut icon" href="icon/favicon.png">
		
		<!-- Custom styles for this template -->
		<link href="css/bootstrap.css" rel="stylesheet">
		<link href="css/docs.css" rel="stylesheet">
		<link href="css/pygments-manni.css" rel="stylesheet">
		<link href="css/jumbotron.css" rel="stylesheet">
	
		<!-- JS file -->
		<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="js/nicEdit.js"></script>
		<script type="text/javascript" src="js/application.js"></script>
		<script type="text/javascript" src="js/bootstrap.js"></script>
		<script type="text/javascript" src="js/holder.js"></script>
		<script type="text/javascript" src="js/engine.js"></script>
	</head>
	<body>
		<% if (session.getAttribute("username") != null) response.sendRedirect("index.jsp"); %>
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
		
		<div class="container">
			<div class="row">
				<h2 style="text-align:center">Sign Up</h2><br>
				<h3 style="text-align:center">You're not cool before you have id in here!</h3><br>
				<form method="post" class="form-signin" action="Register">
					<table class="table" align="center" style="width:50%">
						<tr>
							<td align="left" style="width:51%">Username</td>
							<td align="right" style="width:100%"><input type="text" class="form-control" name="user"></td>
						</tr>
						<tr>
							<td align="left" style="width:51%">Full Name</td>
							<td align="right" style="width:100%"><input type="text" class="form-control" name="name"></td>
						</tr>
						<tr>
							<td align="left" style="width:51%">Password</td>
							<td align="right" style="width:100%"><input type="password" class="form-control" name="pass"></td>
						</tr>
						<tr>
							<td align="left" style="width:51%">Confirm Password</td>
							<td align="right" style="width:100%"><input type="password" class="form-control" name="confpass"></td>
						</tr>
					</table>
					<br>
					<%
						String errReg = (String)request.getAttribute("errReg");
						if (errReg != null) {
					%>
							<div style="text-align:center">
								<%= errReg %>
							</div>
					<% } %>
					<br>
					<p align="center">
						<input type="submit" class="btn btn-success" value="Register" style="text-align:center">
					</p>
				</form>
			</div>
		</div>
	</body>
</html>

