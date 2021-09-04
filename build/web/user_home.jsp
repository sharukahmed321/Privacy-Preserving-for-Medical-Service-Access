

<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title>Medical Data Sharing</title>
	<link rel="stylesheet" href="css/regi.css" type="text/css">
</head>
<body>
    <%
    
    if(request.getParameter("status")!=null)
           {
        out.println("<script>alert('update is success full')</script>");
}
    if(request.getParameter("statuses")!=null)
           {
        out.println("<script>alert('you are not having update rights')</script>");
}
%>
<%
if(request.getParameter("msgg12")!=null)
{
    out.println("<script>alert('medical report is already closed')</script>");
}

%>
               <%
            if (request.getParameter("msg") != null) {
        %>
        <script>alert('Login Sucessfully');</script>
        <%
            }
       %>
	<div id="header">
		<center><h1>Lightweight and Privacy-Preserving Medical Services Access for Healthcare Cloud </h1></center>
		<ul>
			<li class="selected">
				<a href="user_home.jsp">user Home</a>
			</li>
			<li>
				<a href="search_patient.jsp">Search Patient Details</a>
			</li>
			<li>
				<a href="down.jsp">Download Medical Records</a>
			</li>
                        <li>
				<a href="logout.jsp">Logout</a>
			</li>
		</ul>
	</div>
	<div id="body">
		<div class="content"><br><br><br>
                    <img src="images/u12.jpg" style="height: 400px; width: 920px" alt="">
			
                        
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