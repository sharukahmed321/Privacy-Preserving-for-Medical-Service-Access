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
			<li class="selected">
				<a href="index.html">Home</a>
			</li>
			<li>
				<a href="owner.jsp">owner</a>
			</li>
			<li>
				<a href="user.jsp">User</a>
			</li>
<!--			<li>
				<a href="admin.jsp">admin</a>
			</li>
                        <li>
				<a href="pslogin.jsp">Proxy Server</a>
			</li>-->
                         <li>
				<a href="emergency.jsp">Emergency</a>
			</li>
<!--                        <li>
				<a href="ts.jsp">Time Seal</a>
			</li>-->

		</ul>
	</div>
	<div id="section">
<div class="login">&nbsp;&nbsp;<h3>Emergency Login</h3>
                    <form method="get" action="loginaction.jsp">
				<input type="text" placeholder="username" name="uname"><br>
				<input type="password" placeholder="password" name="pass"><br>
				 <input type="hidden" value="11" name="status" /><br>
                                <input type="image" name="imageField" style="" src="images/b.png"/> 
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