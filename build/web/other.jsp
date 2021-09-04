

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
        <script>alert('Registration Sucessfully');</script>
        <%
            }
            if (request.getParameter("msgg") != null) {
        %>
        <script>alert('Registration Failed');</script>
        <%
            }
        %>
	<div id="header">
		<center><h1>Lightweight and Privacy-Preserving Medical Services Access for Healthcare Cloud </h1></center>
		<ul>
			
			<li class="selected">
				<a href="search_patient.jsp">Back</a>
			</li>
		</ul>
	</div>
	<div id="body">
		<div class="content">
                    <img src="images/reg.jpg" style="height: 320px; width: 920px" alt="">
			<!-- start body---->
   <br></br><br></br>
                            <label style="margin-left: 10px;font-size: 18px;color: red">Your search did not match any Patient Name.</label><br />
                            <label style="margin-left: 10px;font-size: 18px;color: #0000cc"></label><br />
                            <ul style="margin-left: 350px;font-size: 18px;color: #0000cc"><br />
                                <li>Suggestions:</li><br>
                                     <li>Enter the Existing Patient Name</li>
                                
                            </ul>
                               <br></br><br></br><br></br><br></br><br></br><br></br>
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