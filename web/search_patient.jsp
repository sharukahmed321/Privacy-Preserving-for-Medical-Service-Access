

<!DOCTYPE HTML>
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
        <script>alert('Request Sent Successfully');</script>
        <%
            }
        %>
                    <%
           if (request.getParameter("message") != null) {
        %>
        <script>alert('Request Sent Filed');</script>
        <%
            }
        %>
                   <%
           if (request.getParameter("msggg") != null) {
        %>
        <script>alert('This Medical Report Already closed');</script>
        <%
            }
        %>
	<div id="header">
		<center><h1>Lightweight and Privacy-Preserving Medical Services Access for Healthcare Cloud </h1></center>
		<ul>
			<li>
				<a href="user_home.jsp">user Home</a>
			</li>
			<li class="selected">
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
	<img src="images/ser.jpg" style="height: 320px; width: 1020px" alt="">
        <center><h2>Search Patient Details</h2>
		  <form method="get" action="searchp1.jsp">
            <label for="firstName"> <span>Enter Keywords</span>
                <input type="text" name="search" required="" placeholder="Patient Name" id="firstName">
            </label><br><br>
            <input name="button_search" src="images/serb.gif" class="button_search" type="image" />
                  </form></center>
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

