package controller.user_management;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.text.*;

public class DeleteUser extends HttpServlet
{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		PrintWriter out = response.getWriter();

		int uid = Integer.parseInt(request.getParameter("userid"));
		  
		String Driver = "com.mysql.jdbc.Driver";
		String db = "jdbc:mysql://localhost/eterped";

		try {
			Class.forName(Driver);

			Connection conn = DriverManager.getConnection(db, "root", "");

			Statement stmt = conn.createStatement();
			String sql = "DELETE FROM users WHERE userid=" + uid;
			String sql1 = "DELETE FROM usergroups WHERE creatorid=" + uid;
			String sql2 = "DELETE FROM mappingusergroup WHERE userid=" + uid;
			
			stmt.executeUpdate(sql);
			stmt.executeUpdate(sql1);
			stmt.executeUpdate(sql2);
			
		} catch (Exception e) {
			out.println(e);
		}
		
		response.sendRedirect("UserList");
	}
}