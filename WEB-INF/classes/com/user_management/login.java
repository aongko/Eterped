package com.user_management;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class login extends HttpServlet{

	public String target = "/welcome.jsp";
	
	public String getUser(String username, String password){
		
		return username;
	}
	
	public void init(ServletConfig config)
		throws ServletException{
		super.init(config);
	}
	
	public void doGet(HttpServletRequest request,
		HttpServletResponse response)
		throws ServletException, IOException{
		  // If it is a get request forward to doPost()
		  doPost(request, response);
	}

	public void doPost(HttpServletRequest request,
		HttpServletResponse response)
		throws ServletException, IOException {

		// Get the username from the request
		String username = request.getParameter("username");
		// Get the password from the request
		String password = request.getParameter("password");

		String user = getUser(username, password);

		// Add the fake user to the request
		request.setAttribute("USER", user);

		// Forward the request to the target named
		ServletContext context = getServletContext();

		RequestDispatcher dispatcher =
		context.getRequestDispatcher(target);
		dispatcher.forward(request, response);
	}

	public void destroy() {
	}
}