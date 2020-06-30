
<%@page import="java.time.LocalDate"%>
<%@page import="com.sun.xml.ws.util.StringUtils"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<jsp:include page="header.jsp"/>
<jsp:include page="empDel.jsp"/>
<%
String n=request.getParameter("Name");
Class.forName("com.mysql.jdbc.Driver");
         Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel","root","" ); 
         String sql,sql1,sql3;
         
         sql1="SELECT * FROM employee WHERE Name LIKE ?;";
         PreparedStatement ps=con.prepareStatement(sql1);
         ps.setString(1, n);
         ResultSet rs=ps.executeQuery();
         String id="",name="",dob="",email="",phone1="",phone2="",joinDt="",Qual="",Dest="",Sal="";
         int count=0;
         while(rs.next()){
         count= count+1;
         id=rs.getString(1);
         name=rs.getString(2);
         dob=rs.getString(3);
         email=rs.getString(9);
         phone1=rs.getString(4);
         phone2=rs.getString(5);
         joinDt=rs.getString(6);
         Qual=rs.getString(7);
         Dest=rs.getString(8);
         Sal=rs.getString(10);
         }
         if(count==0){
         out.print("<script>alert('No Record Found!! Please try Again!!'); </script>");
         }
         else{
         
         String dat;
         LocalDate today = LocalDate.now();
         dat=today.toString();
         //out.print(dat);
         int id1=Integer.parseInt(id);
         float sa1=Float.parseFloat(Sal);
         sql3 = "INSERT INTO pastemployee(empId,name,dob,phone1,phone2,joinDate,qual,post,email,salary,leftOn) VALUES (?,?,?,?,?,?,?,?,?,?,?);";
         PreparedStatement ps1 =(PreparedStatement) con.prepareStatement(sql3);
         ps1.setInt(1, id1);
         ps1.setString(2, name); 
         ps1.setString(3, dob); 
         ps1.setString(4, phone1); 
         ps1.setString(5, phone2); 
         ps1.setString(6, joinDt); 
         ps1.setString(7,  Qual); 
         ps1.setString(8,Dest ); 
         ps1.setString(9,email);
         ps1.setFloat(10, sa1);
         ps1.setString(11, dat);
 
         int n2=ps1.executeUpdate();
         sql1="delete FROM employee WHERE Name LIKE ?;";
         PreparedStatement ps2=con.prepareStatement(sql1);
         ps2.setString(1, n);
         int n1=ps2.executeUpdate();
         if(n1>=0){
             out.print("<script>alert('Record Deleted Successfully!!'); </script>");
         }
         
         }
         
%>
