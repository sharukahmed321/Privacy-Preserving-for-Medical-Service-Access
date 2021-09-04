<%-- 
    Document   : file_de
    Created on : Jun 2, 2016, 6:41:23 PM
    Author     : Mindsoft
--%>

<!DOCTYPE HTML>
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
                <%
           if (request.getParameter("msg") != null) {
        %>
        <script>alert('File Re-Encrypted Successfully');</script>
        <%
            }
        %>
	<div id="header">
		<center><h1>Lightweight and Privacy-Preserving Medical Services Access for Healthcare Cloud </h1></center>
		<ul>
			<li>
				<a href="ps.jsp">Proxy server Home</a>
			</li>
			<li class="selected">
				<a href="file_de.jsp">Re_Encryption</a>
			</li>
			<li>
				<a href="logout.jsp">Logout</a>
			</li>
		</ul>
	</div>
	<div id="body">
		<!-- start body---->
   <!-- /.container -->
 

        <div class="container">
            <div class="row">
                <div class="box" style="height: 400px;">
                    <!--To do you work-->
<!--                    <div style="border: 1px solid white;height: 350px;border-top-width: 20px;border-bottom-width: 10px">-->
                        <center><h3>Medical Reports Details</h3></center><br />
                        <table border="1" style="text-align: center;margin-left: 40px">
                            <tr>
                                <th style="text-align: center;width: 30px;">ID</th>
                                <th style="text-align: center;width: 70px;">Owner Name</th>
                                <th style="text-align: center;width: 100px;">Patient Name</th>
                                <th style="text-align: center;width: 300px;">File Name</th>
                                <th style="text-align: center;width: 120px;">Start Time</th>
                                <th style="text-align: center;width: 100px;">Close Time</th>

                                <th style="text-align: center">File Re-encryption</th>

                            </tr>
                            <tr>
                                <%
                                    Connection con = null;
                                    Statement st = null;
                                    ResultSet rs = null;
                                    try {
                                        con = DbConnection.getConnection();
                                        st = con.createStatement();
                                        rs = st.executeQuery("select * from upload2");
                                        while(rs.next())
                                            
                                        {%>
                                        <td><%=rs.getString("id")%></td>     
                                        <td><%=rs.getString("owner_name")%></td>     
                                        <td><%=rs.getString("patient")%></td>     
                                        <td><%=rs.getString("filename")%></td>     
                                        <td><%=rs.getString("start_time")%></td>     
                                        <td><%=rs.getString("end_time")%></td>
   
                         <td> <a href="file_de.jsp?msg"><font style="color: green">Re-encrypt</a></font> </td>

                                        <tr />
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

