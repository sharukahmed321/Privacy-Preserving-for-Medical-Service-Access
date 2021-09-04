

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
                            <tr>
                                <th style="text-align: center;width: 70px;">PID</th>
                                <th style="text-align: center;width: 70px;">Patient Name</th>
                                <th style="text-align: center;width: 100px;">File Name</th>

                                <th style="text-align: center; width: 100px;">Request</th>
                            </tr>
                          
                               <%int fid=0;
                                Connection con = null;
                                Statement st = null;
                                ResultSet rs = null;
                                Date d=new Date();
                                String role=session.getAttribute("role").toString();
                                System.out.println("current Date is----"+d.toString());
                                DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
String current = df.format(d);
System.out.println("simple date formateis--------"+current);
                                try {
                                    con = DbConnection.getConnection();
                                    st = con.createStatement();
                                    StringTokenizer str=new StringTokenizer(search, ",");
                                    while(str.hasMoreTokens())
                                    {
                                        String str2=str.nextToken();
                                    
                                   rs = st.executeQuery("select * from upload2 where keyword LIKE '%" + search + "%'");

                                    if (rs.next()) {
//                                        String start=rs.getString("start_time");
//                                        String entime=rs.getString("end_time");
//                                                 if(((current.compareTo(start)==0)||current.compareTo(start)>0) &&((current.compareTo(entime)==0)||current.compareTo(entime)<0))
//                                                       {
                                    
                                                   

                                     
                            %>
                            <tr>
                                <td><%=rs.getString("id")%></td>
                                <td><%=rs.getString("patient")%></td>     
                                <td><%=rs.getString("filename")%></td>     
 
                                <td> <a href="Req"><font style="color: green">Send</a></font> </td>   
                            </tr>  
                                     
                                     
                                     <% // }else{ 
//                                        response.sendRedirect("other.jsp");
                                        
   %>   
                                        <%
                                  
                                        }
                                    }
                                }                                    catch (Exception ex) {
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
