<%@page import="algorithm.MailUtil"%>
<%@page import="network.mail"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="network.mail"%>
<%@page import="java.util.Random"%>
<%@ page import ="java.sql.*" %>
<%
{
   String url = "jdbc:mysql://localhost:3306/proxy_re_encryption";
        String user = "root";
        String password = "root";
        String status="yes";
//        int id=Integer.parseInt(request.getQueryString());
       String fname=session.getAttribute("fname").toString();
       String pname=request.getParameter("pname");
       String email=request.getParameter("email");
       String skey=request.getParameter("skey");
      try{
            Connection conn = DriverManager.getConnection(url, user, password);
           Statement st=conn.createStatement();
            String msg=" for fileName:"+fname+"Secrete Key is:"+skey;
           
          
           
            
             
                      System.out.println("uour randome string"+msg);
                      String [] ee={email};
                      MailUtil obj=new MailUtil();
                      obj.sendMail(ee,ee,"response for care taker",msg);
           // mail m = new mail();
           // m.secretMail(msg, "", email);
            int i = st.executeUpdate("update erequest set status='" + status + "' where fname = '" + fname + "' and pname='"+pname+"'");
            if(i>0)
                          {
           response.sendRedirect("thome.jsp?m=done");}
     
     }catch(Exception e)
                         {
         e.printStackTrace();
     }
           }
%>

 