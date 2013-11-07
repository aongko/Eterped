<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*,controller.user_management.Storage,model.FileData.FileData" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
	<!-- include header file -->
	<%@ include file = "template-page/tempHeader.jsp" %>

	<body>
		<%@ include file = "template-page/tempNavLogin.jsp" %>
		
		<%
			Storage storage = new Storage();
			String s = (String)session.getAttribute("name");
			storage.setUsername(s);
			List<FileData> list = storage.hoho();
			for (FileData x : list) {
				out.println("<a href=" + x.getName() + ">" + x.getName() + "</a>" + "<br>");
			}
			
		%>
		<button id="newFile" style="border-corner:10px">Add New File</button>
		<script>
			$("#newFile").click(function(){
				var fileName = prompt("Please enter file name:","File name");
				location.href = "textEditor.jsp#"+$.trim(fileName);
			})
		</script>
	</body>
</html>
