package controller.user_management;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.text.*;

public class Login extends HttpServlet
{
	private int Role;
	
	public boolean cekUser(String username, String password, HttpServletResponse response) throws ServletException, IOException
	{
		String Driver = "com.mysql.jdbc.Driver";
		String db = "jdbc:mysql://localhost/eterped";
		PrintWriter out = response.getWriter();
		
		try {
			Class.forName(Driver);

			Connection conn = DriverManager.getConnection(db, "root", "");

			Statement stmt = conn.createStatement();
			String sql = "SELECT username, password, role FROM users a JOIN roles b on a.roleid = b.roleid WHERE username = '" + username + "' AND password = '" + password + "'";
			ResultSet rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				Role = rs.getInt("role");
				stmt.close();
				return true;
			} else {
				stmt.close();
				return false;
			}
			
			/* GET LAST INSERTED ID
			String q = "INSERT INTO testing_table (name) VALUES ('adit ganteng lagi')";
			int res = stmt.executeUpdate(q);
			String qu = "SELECT LAST_INSERT_ID() as id FROM testing_table";
			ResultSet rs = stmt.executeQuery(qu);
			while (rs.next()) {
				out.println(rs.getInt("id"));
			}*/
			
		} catch (Exception e) {
			out.println(e);
		}
		
		return true;
	}
	
	public void init(ServletConfig config)
		throws ServletException{
		super.init(config);
	}
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException{
		  // If it is a get request forward to doPost()
		  //doPost(request, response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		PrintWriter out = response.getWriter();
		
		boolean check = cekUser(username, password, response);
		if (check) {
			session.setAttribute("username", username);
			session.setAttribute("role", Role);
			java.util.Date date = new java.util.Date();
			SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			session.setAttribute("time", ft.format(date));
			response.sendRedirect("index.jsp");
		} else {
			request.setAttribute("errLog", "Wrong username or password");
			getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
		}
	}

	public void destroy() 
	{
	
	}
}