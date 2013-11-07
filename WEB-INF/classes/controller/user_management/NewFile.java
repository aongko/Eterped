package controller.user_management;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.text.*;

public class NewFile extends HttpServlet
{
	private int uid;
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doPost(request, response);
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		PrintWriter out = response.getWriter();
		
		String Driver = "com.mysql.jdbc.Driver";
		String db = "jdbc:mysql://localhost/eterped";
		
		try {
			Class.forName(Driver);

			Connection conn = DriverManager.getConnection(db, "root", "");

			Statement stmt = conn.createStatement();
			String sql = "SELECT userid FROM users WHERE username='"+request.getParameter("username")+"'";
			ResultSet rs = stmt.executeQuery(sql);
			
			if (rs.next())
				uid = rs.getInt("userid");
			sql = "INSERT INTO data (Name,Src,OwnerId) VALUES('"+request.getParameter("fileName")+"','"+request.getParameter("fileName")+".txt',"+uid+")";
			stmt.executeUpdate(sql);
			stmt.close();
		} catch (Exception e) {
			out.println(e);
		}
		response.sendRedirect("storage.jsp");
	}
}