

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
                       <form action="kupdate.jsp" name="ff"  method="get" onsubmit="return check()">
             
             <%
             String fname = session.getAttribute("fname").toString();
             String extractedkey=session.getAttribute("exkey").toString();
             System.out.println("this is fname " + fname);
             %>
             <input type="hidden" name="key" value="<%=fname%>">
                    Title: <br><input type="text" name="tit" id="name" style="background: #00ccff; height: 28px;  width:250px;"><br><br>
                    Keyword: <br><input type="text" name="keyword" value="<%=extractedkey%>" id="user" style="background: #00ccff; height: 28px;  width:250px;"><br><br>
                    Category: <br><input type="text" name="cat" id="pass" style="background: #00ccff; height: 28px;  width:250px;"><br><br>
                  <div style="margin-left: 3px;">  
                      <input type="submit" value="Save !!" style="background-color: green; height: 30px; border: 4px; font-weight: bold;">&nbsp;&nbsp;&nbsp;
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