<%@page import="java.sql.ResultSet"%>
<%@page import="Dbcon.DbConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Random"%>

<%
    String fname=request.getParameter("fname");
    session.setAttribute("fname", fname);
Connection con = null;
    Statement st = null;
     con = DbConnection.getConnection();
        st = con.createStatement();
        ResultSet rs=st.executeQuery("select * from emergncey,upload2 where upload2.filename='"+fname+"'");
        if(rs.next())
         {
         String pname=rs.getString("patient");
         String email=rs.getString("email");
         String skey=rs.getString("sceret_key");
        int i=st.executeUpdate("insert into erequest(email,fname,pname,secret_key,status)values('"+email+"','"+fname+"','"+pname+"','"+skey+"','"+"no"+"')");
                response.sendRedirect("edow.jsp?m=done");
            }
        
        


%>