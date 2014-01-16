<%@ page import="compiler.Compiler,compiler.CompileResult, java.io.File, java.io.OutputStream" trimDirectiveWhitespaces="true" %>
<%
	String src = request.getParameter("src");
	String language = request.getParameter("language");
	
	if (src == null || src.equals("")) {
		response.sendRedirect("index.jsp");
	}
	else {
		Compiler compiler = new Compiler();
		CompileResult cr = compiler.compile(Compiler.getLanguageIndex(language), src);
		
		if (cr.getFile() == null || cr.getResult() == null) {
			response.setCharacterEncoding("UTF-8");
			out.print("<pre>" + cr.getError() + "</pre>");
		}
		else {
			File code = cr.getFile();
			byte[] result = cr.getResult();
			
			OutputStream os = response.getOutputStream();
			
			response.setContentType("application/octet-stream");
			response.setHeader("Content-Disposition", "attachment; filename=\"" + code.getName() + '"');
			
			os.write(result, 0, result.length);
			os.flush();
			return;
			
		}
	}
%>