<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
	<!-- include header file -->
	<%@ include file = "template-page/tempHeader.jsp" %>
	<body>
		<% if (session.getAttribute("username") != null) response.sendRedirect("index.jsp"); %>
		
		<%@ include file = "template-page/tempNavNonLogin.jsp" %>
		
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

