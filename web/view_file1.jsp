

<!DOCTYPE HTML>
<%@page import="java.util.HashMap"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.AALOAD"%>
<%@page import="java.util.ArrayList"%>
<%@page import="algorithm.Decryption"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Dbcon.DbConnection"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>Medical Data Sharing</title>
	<link rel="stylesheet" href="css/regi.css" type="text/css">
</head>
<body>

	<div id="header">
		<center><h1>Lightweight and Privacy-Preserving Medical Services Access for Healthcare Cloud </h1></center>
		<ul>
			
                        <li>
				<a href="view_file.jsp">Back</a>
			</li>
		</ul>
		</ul>
	</div>
	<div id="body">
		<div class="content">
                    <img src="images/re.jpg" style="height: 320px; width: 920px" alt="">
                    
                 <div id="content">
          <%
//HttpSession user=request.getSession();
//String uname=user.getAttribute("username").toString();   
//String name=user.getAttribute("name").toString();  
  
String id=request.getQueryString();
String fname=null;

Connection con= DbConnection.getConnection();
Statement st=con.createStatement();
ResultSet rt=st.executeQuery("select * from upload2 where id='"+id+"'");
StringBuffer sb=new StringBuffer();
if(rt.next()){
    String fkey=rt.getString("sceret_key");
    fname=rt.getString("filename");
    InputStream is=rt.getAsciiStream("content");
    BufferedReader br=new BufferedReader(new InputStreamReader(is));
    
    String temp=null;
    while((temp=br.readLine())!=null){
            sb.append(temp);
        }
    System.out.println(sb.toString());
    String content=new Decryption().decrypt(sb.toString(),fkey);
  
%>

<h1>Report Of: <font style="color: tomato"> <%=fname%></font></h1><br>
<textarea name="content" style="width: 800px;height: 200px;position: relative;left: 50px;"><%=content%></textarea>
<%
}
%>
<pre>
                                                                      
</pre>
</form>

       
      </div>
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