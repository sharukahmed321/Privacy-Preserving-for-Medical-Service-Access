

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Dbcon.DbConnection"%>
<%
    String j = request.getQueryString();
                Connection con = DbConnection.getConnection();
                Statement st =con.createStatement();
                int id=Integer.parseInt(request.getQueryString());
        System.out.println("id get successfully"+id);
   String block = "Not_Allowed";
    String  email=(String)session.getAttribute("session_mail");
    
     System.out.println("Session Email id"+email);
    int i = st.executeUpdate("update reg set permission = '" + block + "' where id = '" + id + "'");
    if (i != 0) {
        response.sendRedirect("owner_de.jsp?Msgde=Accuont_Blacked");
    } else {
        response.sendRedirect("owner_de.jsp?msg=Error");
    }
%>
