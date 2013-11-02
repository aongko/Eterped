package controller.user_management;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class Login extends HttpServlet
{

	public String target = "/home.jsp";
	
	public String getUser(String username, String password){
		
		return username;
	}
	
	public void init(ServletConfig config)
		throws ServletException{
		super.init(config);
	}
	
	@Override
	public void doGet(HttpServletRequest request,
		HttpServletResponse response)
		throws ServletException, IOException{
		  // If it is a get request forward to doPost()
		  //doPost(request, response);
	}

	@Override
	public void doPost(HttpServletRequest request,
		HttpServletResponse response)
		throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		// Get the username from the request
		String username = request.getParameter("username");
		// Get the password from the request
		String password = request.getParameter("password");

		String user = getUser(username, password);

		// Add the fake user to the request
		//session.setAttribute("user_name", username);
		
		PrintWriter out = response.getWriter();
		out.println(user);
		// Forward the request to the target named
		ServletContext context = getServletContext();
		String url = request.getRequestURL().toString();
		String baseURL = url.substring(0, url.length() - request.getRequestURI().length()) + request.getContextPath() + "/";
		out.println(baseURL);
		/*RequestDispatcher dispatcher =
		context.getRequestDispatcher("/");
		dispatcher.forward(request, response);
		return;*/
	}

	public void destroy() 
	{
	
	}
}