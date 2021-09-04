
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
        <script>alert('Login Sucessfully');</script>
        <%
            }
       %>
	<div id="header">
		<center><h1>Lightweight and Privacy-Preserving Medical Services Access for Healthcare Cloud </h1></center>
		<ul>
			<li class="selected">
				<a href="ts_home.jsp">TS Home</a>
			</li>
			<li>
				<a href="time_t.jsp">Time Seal</a>
			</li>
			<li>
				<a href="logout.jsp">Logout</a>
			</li>
		</ul>
	</div>
	<div id="body">
		<div class="content"><br><br><br><br><br>
                   
                    <img src="images/cl1.jpg" style="height: 320px; width: 920px" alt="">
			
                        
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
