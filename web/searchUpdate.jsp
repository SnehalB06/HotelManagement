<jsp:include page="header.jsp"/>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<table class="paleBlueRows" cellspacing=20 cellpadding=10 style="margin-top: 100px; margin-left: 150px;">
<thead>
    <tr>
<th>BusId &nbsp;&nbsp;</th>
<th>Name &nbsp;&nbsp;</th>
<th>Source &nbsp;&nbsp;</th>
<th>Destination &nbsp;&nbsp;</th>
<th>DepartureDate &nbsp;&nbsp;</th>
<th>ArrivalDate &nbsp;&nbsp;</th>
<th>DepartureTime &nbsp;&nbsp;</th>
<th>ArrivalTime &nbsp;&nbsp;</th>
<th>BusNo &nbsp;&nbsp;</th>
<th>Seat &nbsp;&nbsp;</th>
<th>Type &nbsp;&nbsp;</th>
<th>Status &nbsp;&nbsp;</th>
</tr>

</thead>

<%
try{
    
    
    HttpSession session1=request.getSession(true);
    HttpSession session4=request.getSession(true);
                      
                           String l=session1.getAttribute("UserName").toString();
                           // out.print(l);
                           String m="Admin";
         if(l.equals(m)){
            String bus1=request.getParameter("BusNumber");
            String source1=request.getParameter("Source");
            String dest1=request.getParameter("dest");
            //out.print(bus1+"   "+source1+" ");
         session1.setAttribute("BusNo", bus1);
         session1.setAttribute("source", source1);
         session1.setAttribute("dest", dest1);
         response.sendRedirect("busStaUpdate.jsp");
         //response.send("statusUpdate.jsp");
                                      
         Class.forName("com.mysql.jdbc.Driver");
         Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel","root","" ); 
         
     
    String query="select * from busdetails where busNo=? and source=? and dest=?";
    PreparedStatement p=con.prepareStatement(query);
 p.setString(1, bus1);
 p.setString(2, source1);
 p.setString(3, dest1);
 
 ResultSet rs=p.executeQuery();
         
         
         int count=0;

         
         while(rs.next()){
            int id=rs.getInt(1);
            String bus=rs.getString(12);
            String source=rs.getString(2);
            String dest=rs.getString(3);
            String depart=rs.getString(4);
            String arrive=rs.getString(5);
            String departTime=rs.getString(6);
            String arriveTime=rs.getString(7); 
            int seat=Integer.parseInt(rs.getString(8));
            String type=rs.getString(9);
            String busNo=rs.getString(10);
            String busStatus=rs.getString(11);
         
            count=count+1;
         
         //+bus+source+dest+depart+arrive+depart+departTime+arriveTime+seat+type+busNo+busStatus);
         
         %>
         <tbody>
        <tr>
         <td><% out.print(id); %></td>
         <td><% out.print(bus); %></td>
         <td><% out.print(source); %></td>
         <td><% out.print(dest); %></td>
         <td><% out.print(depart); %></td>
         <td><% out.print(arrive); %></td>
         <td><% out.print(departTime); %></td>
         <td><% out.print(arriveTime); %></td>
         <td><% out.print(busNo); %></td>
         <td><% out.print(seat); %></td>
         <td><% out.print(type); %></td>
         <td><% out.print(busStatus); %></td>
        </tr>
         <br>


         <%
         
         }
         if(count==0){
              %>
         
         <jsp:forward page="DisplayRoute.jsp"/>
         <%
             
         }
}
         
}
catch(Exception e){
}
         
         %>
       
   </tbody>
</table>  
         <%

%>

              
         <form action="busStaUpdate.jsp" method="post" style="margin-left:550px;">
             <br><br>
             <input type="submit" value="Update" style="background: gray;
                            border: 1px solid black;
                            border-radius: 20px;
                            color: white;
                            width:200px;
                            height: 50px;
                            ">
              
            </form>
     