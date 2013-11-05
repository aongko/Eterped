<%@page import = "java.io.*" %>
<html>
<body>
  <%
    String textId = request.getParameter("textId");
    String textValue = "";
    if (textId != null && !textId.equals("")) {
      String filename = "/txt/" + textId + ".txt";
      InputStream is = application.getResourceAsStream(filename);
      
      if (is == null) textValue = "";
      else {
        try {
          BufferedReader br = new BufferedReader ((new InputStreamReader(is)));
          String line;
          while ( (line = br.readLine()) != null) {
            textValue = textValue + line + "\n";
          }
        }
        catch (Exception e) {
          out.println(e.getMessage());
        }
      }
    }
  %>
  <form method="POST" action="tulis.jsp">
    <textarea name="textValue"><% out.print(textValue);%></textarea>
    <input type="hidden" name="textId" value="<%out.print(textId);%>">
    <input type="submit">
  </form>
</body>
</html>
