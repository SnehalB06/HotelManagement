
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
        <div style="margin-left: 300px;
    margin-top: 100px;
    width: 800px;"><center><h1>Update Bus Details Here!!!</h1></center>
            </div>
        <div  class="empDetails" style="margin-left: 300px;
    margin-top: 10px;
    border: 2px solid black;
    background-color: gainsboro;
    text-align:center;
    padding: 20px;
    width: 800px;">
            
            <%
                try{
    
    
    HttpSession session1=request.getSession(true);
    HttpSession session4=request.getSession(true);
                       
    String l=session1.getAttribute("UserName").toString();
    String busNo=session1.getAttribute("BusNo").toString();
    String source=session1.getAttribute("source").toString();
    String dest=session1.getAttribute("dest").toString();
        
    //out.print(busNo+source+dest);
                          String m="Admin";
         if(l.equals(m)){
             
         Class.forName("com.mysql.jdbc.Driver");
         Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel","root","" ); 
         
     
    String query="select * from busdetails where busNo=? and source=? and dest=?";
 PreparedStatement p=con.prepareStatement(query);
 p.setString(1, busNo);
 p.setString(2, source);
 p.setString(3, dest);
 
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
            
            <form action="statusUpdate.jsp" method="post">
                
                <div class="row">           
    <label class="col-4" for="bus" name="Name">Bus Name: </label>
        <input class="col-6" name="bus" type="text" required value="<% out.print(bus); %>"><br>
                </div>   
              <div class="row">  
              <label class="col-4" for="source" name="source">Source: </label>
              <input class="col-6" name="source" type="text" required value="<% out.print(source2); %>"><br>
              </div>
              <div class="row">  
              <label class="col-4" for="dest" name="dest">Destination: </label>
              <input class="col-6" name="dest" type="text" required value="<% out.print(dest2); %>"><br>
              </div>
              <div class="row">  
              <label class="col-4" for="departDate: " name="departDate">Departure: </label>
              <input class="col-6" name="departDate" type="dateDate" required value="<% out.print(depart); %>"><br>
              </div>
              <div class="row">  
              <label class="col-4" for="arrivalDate" name="arrivalDate">Arrival: </label>
              <input class="col-6" name="arrivalDate" type="date" required value="<% out.print(arrive);%>"><br>
              </div>
                  
                    <div class="row">
              <label class="col-4" for="departTime: " name="departTime">Departure Time: </label>
              <input class="col-4" name="departTime" type="time" required value="<% out.print(departTime); %>"><br>
                    </div>
                    <div class="row">
              <label class="col-4" for="arrivalTime" name="arrivalTime">Arrival Time: </label>
              <input class="col-4" name="arrivalTime" type="time" required value="<% out.print(arriveTime); %>"><br>
              </div>
              
                
              
              <div class="row">  
              <label class="col-4" for="seat" >No of Seats: </label>
              <input class="col-6" name="seat" type="number"  required value="<% out.print(seat); %>"><br>
              </div>
              <div class="row">  
              <label class="col-4" for="type" >Bus Type: </label>
              <input class="col-6" name="type" type="text"  required value="<% out.print(type); %>"><br>
              </div>
              <div class="row">  
              <label class="col-4" for="BusNo" >Bus Number: </label>
              <input class="col-6" name="BusNo" type="text"  required value="<% out.print(busNo1); %>"><br>
              </div>
              <div class="row">  
              <label class="col-4" for="BusStatus" >Bus Status: </label>
              <input class="col-6" name="BusStatus" type="text"  required value="<% out.print(busStatus);%>"><br>
              </div>
              
                <br><br>
                <input type="submit"  value="Update" style="background: gray;
                            border: 1px solid black;
                            border-radius: 20px;
                            color: white;
                            width:200px;
                            ">
              
            </form>
        </div>
        <%
}}}
         catch(Exception e){
                 }
         %>
   