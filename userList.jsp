<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
	<!-- include header file -->
	<%@ include file = "template-page/tempHeader.jsp" %>
	
	<body>
		<%@ include file = "template-page/tempNavLogin.jsp" %>
		
		<div class="container">
			<div class="row">
				<br><br><br><br>
				<h2 style="text-align:center">User List Eterpad</h2>
				<table align="center" class="table table-hover" style="width:80%">
					<thead>
						<tr>
							<th style="text-align:center; width:8%">No</th>
							<th style="text-align:center">Username</th>
							<th style="text-align:center; width:10%">Action</th>
						</tr>
					</thead>
					<tbody>
					<c:choose>
						<c:when test = "${fn:length(username) != 0}">
							<c:forEach begin="0" end="${fn:length(username) - 1}" varStatus="loop">
								<tr>
									<td style="text-align:center">${(loop.index) + 1}</td>
									<td style="text-align:left">${username[loop.index]}</td>
									<td style="text-align:center"><a href="DeleteUser?userid=${userid[loop.index]}" class="btn btn-danger">Delete</a></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr><td colspan="3" style="text-align:center">No data Available</td></tr>
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>
