<!DOCTYPE HTML>
<html>
	<head>
		<title>Eterped</title>
        <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
		<script>
			$(document).ready(function(){
				<%! String url;%>
				<%
					if(session.getAttribute("user_name") == null)
					{
						url = "login";
				%>
						$("body").load("<%=url%>.jsp");
				<%
					}
					else
					{
						url = "home";
				%>
						$("#content").load("<%=url%>.jsp");
				<%}%>
			})
		</script>
	</head>
	<body>
		<a href="login/logout">Log Out</a>
		<div id="content"></div>
	</body>
</html>