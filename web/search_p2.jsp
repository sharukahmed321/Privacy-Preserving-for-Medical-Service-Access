

<%@page import="java.sql.Blob"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.StringTokenizer"%>
<!DOCTYPE HTML>
<%@page import="network.Req"%>
<%@page import="Dbcon.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
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
				<a href="user_home.jsp">User Home</a>
			</li>
			<li class="selected">
				<a href="search_patient.jsp">Search Patient Details</a>
			</li>
			<li>
				<a href="search_down.jsp">Download Medical Records</a>
			</li>
                        <li>
				<a href="logout.jsp">Logout</a>
			</li>
		</ul>
	</div>
	<div id="body">
	<img src="images/sear5.jpg" style="height: 320px; width: 1020px" alt="">
        <center><h2>Search Patient Details</h2>
		  <!-- start body---->
   <!-- /.container -->
          <%
//                        String uname = session.getAttribute("name").toString();
                        String search = request.getParameter("search");
                        
                        System.out.println("get the search"+search);
                        session.setAttribute("search", search);
                    %>

        <div class="container">
            <div class="row">
                <div class="box" style="height: 400px;">
                    <!--To do you work-->
                    <!--<div style="border: 1px solid white;height: 350px;border-top-width: 20px;border-bottom-width: 10px">-->
                        <center><h3></h3></center><br />
                        <table border="1" style="text-align: center;margin-left: 0px">
                            <tr>
                                <th style="text-align: center;width: 70px;">PID</th>
                                <th style="text-align: center;width: 70px;">Patient Name</th>
                                <th style="text-align: center;width: 100px;">File Name</th>

                                <th style="text-align: center; width: 100px;">Request</th>
                            </tr>
                          
                            <%
                            int fid1=0;
                                Connection con1 = null;
                                Statement st1 = null;
                                ResultSet rs1= null;
                                Date d1=new Date();
                                 int retrank1;
                                  String k1;
              String f1;
                                String role1=session.getAttribute("role").toString();
                                System.out.println("current Date is----"+d1.toString());
                                DateFormat df1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String current1 = df1.format(d1);
