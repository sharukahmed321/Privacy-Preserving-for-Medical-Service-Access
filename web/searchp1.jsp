

<%@page import="algorithm.TrippleDes"%>
<%@page import="algorithm.Encryption"%>
<%@page import="javax.crypto.SecretKey"%>
<%@page import="javax.crypto.KeyGenerator"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.StringTokenizer"%>
<!DOCTYPE HTML>
<%@page import="network.Req"%>
<%@page import="Dbcon.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>Medical Data Sharing</title>
	<link rel="stylesheet" href="css/regi.css" type="text/css">
</head>
<body>

	<div id="header">
		<center><h1>Lightweight and Privacy-Preserving Medical Services Access for Healthcare Cloud </h1></center>
		<ul>
			<li>
				<a href="user_home.jsp">User Home</a>
			</li>
			<li class="selected">
				<a href="search_patient.jsp">Search Patient Details</a>
			</li>
			<li>
				<a href="search_down.jsp">Download Medical Records</a>
			</li>
                        <li>
				<a href="logout.jsp">Logout</a>
			</li>
		</ul>
	</div>
	<div id="body">
	<img src="images/sear5.jpg" style="height: 320px; width: 1020px" alt="">
        <center><h2>Search Patient Details</h2>
		  <!-- start body---->
   <!-- /.container -->
          <%
//                        String uname = session.getAttribute("name").toString();
                        String search = request.getParameter("search");
                        
                        System.out.println("get the search"+search);
                        session.setAttribute("search", search);
                    %>

        <div class="container">
            <div class="row">
                <div class="box" style="height: 400px;">
                    <!--To do you work-->
                    <!--<div style="border: 1px solid white;height: 350px;border-top-width: 20px;border-bottom-width: 10px">-->
                        <center><h3></h3></center><br />
                        <table border="1" style="text-align: center;margin-left: 0px">
                            <thead>
                           
                                <th style="text-align: center;width: 70px;">PID</th>
                                <th style="text-align: center;width: 70px;">Patient Name</th>
                                <th style="text-align: center;width: 100px;">File Name</th>

                                <th style="text-align: center; width: 100px;">Request</th>
                                 <th style="text-align: center; width: 100px;">Rank</th>
                
                            </thead>
                          
  
//                          
                              <%
                               int fid=0;
                               int rank=0;
                               String f="";
                               int retrank=0;
                                Connection con = null;
                                Statement st = null,st1=null;
                                ResultSet rs = null,rs1=null;
                                Date d=new Date();
                                String words="";
                                int fides=0;
                                String key1="";
                                String uname=session.getAttribute("ssuname").toString();
                                String role=session.getAttribute("role").toString();
                                System.out.println("current Date is----"+d.toString());
                                DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                                String current = df.format(d);
                                System.out.println("simple date formateis--------"+current);
                                try {
                                    con = DbConnection.getConnection();
                                    st = con.createStatement();
                                    st1=con.createStatement();
                                    Statement stes=con.createStatement();
                                    ResultSet rses=stes.executeQuery("select * from upload2");
                                    System.out.println("Eswar====File retrived");
                                    while(rses.next())
                                    {
                                        fides=rses.getInt("id");
                                        System.out.println("fild=="+fides);
                                        Statement stee=con.createStatement();
                                        ResultSet rsee=stee.executeQuery("select * from upload2 where id="+fides+"");
                                         System.out.println("Eswar====id retrived");
                                        while(rsee.next())
                                       {
                                            String key=rsee.getString("keyword");
                                             System.out.println("Eswar====Keyword retrived"+key);
                                             StringTokenizer str=new StringTokenizer(search, ",");
                                    while(str.hasMoreTokens())
                                    {
                                        String str2=str.nextToken();
                                        System.out.println("key wordss===="+str2);
                                        key1=new TrippleDes().encrypt(str2);
                                        System.out.println("Eswar====Keyword entered"+key1);
                                        StringTokenizer token=new StringTokenizer(key,",");                          
           while(token.hasMoreTokens())
           {
               words=token.nextToken();
               System.out.println("Words++"+words);
               if((words.equalsIgnoreCase(key1)) || key1.equalsIgnoreCase(words))
               {
                   rank++;
               }
               System.out.println("rank++"+rank);
                                        }
                                    }
                                             PreparedStatement evs=con.prepareStatement("update upload2 set rank_=? where id=?");
                                             evs.setInt(1, '0');
                                             evs.setInt(2, fides);
                                             evs.execute();
                                             PreparedStatement pstm=con.prepareStatement("update upload2 set rank_=? where id=?");
           pstm.setInt(1, rank);
           pstm.setInt(2,fides);
           int ab=pstm.executeUpdate();
           rank=0;
                     }
                     } 
 ResultSet rst = st.executeQuery("select * from upload2 ORDER BY rank_ desc");
           while(rst.next()){
               f = rst.getString("filename");        
               //k = rst.getString("key_");        
               retrank=rst.getInt("rank_");
               System.out.println(f+"\n");   
   if(retrank==0)
        {
            %>
            
           <%
        }else{
          
           %>
             <tr>
                 <td><%=rst.getInt("id")%> </td>
                 <td><%=rst.getString("owner_name")%> </td>
                 <td><%=rst.getString("filename")%> </td>
                 <td>
                     <a href="Req?fid=<%=rst.getInt("id")%>&fname=<%=rst.getString("filename")%>&sk=<%=rst.getString("sceret_key")%>&ownername=<%=rst.getString("owner_name")%>"> Send </a><br>
                 </td>
                 <td><%=(retrank)%></td>
                 
             </tr>

               
               
            
           
           <% }
           }                                                                                                                  
                                }catch (Exception ex) {
                                        ex.printStackTrace();
                                    }
                                                                       
                                %>

                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.container -->



<!-- end body---->
	</div>
	<div id="footer">
		<div>
			<p>
				<span> </span>
			</p>
			<ul>
				<li id="facebook">
					<a href="#">facebook</a>
				</li>
				<li id="twitter">
					<a href="#">twitter</a>
				</li>
				<li id="googleplus">
					<a href="#">googleplus</a>
				</li>
				<li id="rss">
					<a href="#" >rss</a>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>
