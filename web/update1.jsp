

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Dbcon.DbConnection"%>
<%

                Connection con = DbConnection.getConnection();
                Statement st =con.createStatement();

         String Status = "Yes";

    int  id=(Integer)session.getAttribute("theSid");
     System.out.println("session id is geted"+id);
    int i = st.executeUpdate("update request set status='" + Status + "' where id = '" + id + "'");
    if (i != 0) {
        response.sendRedirect("user_de.jsp?msg=Secret_key_sent_to_Your_Email");
    } else {
        response.sendRedirect("user_de.jsp? msg = Error");
    }
%>
