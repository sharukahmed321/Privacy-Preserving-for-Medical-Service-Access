

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
            if (request.getParameter("Msgac") != null) {
        %>
        <script>alert('Activated Succesfully');</script>
        <%
            }
        %>
            <%
            if (request.getParameter("Msgde") != null) {
        %>
        <script>alert('Deactivated Succesfully');</script>
        <%
            }
        %>
	<div id="header">
		<center><h1>Lightweight and Privacy-Preserving Medical Services Access for Healthcare Cloud </h1></center>
		<ul>
<!--			<li>
				<a href="admin_home.jsp">Home</a>
			</li>-->
			<li class="selected">
				<a href="owner_de.jsp">owner & User Details</a>
			</li>
<!--			<li>
				<a href="user_de.jsp">User request</a>
			</li>-->
			<li>
				<a href="down_de.jsp">Download</a>
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
                        <center><h3>Owner And User Details</h3></center><br />
                        <table border="1" style="text-align: center;margin-left: 0px">
                            <tr>
                                <th style="text-align: center;width: 30px;">User ID</th>
                                <th style="text-align: center;width: 300px;">Email</th>
                                <th style="text-align: center;width: 120px;">User Name</th>
                                <th style="text-align: center;width: 100px;">DOB</th>
                                <th style="text-align: center;width: 100px;">Role</th>
                                <th style="text-align: center;width: 100px;">State</th>
                                <th style="text-align: center;width: 100px;">Country</th>
                                <th style="text-align: center">Activate</th>
                                 <th style="text-align: center">Deactivate</th>
                            </tr>
                            <tr>
                                <%
                                    Connection con = null;
                                    Statement st = null;
                                    ResultSet rs = null;
                                    try {
                                        con = DbConnection.getConnection();
                                        st = con.createStatement();
                                        rs = st.executeQuery("select * from reg");
                                        while(rs.next())
                                            
                                        {%>
                                        <td><%=rs.getString("id")%></td>     
                                        <td><%=rs.getString("email")%></td>     
                                        <td><%=rs.getString("uname")%></td>     
                                        <td><%=rs.getString("dob")%></td>
                                        <td><%=rs.getString("role")%></td>
                                        <td><%=rs.getString("state")%></td>    
                                        <td><%=rs.getString("country")%></td>    
                         <td> <a href="o_mail.jsp?<%=rs.getString("id")%>"><font style="color: green">Activate</a></font> </td>
                        <td> <a href="o_de_activate.jsp?<%=rs.getString("id")%>"><font style="color: red">Deactivate</a></font> </td> 
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
