<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<%@page import = "java.io.*" %>
<!DOCTYPE html>
<html>
	<%@ include file = "template-page/tempHeader.jsp" %>
<body>
	
	<%@ include file = "template-page/tempNavLogin.jsp" %>

	<div style="padding: 25px;"	>
		<form method="post" action="doCompile.jsp">
			<div>
				<label>Choose Language</label>:
				
				<select name="language">
					<option value="c">C</option>
					<option value="cpp">CPP</option>
					<option value="java">Java</option>
				</select>
			</div>

			<textarea name="src" style="min-width:800px;display: block;" rows="25" cols="50" ></textarea>

			<input type="submit" />
		</form>
	</div>
</body>
</html>