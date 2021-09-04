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
    <% if(request.getParameter("m")!=null)
               {
        out.println("<script>alert('request sended succfully')</script>");
}%>

    
	<div id="header">
            <center><h1>Lightweight and Privacy-Preserving Medical Services Access for Healthcare Cloud </h1></center>
		<ul>
                    <li class="selected">
				<a href="edow.jsp">Home</a>
			</li>
                    <li class="selected">
				<a href="response.jsp">Response</a>
			</li>
			
			<li class="selected">
				<a href="logout.jsp">Logout</a>
			</li>
			
<!--                        <li>
				<a href="ts.jsp">Time Seal</a>
			</li>-->

		</ul>
	</div>
	<div id="section">
<div class="login">&nbsp;&nbsp;<h3>Emergency File Down Load</h3>
                    <form method="get" action="everify.jsp">
				 <table width="50%">
                                                <tr style="height: 40px;"><td>Select File Name:</td>
                                                
                                                    <td>
                                                        <select id="keys" name="fname" onchange="loadXMLDoc()">
                                                            <option value="-1">-Select-</option>

                                                            <%
                                                                String userid=request.getParameter("userid");
                                                                                                                                                                                                              
                                                                
                                                                String date=request.getParameter("date");
                                                                String filename=request.getParameter("filename");
                                                                String sql = "select * from upload2";
                                                                System.out.println(";;;;;;;;;;;;;;;" + sql);
                                                                PreparedStatement pst = null;
                                                                Connection conn = null;
                                                                try {
                                                                    conn = DbConnection.getConnection();
                                                                    pst = conn.prepareStatement(sql);
                                                                    ResultSet rs = pst.executeQuery();
                                                                    while (rs.next()) {%>
                                                                    
                                                                    <option value="<%=rs.getString("filename")%>"><%=rs.getString("filename")%></option>
                                                             
                                                            <%
                                                            System.out.println("filenameeee------"+rs.getString("filename"));
                                                                    }
                                                                } catch (Exception e) {
                                                                    e.printStackTrace();
                                                                }%>
                                                        </select>
                                                     
                                                    </td></tr>
                                                
                                                <tr><td>&nbsp;</td><td><input type="submit" value="Request"/></td></tr>
                                            </table>
                                        </form>	

                   
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