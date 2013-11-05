package controller.user_management;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Storage extends HttpServlet {
	
	public List<FileData> hoho() {
		List<FileData> ret = new ArrayList<Integer>();
		FileData temp = new FileData();
		temp.setDataID(1);
		return ret;
	}
	
}