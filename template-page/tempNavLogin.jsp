<% if (session.getAttribute("username") == null) response.sendRedirect("login.jsp"); %>

<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="home.jsp">Eterped</a>
		</div>
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li><a href="home.jsp">Home</a></li>
				<li><a href="textEditor.jsp">Text Editor</a></li>
				<li><a href="storage.jsp">Storage</a></li>
				<% if (session.getAttribute("username") != null) { %>
					<% if (session.getAttribute("role").equals("admin")) { %>
						<li><a href="UserList">User List</a></li>
					<% } %>
				<% } %>
			</ul>
		</div>
		<div class="navbar-collapse collapse" style="margin-top:-3%">
			<span class="navbar-right" style="color:white">Welcome, <%= session.getAttribute("name") %> </span>
		</div>
	</div>
</div>