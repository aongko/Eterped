package controller.user_management;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class LoadFile extends HttpServlet
{	
	public void init(ServletConfig config)
		throws ServletException{
		super.init(config);
	}
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException{
		doPost(request, response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		String textId = request.getParameter("fileName");
		String textValue = "";
		if (textId != null && !textId.equals("")) {
		  String filename = "/txt/" + textId + ".txt";
		  System.out.println(filename);
		  InputStream is = getServletContext().getResourceAsStream(filename);
		  
		  if (is == null) textValue = "";
		  else {
			try {
			  BufferedReader br = new BufferedReader ((new InputStreamReader(is)));
			  String line;
			  PrintWriter writer = response.getWriter();
			  while ( (line = br.readLine()) != null) {
				textValue = textValue + line + "\n";
			  }
			}
			catch (Exception e) {
			  System.out.println(e.getMessage());
			}
		  }
		}
		response.getWriter().write(textValue);  
	}

	public void destroy() 
	{
	
	}
}