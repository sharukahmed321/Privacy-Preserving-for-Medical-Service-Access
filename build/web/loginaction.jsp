

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="algorithm.*"%>
<%@page import="network.mail"%>
<%@page import="java.util.UUID"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Dbcon.DbConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Random"%>

<%
    Connection con = null;
    Statement st = null;
   ResultSet rs = null;
   String Fname = request.getParameter("first");
    String lname = request.getParameter("last");
     String Eamil = request.getParameter("email");
      String name = request.getParameter("uname");
       String pass = request.getParameter("pass");
        String DOB = request.getParameter("dob");
         String state = request.getParameter("state");
          String country = request.getParameter("country");
           String Role = request.getParameter("gender");
          String secret = request.getParameter("secret");  
          String temail=request.getParameter("temail");
          System.out.println("secret-------"+secret);
          session.setAttribute( "thesecret", secret );
                    System.out.println("User Details"+Fname+lname+Eamil+name+pass+DOB+state+country+Role);
  String allow = "Allowed"; 
     int status = Integer.parseInt(request.getParameter("status"));
     System.out.println("statussssss"+status);
    try {
        con = DbConnection.getConnection();
        st = con.createStatement();
        switch (status) {
            case 1:
                try {
                    rs = st.executeQuery("select * from reg where uname='" + name + "' AND pass='" + pass + "' AND secret_key='" + secret + "' AND role='Owner'");
                    if (rs.next()) {
                               session.setAttribute("owner_rname", rs.getString("uname"));
                        response.sendRedirect("owner_home.jsp?msg=success");
                    } else {
                        response.sendRedirect("owner.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
            case 2:
                try {
                    rs = st.executeQuery("select * from reg where uname='" + name + "' AND pass='" + pass + "' AND secret_key='" + secret + "'");
                    if (rs.next()) {
                        session.setAttribute("ssmail", rs.getString("email"));
                        session.setAttribute("ssuname", rs.getString("uname"));
                        session.setAttribute("ssstate", rs.getString("state"));
                        session.setAttribute("sscountry", rs.getString("country"));
                        session.setAttribute("role", rs.getString("role"));
                        
                        response.sendRedirect("user_home.jsp?msg=success");
                    } else {
                        response.sendRedirect("user.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
                
                case 3:

              try {
                 con = DbConnection.getConnection();
                 st = con.createStatement();
                  Random RANDOM = new SecureRandom();
                     int PASSWORD_LENGTH = 5;
                     String letters = "0123456789";
                     String key = "";
                    
                     for (int i=0; i<PASSWORD_LENGTH; i++)
                 {
                int index = (int)(RANDOM.nextDouble()*letters.length());
                key += letters.substring(index, index+1);
                 }
                     ResultSet rs2=st.executeQuery("select * from reg where email='"+Eamil+"' or uname='"+name+"'");
                                         if(rs2.next())
                                                                                         {
                                             response.sendRedirect("reg.jsp?m=fail");
                                         }
                     else
                                                 {
            int i = st.executeUpdate("insert into reg(fname, lname, email, uname, pass, dob, state, country, role, permission,secret_key,temail) values ('" + Fname + "','" + lname + "','" + Eamil + "','" + name + "','" + pass + "','" + DOB + "','" + state + "','" + country + "','" + Role + "','" + allow + "','"+key+"','"+temail+"')");                                           
                if (i != 0) {
                     int i1=st.executeUpdate("insert into takecare(temail,pname,otp)values('"+temail+"','"+name+"','"+null+"')");
                    String msg ="Key : "+key ;
           //  session.setAttribute( "Key", key );  
                      System.out.println("your randome string"+msg);
            mail m = new mail();
            m.secretMail(msg, name, Eamil);
           

                response.sendRedirect("owner.jsp?msg=success");
                
                } else {
                     response.sendRedirect("reg.jsp?msgg=failed");
                 }
                  } 
                                         }catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;

            case 4:
                try {
                     
                    String role=request.getParameter("role");
                    rs = st.executeQuery("select * from upload2 where sceret_key='" + secret + "'");
                    if (rs.next()) {
                  session.setAttribute("secret", secret);
                  int fid=rs.getInt("id");
                  String uname=session.getAttribute("ssuname").toString();
                  DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	     Date date = new Date();
             String Sdate= dateFormat.format(date); 
             Statement st3=con.createStatement();
             
           ResultSet rs1=st3.executeQuery("select * from  timeseal where fid='"+fid+"'and uname='"+uname+"'");
             if(rs1.next())
             {
                 
               String start=rs1.getString("start_time");
                 String End_date=rs1.getString("end_time");
                 Date sdate1=new Date(start);
                 Date edate=new Date(End_date);
                 String sdate2=dateFormat.format(sdate1);
                 String edate1=dateFormat.format(edate);
                 System.out.println("edate111111111"+edate1);
                         
//                String  End_date=(String)session.getAttribute("SSend_time");
//                System.out.println("system end date issssssssssss"+End_date);
               // Date edate=dateFormat.format(End_date);
//                String Edate=dateFormat.format(End_date);
                System.out.println("sdate from request.javvvvv"+Sdate);
 System.out.println("\n ewdate from request.javvvvv"+End_date);
               System.out.println("current Closing Date------>?>>>>>>>>>"+Sdate+End_date);
//                if(Sdate.compareTo(edate1)<0)
                   if(((Sdate.compareTo(sdate2)==0)||Sdate.compareTo(sdate2)>0) &&((Sdate.compareTo(edate1)==0)||Sdate.compareTo(edate1)<0))
                {
            
                        
                        response.sendRedirect("update_file.jsp?roll="+role);
                    }
                   else {
                        response.sendRedirect("user_home.jsp?msgg12=failed");
                    }
                }
             else
             {
                 response.sendRedirect("user_home.jsp?m34=fail");
             }
                    }
                    else
                    {
                        response.sendRedirect("down.jsp?msgg=failed");
                    }
                }
             
                catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
  
                case 6:
             
                try {
                    rs = st.executeQuery("select * from patient_details where secret_key='" + pass + "'");
                    if (rs.next()) {
                        session.setAttribute("SSmail", rs.getString("email"));
                        session.setAttribute("SSname", rs.getString("uname"));
                                             
                        response.sendRedirect("user_home.jsp?msg=success");
                    } else {
                        response.sendRedirect("search_down.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                               
                break;
            
            case 7:
                try {
                    if (name.equalsIgnoreCase("Admin") && pass.equalsIgnoreCase("Admin")) {
                        response.sendRedirect("admin_home.jsp?msg=success");
                    } else {
                        response.sendRedirect("admin.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
                 case 8:
                try {
                    if (name.equalsIgnoreCase("proxy") && pass.equalsIgnoreCase("proxy")) {
                        response.sendRedirect("ps.jsp?msg=success");
                    } else {
                        response.sendRedirect("pslogin.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
                 case 9:
                try {
                    if (name.equalsIgnoreCase("server") && pass.equalsIgnoreCase("server")) {
                        response.sendRedirect("ts_home.jsp?msg=success");
                    } else {
                        response.sendRedirect("ts.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
                case 10:

              try {
                 con = DbConnection.getConnection();
                 st = con.createStatement();
                  Random RANDOM = new SecureRandom();
                     int PASSWORD_LENGTH = 5;
                     String letters = "0123456789";
                     String key = "";
                    
                     for (int i=0; i<PASSWORD_LENGTH; i++)
                 {
                int index = (int)(RANDOM.nextDouble()*letters.length());
                key += letters.substring(index, index+1);
                 }
                      ResultSet rs2=st.executeQuery("select * from reg where email='"+Eamil+"' or uname='"+name+"'");
                                         if(rs2.next())
                                                                                         {
                                             response.sendRedirect("reg1.jsp?m=fail");
                                         }
                                           else{
            int i = st.executeUpdate("insert into reg(fname, lname, email, uname, pass, dob, state, country, role, permission,secret_key) values ('" + Fname + "','" + lname + "','" + Eamil + "','" + name + "','" + pass + "','" + DOB + "','" + state + "','" + country + "','" + Role + "','" + allow +"','"+key+"')");                                           
                if (i != 0) {
                                String msg ="Key : "+key ;
           //  session.setAttribute( "Key", key );  
                      System.out.println("uour randome string"+msg);
            mail m = new mail();
            m.secretMail(msg, name, Eamil);
                response.sendRedirect("user.jsp?msg=success");
                } else {
                     response.sendRedirect("reg1.jsp?msgg=failed");
                 }
                  }
              }                      catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
                 case 11:
                try {
                    if (name.equalsIgnoreCase("emergency") && pass.equalsIgnoreCase("emergency")) {
                        response.sendRedirect("edow.jsp?msg=success");
                    } else {
                        response.sendRedirect("emergency.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
          case 12:
              try{
                    st = con.createStatement();
                  Random RANDOM = new SecureRandom();
                     int PASSWORD_LENGTH = 5;
                     String letters = "0123456789";
                     String key = "";
                    
                     for (int i=0; i<PASSWORD_LENGTH; i++)
                 {
                int index = (int)(RANDOM.nextDouble()*letters.length());
                key += letters.substring(index, index+1);
                 }
                     String msg ="Key : "+key ;
                     String sub="OTP";
                     String ee[]={temail};
           //  session.setAttribute( "Key", key );  
                      System.out.println("uour randome string"+msg);
          
                     int i=st.executeUpdate("update takecare set otp='"+key+"' where temail='"+temail+"'");
                     if(i>0)
                                                 {
//                           MailUtil obj=new MailUtil();
                           MailUtil1.sendMail(ee,ee,sub,msg);
                         
                         ResultSet rs1=st.executeQuery("select * from takecare where temail='"+temail+"'");
                         if(rs1.next())
                                                         {
                             session.setAttribute("pname", rs1.getString("pname"));
                             session.setAttribute("temail",temail);
                             response.sendRedirect("tverify.jsp?msg=done");
                         }
                     }
              }
              catch(Exception e)
                                           {
                  e.printStackTrace();
              }
                           break;
                                       case 13:
                                           try{
                                               String email=session.getAttribute("temail").toString();
                                             String otp=request.getParameter("otp");
                                                    st = con.createStatement();
                                               ResultSet rs1=st.executeQuery("select * from takecare where temail='"+temail+"'and otp='"+otp+"'");
                                               if(rs1.next())
                                                                                                     {
                                                   response.sendRedirect("thome.jsp?m=done");
                                               }
                                               else
                                                                                                     {
                                                   response.sendRedirect("tlogin.jsp?m=fail");
                                               }
                                           }
                                           catch(Exception e)
                                                                                                     {
                                               e.printStackTrace();
                                           }
                                           break;
            default:
                response.sendRedirect("index.html");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }

%>