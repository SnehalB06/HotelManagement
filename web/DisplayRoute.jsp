<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<jsp:include page="header.jsp"/>
<img src="image/bus.jpg" height=400px width=900px style="margin-left: 250px;">

<div style="margin-top: 10px;margin-left: 200px;">
<form method="post" action="searchUpdate.jsp" method="post">
    <div class="rows">
        <label class="col-2" for="BusNumber" style="font-size: Large;">BusNumber:</label>
        <input class="col-8" type="text" name="BusNumber">
    </div>
    <div class="rows">
        <label class="col-2" for="Source" style="font-size: Large;">Source:</label>
        <input class="col-2" type="text" name="Source">
        <label class="col-2" for="dest" style="font-size: Large;">Destination:</label>
        <input class="col-2" type="text" name="dest">
     <input class="col-2" type="submit" value="Search Bus" style="background-color: #24f1ac;
    border-radius: 20px;
    width: 300px;
    height: 50px;
    font-size: large;
  ">
    </div>
     

<style>
    table {
        margin-left: -100px;
    }
    
  table.blueTable {
  border: 1px solid #1C6EA4;
  background-color: #EEEEEE;
  width: 100%;
  text-align: left;
  border-collapse: collapse;
}
table.blueTable td, table.blueTable th {
  border: 1px solid #AAAAAA;
  padding: 3px 2px;
}
table.blueTable tbody td {
  font-size: 13px;
}
table.blueTable tr:nth-child(even) {
  background: #D0E4F5;
}
table.blueTable thead {
  background: #1C6EA4;
  background: -moz-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
  background: -webkit-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
  background: linear-gradient(to bottom, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
  border-bottom: 2px solid #444444;
}
table.blueTable thead th {
  font-size: 15px;
  font-weight: bold;
  color: #FFFFFF;
  border-left: 2px solid #D0E4F5;
}
table.blueTable thead th:first-child {
  border-left: none;
}

table.blueTable tfoot {
  font-size: 14px;
  font-weight: bold;
  color: #FFFFFF;
  background: #D0E4F5;
  background: -moz-linear-gradient(top, #dcebf7 0%, #d4e6f6 66%, #D0E4F5 100%);
  background: -webkit-linear-gradient(top, #dcebf7 0%, #d4e6f6 66%, #D0E4F5 100%);
  background: linear-gradient(to bottom, #dcebf7 0%, #d4e6f6 66%, #D0E4F5 100%);
  border-top: 2px solid #444444;
}
table.blueTable tfoot td {
  font-size: 14px;
}
table.blueTable tfoot .links {
  text-align: right;
}
table.blueTable tfoot .links a{
  display: inline-block;
  background: #1C6EA4;
  color: #FFFFFF;
  padding: 2px 8px;
  border-radius: 5px;
}
</style>
<br>
<table class="paleBlueRows" cellspacing=20 cellpadding=10>
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
                       
                           String l=session1.getAttribute("UserName").toString();
                            
                           // out.print(l);
                           String m="Admin";
         if(l.equals(m)){
         Class.forName("com.mysql.jdbc.Driver");
         Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel","root","" ); 
         String sql,sql1;
         sql1="SELECT * FROM busdetails limit 10;";
         Statement st=con.createStatement();
         ResultSet rs=st.executeQuery(sql1);
   
         int count=1;

         
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
         count=count+1;
         }
}
         
}
catch(Exception e){
}
         
         %>
   </tbody>
</table>      