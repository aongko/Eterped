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
				<%! String url;%>
				<%
					if(session.getAttribute("user_name") == null) {
				%>
				<%
					} else {
						url = "home";
				%>
						$("#content").load("<%=url%>.jsp");
				<% } %>
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
		<div class="navbar navbar-inverse navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<a class="navbar-brand" href="home.jsp">Eterped</a>
				</div>
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li class="active"><a style="cursor:pointer" onclick="movePage('home', this)">Home</a></li>
						<li><a style="cursor:pointer" onclick="movePage('eterped', this)">Text Editor</a></li>
					</ul>
				</div>
				<div class="navbar-collapse collapse" style="margin-top:-4%">
					<span class="navbar-right" style="color:white">Welcome</span>
				</div>
			</div>
		</div>
		
		<div id="content">
		</div>
	</body>
</html>