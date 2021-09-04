<%-- 
    Document   : down
    Created on : Jun 3, 2016, 7:12:44 PM
    Author     : Mindsoft
--%>

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
           
        %>
	<div id="header">
		<center><h1>Lightweight and Privacy-Preserving Medical Services Access for Healthcare Cloud </h1></center>
		<ul>
			
                        <li>
				<a href="logout.jsp">Logout</a>
			</li>
		</ul>
	</div>
	<div id="body">
	<img src="images/d6.jpg" style="height: 320px; width: 1020px" alt="">
        <center><h2>Download Patient Details</h2>
		  <form method="get" action="edow">
            <label for="firstName"> <span>Enter Secret Key*</span>
                <input type="password" name="secret" required="" placeholder="Give Secret Key" id="firstName">
            </label><br><br>
            <input type="hidden" value="14" name="status" />
          
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


