

<%@page import="Dbcon.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="network.download"%>
<!DOCTYPE HTML>
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
<!--			<li>
				<a href="user_home.jsp">User Home</a>
			</li>
			<li>
				<a href="search_patient.jsp">Search Patient Details</a>
			</li>
			<li>
				<a href="search_down.jsp">Download Medical Records</a>
			</li>-->
                        <li>
				<a href="down.jsp">Back</a>
			</li>
		</ul>
	</div>
	<div id="body">
	<img src="images/down8.jpg" style="height: 320px; width: 1020px" alt="">
        <center><h2>Download Patient Details</h2>
		 
            <!-- start body---->
   <!-- /.container -->
          <%
                        String search = session.getAttribute("thesecret").toString();
                        
                        System.out.println("get the search"+search);
                        session.setAttribute("search", search);
                    %>

        <div class="container">
            <div class="row">
                <div class="box" style="height: 400px;">
                    <!--To do you work-->
                    <!--<div style="border: 1px solid white;height: 350px;border-top-width: 20px;border-bottom-width: 10px">-->
                       
                        <table border="1" style="text-align: center;margin-left: 0px">
                            <tr>
                                <th style="text-align: center;width: 70px;">PID</th>
                                <th style="text-align: center;width: 70px;">Name</th>
                                <th style="text-align: center;width: 100px;">Age</th>

                                <th style="text-align: center; width: 100px;">Download</th>
                            </tr>
                            <tr>
                               <%int fid=0;
                                Connection con = null;
                                Statement st = null;
                                ResultSet rs = null;
                                String role=session.getAttribute("role").toString();
                                System.out.println("role is"+role);
                                try {
                                    con = DbConnection.getConnection();
                                    st = con.createStatement();
                                    rs = st.executeQuery("select * from upload2 where sceret_key ='" + search + "'");
                                    if (rs.next()) {
                               
                                      		do{	
                                      
                            %>
                                <td><%=rs.getString("id")%></td>
                                <td><%=rs.getString("patient")%></td>     
                                <td><%=rs.getString("filename")%></td>     

                                <td> <a href="download?id=<%=rs.getString("id")%>&role=<%=role%>&fname=<%=rs.getString("filename")%>&skey=<%=search%>"><font style="color: green">Download</a></font> </td>   
                                        <tr />
                                     
                               <% }while (rs.next());%>
                                     
                                     <% }else{ 
                                        response.sendRedirect("other1.jsp");
                                        
   %>   
                                        <%
                                  
                                        }
                                    } catch (Exception ex) {
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