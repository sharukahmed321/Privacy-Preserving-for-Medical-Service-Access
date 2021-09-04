

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Dbcon.DbConnection"%>
<%
    String j = request.getQueryString();
                Connection con = DbConnection.getConnection();
                Statement st =con.createStatement();
String  msg=(String)session.getAttribute("Key");
String block = "Allowed";
    System.out.println("message"+msg);
    String  mail=(String)session.getAttribute("Email");
    String  email=(String)session.getAttribute("Email");
     System.out.println("Email id"+email);
    int i = st.executeUpdate("update reg set secret_key = '" + msg + "', permission='" + block + "' where email = '" + email + "'");
    if (i != 0) {
        response.sendRedirect("owner_de.jsp?Msgac= Activate_key_sent_to_Your_Email");
    } else {
        response.sendRedirect("owner_de.jsp? msg=Error");
    }
%>