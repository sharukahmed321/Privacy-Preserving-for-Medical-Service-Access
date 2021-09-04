

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

	<div id="header">
		<center><h1>Lightweight and Privacy-Preserving Medical Services Access for Healthcare Cloud </h1></center>
		<ul>
			<li>
				<a href="owner_home.jsp">owner Home</a>
			</li>
			<li>
				<a href="file_upload.jsp">File Upload</a>
			</li>
			<li class="selected">
				<a href="view_file.jsp">View file</a>
			</li>
                        <li>
				<a href="logout.jsp">Logout</a>
			</li>
		</ul>
		</ul>
	</div>
	<div id="body">
		<div class="content">
                    <img src="images/re.jpg" style="height: 320px; width: 920px" alt="">
                    <center><h2>Upload File Details</h2></center>
                        <!-- start body---->
   <!-- /.container -->
 

        <div class="container">
            <div class="row">
                <div class="box" style="height: 400px;">
                    <!--To do you work-->
<!--                    <div style="border: 1px solid white;height: 350px;border-top-width: 20px;border-bottom-width: 10px">-->
                        <center><h3></h3></center><br />
                        <table border="1" style="text-align: center;margin-left: 120px">
                            <tr>
                                <th style="text-align: center;width: 30px;">Patient ID</th>
                                <th style="text-align: center;width: 100px;">Owner Name</th>
                                <th style="text-align: center;width: 100px;">Patient Name</th>
                                <th style="text-align: center;width: 100px;">file Name</th>
                                <th style="text-align: center;width: 100px;">Start Time</th>
                                <th style="text-align: center;width: 100px;">Close Time</th>
                                <th style="text-align: center">View File</th>
                            </tr>
                            <tr>
                                <%
                                    Connection con = null;
                                    Statement st = null;
                                    ResultSet rs = null;
                                    try {
                                        con = DbConnection.getConnection();
                                        st = con.createStatement();
                                         String owner=session.getAttribute("owner_rname").toString();
                                         System.out.println("owner name=========="+owner);
                                        rs = st.executeQuery("select * from upload2 where owner_name='"+owner+"'");
                                        while(rs.next())
                                            
                                        {%>
                                        <td><%=rs.getString("id")%></td>     
                                        <td><%=rs.getString("owner_name")%></td>     
                                        <td><%=rs.getString("patient")%></td>     
                                        <td><%=rs.getString("filename")%></td>     
                                        <td><%=rs.getString("start_time")%></td>     
                                        <td><%=rs.getString("end_time")%></td>
  
                         <td> <a href="view_file1.jsp?<%=rs.getString("id")%>"><font style="color: green">view</a></font> </td>
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