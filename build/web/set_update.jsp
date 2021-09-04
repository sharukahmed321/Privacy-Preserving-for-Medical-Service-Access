

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Dbcon.DbConnection"%>
<%

                Connection con = DbConnection.getConnection();
                Statement st =con.createStatement();
               int  id =(Integer)session.getAttribute("theNamessss");
               String fname=session.getAttribute("fname").toString();
                    String sdate = request.getParameter("sdate");
                    String uname=request.getParameter("usr");
                    System.out.println("user nameeeeeeeeee"+uname);
                    System.out.println("starting date is======"+sdate);
         String cdate = request.getParameter("cdate");
           System.out.println("closing date is======"+cdate);
   
     System.out.println("session id is geted"+id);
     ResultSet rs=st.executeQuery("select * from timeseal where fid='"+id+"' and uname='"+uname+"'");
     if(rs.next())
    {
         int i=st.executeUpdate("update timeseal set start_time='" + sdate + "', end_time='" + cdate + "' where fid = '" + id + "' and uname='"+uname+"'");
         if(i>0)
              response.sendRedirect("time_t.jsp?status=Date_update_Successfully");
     }
    else
               {
         PreparedStatement ps=con.prepareStatement("insert into timeseal (fid,uname,start_time,end_time) values(?,?,?,?)");
         ps.setInt(1, id);
         ps.setString(2, uname);
         ps.setString(3, sdate);
         ps.setString(4, cdate);
         int i=ps.executeUpdate();
         //    int i = st.executeUpdate("update upload2 set start_time='" + sdate + "', end_time='" + cdate + "' where id = '" + id + "'");
    if (i != 0) {
        response.sendRedirect("time_t.jsp?status=Date_update_Successfully");
    } else {
        response.sendRedirect("time_t.jsp? msg = Error");
    }
       }
%>
