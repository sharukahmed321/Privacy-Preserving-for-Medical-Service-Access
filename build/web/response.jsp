<%@page import="java.sql.Statement"%>
<%@page import="Dbcon.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title>Medical Data Sharing</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>

    
	<div id="header">
            <center><h1>Lightweight and Privacy-Preserving Medical Services Access for Healthcare Cloud </h1></center>
		<ul>
                    <li >
				<a href="edow.jsp">Home</a>
			</li>
                    <li class="selected">
				<a href="response.jsp">Response</a>
			</li>
			
			<li >
				<a href="logout.jsp">Logout</a>
			</li>
			
<!--                        <li>
				<a href="ts.jsp">Time Seal</a>
			</li>-->

		</ul>
	</div>
	<div class="container">
            <div class="row">
                <div class="box" style="height: 400px;">
                    <!--To do you work-->
<!--                    <div style="border: 1px solid white;height: 350px;border-top-width: 20px;border-bottom-width: 10px">-->
                        <center><h3>User Request</h3></center><br />
                        <table border="1" style="text-align: center;margin-left: 40px">
                            <tr>
<!--                                <th style="text-align: center;width: 30px;">User ID</th>-->
<!--                               <th style="text-align: center;width: 120px;">User Name</th>-->
                 
                                
                                <th style="text-align: center;width: 120px;">Patient Name</th>
                                <th style="text-align: center;width: 120px;">File Name</th>
                          
                                <th style="text-align: center">Action</th>

                            </tr>
                            <tr>
                                <%
                                    Connection con = null;
                                    Statement st = null;
                                    ResultSet rs = null;
                                   // String temail=session.getAttribute("temail").toString();
                                    //String pname=session.getAttribute("pname").toString();
                                    try {
                                        con = DbConnection.getConnection();
                                        st = con.createStatement();
                                        rs = st.executeQuery("select * from erequest where status='yes'");
                                        if(rs.next())
                                            
                                        {
            
            System.out.println("fname====="+rs.getString("fname"));
            session.setAttribute("fname", rs.getString("fname"));
            %>
                                        
                                        <td><%=rs.getString("pname")%></td>     
                                        <td><%=rs.getString("fname")%></td>     
                                          
                                     
   
                         <td> <a href="everify1.jsp?pname=<%=rs.getString("pname")%>&fname<%=rs.getString("fname")%>"><font style="color: green">Download</a></font> </td>

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
	<div id="featured">
            <div style="font: 24px; color: black">
			
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