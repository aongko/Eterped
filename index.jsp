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
		<script type="text/javascript">
			$(document).ready(function()
			{
				alert("<%= session.getAttribute("user_name") %>");
				<%! String url;%>
				<%
					if(session.getAttribute("user_name") == null)
					{
						url = "login";
				%>
						$("#content").load("<%=url%>.jsp");
				<%
					}
					else
					{
						url = "home";
				%>
						$("#content").load("<%=url%>.jsp");
				<%}%>
			});
			
			// Java Script function to load view
			function movePage(name, remove)
			{
				var tog = $(remove).parent().siblings("");
				if (tog.hasClass("active"))
					$(remove).parent().siblings("").toggleClass("active");
				$("#content").load(name + ".jsp");
			}
		</script>
	</head>
	<body>
		<div class="navbar navbar-inverse navbar-fixed-top" style="height:10%">
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
						<li class="active"><a style="cursor:pointer" onclick="movePage('login', this)">Login</a></li>
						<li><a style="cursor:pointer" onclick="movePage('register', this)">Register</a></li>
					</ul>
				</div>
			</div>
		</div>
		<img src="image/starlight.jpg" width="100%" height="300px"/>
		
		<div id="content">
		</div>
	</body>
</html>