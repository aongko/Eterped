<%@page import="java.io.*"%>
<%
  String textId = request.getParameter("textId");
  String textValue = request.getParameter("textValue");
  if (textId != null && !textId.equals("")) {
    String filename = application.getRealPath("/txt/" + textId + ".txt");
    //out.println(filename);
    OutputStream os = new FileOutputStream(filename);

      try {
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(os));
        bw.write(textValue);
        bw.close();
%>
<script>location.href = "NewFile?fileName=<%=textId%>&username=<%=session.getAttribute("username")%>";</script>
<%
      }
      catch (IOException e) {
        out.println(e.getMessage());
      }
  }
%>
