
<%@page import="com.sun.org.apache.xerces.internal.parsers.IntegratedParserConfiguration"%>
<%@page import="Dbcon.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE HTML>
<%@page import="network.upload"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>Medical Data Sharing</title>
	<link rel="stylesheet" href="css/regi.css" type="text/css">
        <script type="text/javascript">
  $(function() {
    $('#datetimepicker1').datetimepicker({
      language: 'pt-BR'
    });
  });
</script>
<script type="text/javascript" src="js/datetimepicker.js"></script>
</head>
<body>
               <%
            if (request.getParameter("status") != null) {
        %>
        <script>alert('File Upload to Drice HQ');</script>
        <%
            }
            if (request.getParameter("msgg") != null) {
        %>
        <script>alert('File Upload Failed');</script>
        <%
            }
        %>
        
        <%int id=Integer.parseInt(request.getParameter("id"));
        session.setAttribute( "theNamessss", id );
%>
	<div id="header">
		<center><h1>Lightweight and Privacy-Preserving Medical Services Access for Healthcare Cloud </h1></center>
		<ul>
<!--			<li>
				<a href="owner_home.jsp">owner Home</a>
			</li>
			<li class="selected">
				<a href="file_upload.jsp">file Upload</a>
			</li>
			<li>
				<a href="view_file.jsp">View File</a>
			</li>-->
                        <li>
				<a href="time_t.jsp">Back</a>
			</li>
		</ul>
	</div>
	<div id="body">
		<div class="content">
                    <img src="images/cl1.jpg" style="height: 320px; width: 920px" alt="">
			<h2>Medical Record Time Set!!</h2>
                        <form action="set_update.jsp" method="get">
                               <label for="uname"><span>Select User</span>
                             <select name="usr">
                               
                                            <option value="-1">-Select-</option>
                            <% Connection con = null;
                                    Statement st = null;
                                    ResultSet rs = null;
                                    try {
                                        con = DbConnection.getConnection();
                                        st = con.createStatement();
                                        String fname=request.getParameter("fname");
                                        session.setAttribute("fname", fname);
                                        rs = st.executeQuery("select * from reg where role='doctor' OR role='nurse' OR role='insurance'");
                                        while(rs.next())
                                            
                                        {%>
                                         <option value="<%=rs.getString("uname")%>"><%=rs.getString("uname")%></option>
                                       <%}
                                            } catch (Exception e) {
                                            }%>
                                    </select></label>
                                <label for="sdate"> <span>Starting Date</span>
                                   <input id="demo2" type="text" name="sdate" size="25"><a href="javascript:NewCal('demo2','ddmmmyyyy',true,24)"><img src="images/cal.gif" width="16" height="16" border="0" alt="Pick a date"></a>
     <!--<img src="images/cal.gif" onclick="javascript:NewCssCal ('demo1','MMddyyyy','dropdown',true,'12',true)" name="sdate" style="cursor:pointer"/>-->
                                    <!--<input type="datetime" name="sdate" placeholder="Enter Patient Name" required="" id="firstName">-->
				</label>
				<label for="cdate"> <span>Closing Data</span>
                                    <input id="demo3" type="text" name="cdate" size="25"><a href="javascript:NewCal('demo3','ddmmmyyyy',true,24)"><img src="images/cal.gif" width="16" height="16" border="0" alt="Pick a date"></a>
     <!--<img src="images/cal.gif" onclick="javascript:NewCssCal ('demo2','MMddyyyy','dropdown',true,'12',true)" name="cdate" style="cursor:pointer"/>-->
                                    <!--<input type="datetime" name="cdate" placeholder="cdate" required="" id="firstName">-->
				</label>
			
                            
				<input type="submit" value="" id="submit">
			</form>
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