<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*,org.json.JSONObject,org.json.JSONArray,controller.user_management.Storage,model.file_data.FileData" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
	<!-- include header file -->
	<%@ include file = "template-page/tempHeader.jsp" %>

	<body>
		<%@ include file = "template-page/tempNavLogin.jsp" %>
		
		<%
			Storage storage = new Storage();
			for (FileData x : storage.hoho()) {
				out.println(x.getDataID() + "<br>");
			}
		%>
	</body>
</html>
