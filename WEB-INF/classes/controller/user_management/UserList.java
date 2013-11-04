package controller.user_management;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.text.*;

public class UserList extends HttpServlet
{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doPost(request, response);
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		ArrayList<String> username = new ArrayList<String>();
		ArrayList<Integer> userid = new ArrayList<Integer>();
		ArrayList<Integer> roleid = new ArrayList<Integer>();
		PrintWriter out = response.getWriter();
		
		String Driver = "com.mysql.jdbc.Driver";
		String db = "jdbc:mysql://localhost/eterped";
		
		try {
			Class.forName(Driver);

			Connection conn = DriverManager.getConnection(db, "root", "");

			Statement stmt = conn.createStatement();
			String sql = "SELECT username, role, a.roleid as roleid, userid FROM users a JOIN roles b ON a.roleid = b.roleid";
			ResultSet rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				String user = rs.getString("username");
				String role = rs.getString("role");
				int userId = rs.getInt("userid");
				int roleId = rs.getInt("roleid");
				if (!role.equals("admin")) {
					username.add(user);
					userid.add(userId);
					roleid.add(roleId);
					out.println(user + " " + userId + " " + roleId);
				}
			}
			
			stmt.close();
			
		} catch (Exception e) {
			out.println(e);
		}
		
		request.setAttribute("username", username);
		request.setAttribute("userid", userid);
		request.setAttribute("roleid", roleid);
		getServletContext().getRequestDispatcher("/userList.jsp").forward(request, response);
	}
}