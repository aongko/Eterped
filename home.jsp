<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
	<!-- include header file -->
	<%@ include file = "template-page/tempHeader.jsp" %>

	<body>
		<%@ include file = "template-page/tempNavLogin.jsp" %>
		
		<div class="container">
			<div class="row">
				<br><br><br><br><br>
				<p align="center">
					<span style="font-size:300%">WELCOME TO ETERPED</span><br>
					<span style="font-size:150%">Login Time</span><br><br><br>
					<span style="font-size:250%">
						<%= session.getAttribute("time") %>
					</span>
					<span style="font-size:250%">
					</span>
					<br><br><br><br><br><br><br><br>
					<a href="Logout" class="btn btn-danger">Logout</a>
				</p>
			</div>
		</div>
	</body>
</html>
