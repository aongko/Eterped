package controller.user_management;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.*;
import java.security.MessageDigest;

public class Register extends HttpServlet
{
	public String encryptPassword(String pass) throws Exception
	{
		String original = pass;
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(original.getBytes());
		byte[] digest = md.digest();
		StringBuffer sb = new StringBuffer();
		for (byte b : digest) {
			sb.append(Integer.toHexString((int) (b & 0xff)));
		}
		
		return sb.toString();
	}
	
	public void insertIntoDatabase(HttpServletRequest request, HttpServletResponse response, String username, String password, String realName)
	throws ServletException, IOException {
		String Driver = "com.mysql.jdbc.Driver";
		String db = "jdbc:mysql://localhost/eterped";
		PrintWriter out = response.getWriter();
		
		try {
			Class.forName(Driver);
			Connection conn = DriverManager.getConnection(db, "root", "");
			Statement stmt = conn.createStatement();
			
			String query2 = "INSERT INTO users (username, password, roleid) values ('" + username + "', '" + password + "', 2)";
			stmt.executeUpdate(query2);
			String queryGetUserID = "SELECT LAST_INSERT_ID() as id";
			ResultSet rs1 = stmt.executeQuery(queryGetUserID);
			int tmpUserID = 0;
			while (rs1.next()) tmpUserID = rs1.getInt("id");
			
			String query3 = "INSERT INTO usergroups (name, creatorid) VALUES ('" + realName + "', " + tmpUserID + ")";
			stmt.executeUpdate(query3);
			String queryGetUserGroupID = "SELECT LAST_INSERT_ID() as id";
			ResultSet rs2 = stmt.executeQuery(queryGetUserGroupID);
			int tmpUserGroupID = 0;
			while (rs2.next()) tmpUserGroupID = rs2.getInt("id");
			
			String query4 = "INSERT INTO mappingusergroup (usergroupid, userid, datejoin) VALUES (" + tmpUserGroupID + ", " + tmpUserID + " , CURRENT_DATE())";
			stmt.executeUpdate(query4);
			
			
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
		
		String username = request.getParameter("user");
		String pass = request.getParameter("pass");
		String confPass = request.getParameter("confpass");
		String realName = request.getParameter("name");
		PrintWriter out = response.getWriter();
		
		if (username.length() == 0) {
			request.setAttribute("errReg", "Username must be filled");
			getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
		} else if (realName.length() == 0) {
			request.setAttribute("errReg", "Real Name must be filled");
			getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
		} else if (pass.length() == 0) {
			request.setAttribute("errReg", "Password must be filled");
			getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
		} else if (confPass.length() == 0) {
			request.setAttribute("errReg", "Confirm Password must be filled");
			getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
		} else if (!pass.equals(confPass)) {
			request.setAttribute("errReg", "Password and confirm must same");
			getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
		} else {
			try {
				pass = encryptPassword(pass);
			} catch (Exception e) {
			}
			
			insertIntoDatabase(request, response, username, pass, realName);
			request.setAttribute("errReg", "Successfully Registered");
			getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
		}
	}
}