System.out.println("simple date formateis--------"+current1);
                                try {
                                    con1 = DbConnection.getConnection();
                                    st1 = con1.createStatement();
                                     ResultSet rseslra=st1.executeQuery("select * from upload2");
        while(rseslra.next())
        {
            PreparedStatement pesup=con1.prepareStatement("update upload2 set rank_='0'");
            int exeup=pesup.executeUpdate();
        }
                                     String keyword1=search;
//        StringTokenizer stes= new StringTokenizer(keyword1," ");
        
                                      StringTokenizer str=new StringTokenizer(search, ",");
                                      rs1=st1.executeQuery("select filename,keyword from upload2");
                                       ArrayList tableContentKey = new ArrayList();
        ArrayList fileName = new ArrayList();
        System.out.println("test");
        while(rs1.next()){
            tableContentKey.add(rs1.getString("keyword"));
            fileName.add(rs1.getString("filename"));
                       }
            while(str.hasMoreTokens())
                                    {
                                        String str2=str.nextToken();
                                        System.out.println("Token==="+str2);
        for(int indexValue=0;indexValue<tableContentKey.size();indexValue++){
            System.out.println("size->"+tableContentKey.size());
           
            if(tableContentKey.get(indexValue).toString().contains(str2)){
                st1.execute("insert into cache (FileName) values('"+ fileName.get(indexValue) +"')");
                
               
          
              }
             }                                                            
            }
         ArrayList rankFile = new ArrayList();
        Statement fileCount = con1.createStatement();
        ResultSet RsCount = fileCount.executeQuery("select * from cache");
        
        int x=0;
        while(RsCount.next()){
            System.out.println("x value-"+x);
            rankFile.add(RsCount.getString("FileName"));
        x++;
        }
         System.out.println("\nExample 1 - Count 'a' with frequency"+rankFile.size());
	//System.out.println("a : " + Collections.frequency(rankFile, "EEE.txt"));

	System.out.println("\nExample 2 - Count all with frequency");
	
        HashMap<String,Integer> fileNameWithrank = new HashMap<String, Integer>();
        
        Set<String> uniqueSet = new HashSet <String>(rankFile);
	
        
        for (String temp : uniqueSet) {
		System.out.println(temp + ": " + Collections.frequency(rankFile, temp));
                fileNameWithrank.put(temp, Collections.frequency(rankFile, temp));
	}
      
        Statement cleanSt = con1.createStatement();
        cleanSt.execute("truncate cache");
          ArrayList initialList = new ArrayList<Integer>(fileNameWithrank.values());
        ArrayList initialFileList = new ArrayList<Integer>();
        for (String key : fileNameWithrank.keySet()) {
        System.out.println("key"+key);
            initialFileList.add(key);
        }
       
        System.out.println("initialFileList"+initialFileList.size());
        System.out.println("initialList"+initialList.size());
                
        for(int firstRank=1;firstRank<=initialList.size()-2;firstRank++){
        
            System.out.println("Rank Index values"+initialList.get(firstRank)+"FileName"+initialFileList.get(firstRank));
            System.out.println("Left Index values"+initialList.get(firstRank-1)+"previous FileName"+initialFileList.get(firstRank-1));
            System.out.println("Right Index values"+initialList.get(firstRank+1)+"next FileName"+initialFileList.get(firstRank+1));
        }
      ResultSet rsesam;
      int rank1=0;
      String words1;
      Blob blob1;
      Connection conn1=DbConnection.getConnection();
       Statement esstat1=conn1.createStatement();
        System.out.println("Array list sze=="+initialList.size());
//         dfsstarttime=Calendar.getInstance().get(Calendar.MILLISECOND);
         for(int firstRank=0;firstRank<initialList.size();firstRank++){
             if(!initialList.get(firstRank).toString().equals("0")){
             System.out.println("File name===="+initialFileList.get(firstRank).toString());
                 rsesam=esstat1.executeQuery("select * from upload2 where filename='"+initialFileList.get(firstRank).toString() +"'");
                 System.out.println("rsesam====="+rsesam);
           while(rsesam.next())
                             {
              String fname1=rsesam.getString("filename");
          System.out.println("Fname11======="+fname1);
               blob1 = rsesam.getBlob("content");
                         System.out.println("Fblob======="+blob1.toString());    
           rank1=0;
           byte a1[] = blob1.getBytes(1, (int) blob1.length());
           String str1 = new String(a1, "UTF-8");
           System.out.println("File content======"+str1);
           StringTokenizer tokenq1=new StringTokenizer(keyword1," ");
           while(tokenq1.hasMoreTokens())
                             {
               String query1=tokenq1.nextToken();
               System.out.println("Query==="+query1);   
                StringTokenizer token1=new StringTokenizer(str1," ");                          
           while(token1.hasMoreTokens())
           {
               words1=token1.nextToken();
               System.out.println("Words1++"+words1);
               if((words1.toLowerCase()).equals(query1) || query1.equals(words1.toLowerCase()))
               {
                   rank1++;
               }
               System.out.println("rank1++"+rank1);
           }
                     }
           PreparedStatement pstm=conn1.prepareStatement("update upload2 set rank_=? where filename=?");
           pstm.setInt(1, rank1);
           pstm.setString(2,initialFileList.get(firstRank).toString());
           int ab=pstm.executeUpdate();
           if(ab>0)
            {
               System.out.println("Eswar checking inserting the rank Success");
           }
           else
            {
               System.out.println("Eswar Error in rank Success");
           }
                     }
                                 }
                         }
        
             Date d=new Date();
          System.out.println("current Date is----"+d.toString());
                                DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String current = df.format(d);
System.out.println("simple date formateis--------"+current);
 ResultSet rst1 = st1.executeQuery("select * from upload2");
           while(rst1.next()){
               f1 = rst1.getString("filename");        
//               k1 = rst1.getString("key_");        
           retrank1=rst1.getInt("rank_");
        System.out.println(f1+"\n");
             String start=rst1.getString("start_time");
                                        String entime=rst1.getString("end_time");
                                        System.out.println("entime------"+entime);
//                                                 if(((current.compareTo(start)==0)||current.compareTo(start)>0) &&((current.compareTo(entime)==0)||current.compareTo(entime)<0))
//                                                       {
                                    
                                                    session.setAttribute("SSpatient", rst1.getString("filename"));
                                                    session.setAttribute("SSsecret_key", rst1.getString("sceret_key"));

                                                    session.setAttribute("SSend_time", rst1.getString("end_time"));
            
           %>
          

               
               
          
           
           <%  do{  
//                            %>
  <tr>
                               <td><%=rst1.getString("id")%></td>
                              <td><%=rst1.getString("patient")%></td>     
-->                               <td><%=rst1.getString("filename")%></td>     
// 
//                                <td> <a href="Req?<%=rst1.getString("id")%>"><font style="color: green">Send</a></font> </td>   
//                            </tr>
//                            <!--<!--<!--
//                                     <% }while (rst1.next());%>
//                                     
//                                     <% // }else{ 
//                                        response.sendRedirect("other.jsp");
                                       
  %>   
//                                        <%
//                                  
//                                        }
                                    }
               }
                                
                                catch(Exception e)
                                                                               {
                                    e.printStackTrace();
                                }
                                
                            
                    %>
                               <%
//                               int fid=0;
//                                Connection con = null;
//                                Statement st = null;
//                                ResultSet rs = null;
//                                Date d=new Date();
//                                String role=session.getAttribute("role").toString();
//                                System.out.println("current Date is----"+d.toString());
//                                DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
//String current = df.format(d);
//System.out.println("simple date formateis--------"+current);
//                                try {
//                                    con = DbConnection.getConnection();
//                                    st = con.createStatement();
//                                    StringTokenizer str=new StringTokenizer(search, ",");
//                                    while(str.hasMoreTokens())
//                                    {
//                                        String str2=str.nextToken();
//                                    
//                                   rs = st.executeQuery("select * from upload2 where keyword LIKE '%" + search + "%'");
//
//                                    if (rs.next()) {
////                                        String start=rs.getString("start_time");
////                                        String entime=rs.getString("end_time");
////                                                 if(((current.compareTo(start)==0)||current.compareTo(start)>0) &&((current.compareTo(entime)==0)||current.compareTo(entime)<0))
////                                                       {
//                                    
//                                                    session.setAttribute("SSpatient", rs.getString("filename"));
//                                                    session.setAttribute("SSsecret_key", rs.getString("sceret_key"));
//
//                                                    session.setAttribute("SSend_time", rs.getString("end_time"));
//
//                                    do{  
//                            %>
//                            <!--<!--<!--
//                                     <% // }while (rs.next());%>
//                                     
//                                     <% // }else{ 
//                                        response.sendRedirect("other.jsp");
//                                        
//   %>   
//                                        <%
//                                  
//                                        }
//                                    }
//                                }                                    catch (Exception ex) {
//                                        ex.printStackTrace();
//                                    }
//                                                                       
                                %>

                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.container -->



<!-- end body---->
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
