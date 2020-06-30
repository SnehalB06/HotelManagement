
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<jsp:include page="header.jsp"/>

                    <style>
                        .empDetails input{
                            background: transparent;
                            border:0px;
                            border-bottom: 1px solid black;
                            padding: 10px;
                            height: 40px;
                        }
                        .empDetails label{
                            font-size: Large;
                            color: black;
                            padding: 15px;
                        }
                    </style>

        <!--================Header Area =================-->
        <!--<div style="margin-left: 300px;
    margin-top: 100px;
    width: 800px;"><center><h1> Bus Details !!!</h1></center>
            </div>
        <!--<div  class="empDetails" style="margin-left: 300px;
    margin-top: 10px;
    border: 2px solid black;
    background-color: gainsboro;
    text-align:center;
    padding: 20px;
    width: 800px;">-->
            
            <%
                try{
    
    
    HttpSession session1=request.getSession(true);
    HttpSession session4=request.getSession(true);
                       
    String l=session1.getAttribute("UserName").toString();
    String busNo=request.getParameter("BusNumber");
    String source=request.getParameter("Source");
    String dest=request.getParameter("dest");
        
    //out.print(busNo+source+dest);
                          String m="Admin";
        
             
         Class.forName("com.mysql.jdbc.Driver");
         Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel","root","" ); 
         
     
    String query="select * from busdetails where source=? and dest=? ;";
 PreparedStatement p=con.prepareStatement(query);
 //p.setString(1, busNo);
 p.setString(1, source);
 p.setString(2, dest);
 
 ResultSet rs=p.executeQuery();
         
         
         int count=0;

         
         while(rs.next()){
            int id=rs.getInt(1);
            String bus=rs.getString(12);
            String source2=rs.getString(2);
            String dest2=rs.getString(3);
            String depart=rs.getString(4);
            String arrive=rs.getString(5);
            String departTime=rs.getString(6);
            String arriveTime=rs.getString(7); 
            int seat=Integer.parseInt(rs.getString(8));
            String type=rs.getString(9);
            String busNo1=rs.getString(10);
            String busStatus=rs.getString(11);
         
            count=count+1;
         
         //+bus+source+dest+depart+arrive+depart+departTime+arriveTime+seat+type+busNo+busStatus);
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
             <h1>Bus Details</h1>
             <hr>
             <br>
             
             <table style="border-collapse:collapse; padding: 20px;">
                 <h4>
                 <tr>
                     <td>Bus Name: </td>
                     <td ><% out.print(bus);
                     %></td>
                 </tr>
                 <tr>
                     <td>Bus No: </td>
                     <td ><% out.print(busNo);
                     %></td>
                 </tr>
                 
                 <tr>
                     <td>Source: </td>
                     <td ><% out.print(source2);
                     %></td>
                 </tr>
                 <tr>
                     <td>Destination: </td>
                     <td ><% out.print(dest2);
                     %></td>
                 </tr>
                 <tr>
                     <tr>
                     <td>Departure Date: </td>
                     <td ><% out.print(depart);
                     %></td>
                 </tr>
                     <td>Arrival Date: </td>
                     <td ><% out.print(arrive);
                     %></td>
                 </tr>
                 <tr>
                     <td>Departure Time: </td>
                     <td ><% out.print(departTime);
                     %></td>
                 </tr>
                 <tr>
                     <td>Arrival Time: </td>
                     <td ><% out.print(arriveTime);
                     %></td>
                 </tr>
                 <tr>
                     <td>Type: </td>
                     <td ><% out.print(type);
                     %></td>
                 </tr>
                 <tr>
                     <td>Bus Status: </td>
                     <td ><% out.print(busStatus);
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

             
            <%
}
         catch(Exception e){
                 }
         %>
   