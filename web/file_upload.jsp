

<!DOCTYPE HTML>
<%@page import="network.upload"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>Medical Data Sharing</title>
	<link rel="stylesheet" href="css/regi.css" type="text/css">
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
	<div id="header">
		<center><h1>Lightweight and Privacy-Preserving Medical Services Access for Healthcare Cloud </h1></center>
		<ul>
			<li>
				<a href="owner_home.jsp">owner Home</a>
			</li>
			<li class="selected">
				<a href="file_upload.jsp">file Upload</a>
			</li>
			<li>
				<a href="view_file.jsp">View File</a>
			</li>
                        <li>
				<a href="logout.jsp">Logout</a>
			</li>
		</ul>
	</div>
	<div id="body">
		<div class="content">
                    <img src="images/up4.jpg" style="height: 320px; width: 920px" alt="">
			<h2>Medical Record Upload Here!!</h2>
                        <form action="Upload1" method="post" enctype="multipart/form-data">
                                <label for="pname"> <span>Patient Name</span>
                                    <input type="text" name="pname" placeholder="Enter Patient Name" required="" id="firstName">
				</label>
				<label for="file"> <span>EHR</span>
                                    <input type="file" name="file" placeholder="file" required="" id="firstName">
				</label>
			
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