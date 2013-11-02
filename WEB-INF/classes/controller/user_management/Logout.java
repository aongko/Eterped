package controller.user_management;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class Logout extends HttpServlet
{
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);  
        if (session != null) {  
            session.invalidate();  
        }  
        getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response); 
	}
}	