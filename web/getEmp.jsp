
<%@page import="com.sun.xml.ws.util.StringUtils"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<jsp:include page="header.jsp"/>
<jsp:include page="empDet.jsp"/>
<%
String n=request.getParameter("Name");
Class.forName("com.mysql.jdbc.Driver");
         Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel","root","" ); 
         String sql,sql1;
         sql1="SELECT * FROM employee WHERE Name LIKE ?;";
         PreparedStatement ps=con.prepareStatement(sql1);
         ps.setString(1, n);
         ResultSet rs=ps.executeQuery();
         String id,name,dob,email,phone1,phone2,joinDt,Qual,Dest,Sal;
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
         %>
         <br><br>
         <div style="
              margin-left: 200px;
              margin-top: 50px;
              //background: blanchedalmond;
              width: 600px;
              ">
             <style>
                 td{
                     padding: 10px;
                     font-size: large;
                 }
             </style>
             <h1>Employee Details</h1>
             <hr>
             <br>
             
             <table style="border-collapse:collapse; padding: 20px;">
                 <h4>
                 <tr>
                     <td>Name: </td>
                     <td ><% out.print(name);
                     %></td>
                 </tr>
                 <tr>
                     <td>Employee Id: </td>
                     <td ><% out.print(id);
                     %></td>
                 </tr>
                 <tr>
                     <td>DOB: </td>
                     <td ><% out.print(dob);
                     %></td>
                 </tr>
                 <tr>
                     <tr>
                     <td>Email: </td>
                     <td ><% out.print(email);
                     %></td>
                 </tr>
                     <td>Phone 1: </td>
                     <td ><% out.print(phone1);
                     %></td>
                 </tr>
                 <tr>
                     <td>Phone 2: </td>
                     <td ><% out.print(phone2);
                     %></td>
                 </tr>
                 <tr>
                     <td>Join Date: </td>
                     <td ><% out.print(joinDt);
                     %></td>
                 </tr>
                 <tr>
                     <td>Qualification: </td>
                     <td ><% out.print(Qual);
                     %></td>
                 </tr>
                 <tr>
                     <td>Designation: </td>
                     <td ><% out.print(Dest);
                     %></td>
                 </tr>
                 <tr>
                     <td>Salary: </td>
                     <td ><% out.print(Sal);
                     %></td>
                 </tr>
                 </h4>  
             </table>
             
         </div>
         <%
         }
         if(count==0){
         out.print("<script>alert('No record Found! Please try again!!'); </script>");
         }
         
%>
