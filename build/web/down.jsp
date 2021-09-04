

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
        <script>alert('Secret Key Verified Successfully');</script>
        <%
            }
        %>
                    <%
           if (request.getParameter("msgg") != null) {
        %>
        <script>alert('Sceret Key Not Matched');</script>
        <%
            }
           String role=session.getAttribute("role").toString();
        %>
	<div id="header">
		<center><h1>Lightweight and Privacy-Preserving Medical Services Access for Healthcare Cloud </h1></center>
		<ul>
			<li>
				<a href="user_home.jsp">User Home</a>
			</li>
			<li>
				<a href="search_patient.jsp">Search Patient Details</a>
			</li>
			<li class="selected">
				<a href="down.jsp">Download Medical Records</a>
			</li>
                        <li>
				<a href="logout.jsp">Logout</a>
			</li>
		</ul>
	</div>
	<div id="body">
	<img src="images/d6.jpg" style="height: 320px; width: 1020px" alt="">
        <center><h2>Download Patient Details</h2>
		  <form method="get" action="loginaction.jsp">
            <label for="firstName"> <span>Enter Secret Key*</span>
                <input type="password" name="secret" required="" placeholder="Give Secret Key" id="firstName">
            </label><br><br>
            <input type="hidden" value="4" name="status" />
            <input type="hidden" value="<%=role%>" name="role" />
            <input name="button_search" style="height: 35px; width: 90px" src="images/down7.png" class="button_search" type="image" />
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


