<%@ page language="java" %>
<%@ page import="java.io.*" %>
<%
InputStream in = request.getInputStream();
int size = request.getContentLength();
String filename = request.getParameter("name");

response.setContentType("image/jpeg");
response.setContentLength(size);
response.setHeader("Content-Disposition", "attachment; fileName=\""+filename+"\";");
response.setHeader("Content-Transfer-Encoding", "binary");

try{
    out.clear();
    pageContext.pushBody();
    byte[] bytes = new byte[1024];
    OutputStream os = response.getOutputStream();
    while(true){
        int red = in.read(bytes, 0, bytes.length);
        if(red < 0) break;
        os.write(bytes, 0, red);
    }
    os.flush();
    os.close();
    in.close();
}catch(IOException e){
    e.printStackTrace();
}
%>
