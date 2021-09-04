

<%@page import="algorithm.Decryption"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Dbcon.DbConnection"%>
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
//           String role=session.getAttribute("role").toString();
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
        <center><h2>Download/Update Patient Details</h2>
            <%
             String plainText=null;
                                String getCipher=null;
                                String fid=null;
                                String fname=null;
                                String own=null;
                               Connection  con = DbConnection.getConnection();
       Statement st = con.createStatement();
       String role=session.getAttribute("role").toString();
       String skey=session.getAttribute("secret").toString();
       String esrole=request.getParameter("roll");
         String  uname=(String)session.getAttribute("ssuname");
       System.out.println("uname from download------------"+uname);
       if(esrole.equalsIgnoreCase("doctor"))
                     {
       ResultSet rs = st.executeQuery("select * from upload2 where sceret_key ='" + skey + "'");
                                    if (rs.next()) {
                                        fid=rs.getString("id");
                                        fname=rs.getString("filename");
                                        session.setAttribute("fname", fname);
                                        System.out.println("file nameeeeee"+fname);
                                        own=rs.getString("owner_name");
                                        System.out.println("role issssssssssssss"+role);
           String s2=(rs.getString("content"));
                    String content=new Decryption().decrypt(s2,skey);
                    %>
                                 
		  <form method="post" action="update">
            
               <textarea name="gets" style="width: 500px;height: 500px;"> <%=content%></textarea>
                                    <input type="hidden" name="skey" value="<%=skey%>"/>
                                     <input type="hidden" name="fname" value="<%=fname%>"/>
                                     <input type="hidden" name="own" value="<%=own%>"/>
                                    <input type="submit" value="Update And Save"/>
                  </form></center>
                                    <a href="download?id=<%=rs.getString("id")%>&role=<%=role%>&fname=<%=rs.getString("filename")%>&skey=<%=skey%>"><font style="color: green">Download</a></font> </td>   
                                  <%     }
             }else
              {
            ResultSet rs = st.executeQuery("select * from upload2 where sceret_key ='" + skey + "'");
                   if (rs.next()) {
                                        fid=rs.getString("id");
                                        fname=rs.getString("filename");
                                        session.setAttribute("fname", fname);
                                        System.out.println("file nameeeeee"+fname);
                                        own=rs.getString("owner_name");
                                        System.out.println("role issssssssssssss"+role);
                                        String s2=(rs.getString("comoinfo"));
                   // String content=new Decryption().decrypt(s2,skey);
                 //   System.out
                    %>
                                 
		  <form method="post" action="update">
            
               <textarea name="gets" style="width: 500px;height: 500px;"> <%=s2%></textarea>
                                    <input type="hidden" name="skey" value="<%=skey%>"/>
                                     <input type="hidden" name="fname" value="<%=fname%>"/>
                                     <input type="hidden" name="own" value="<%=own%>"/>
                                    <input type="submit" value="Update And Save"/>
                  </form></center>
                                    <a href="download?id=<%=rs.getString("id")%>&role=<%=role%>&fname=<%=rs.getString("filename")%>&skey=<%=skey%>"><font style="color: green">Download</a></font> </td>   
                                  <%     }
           
             }
            %>
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


