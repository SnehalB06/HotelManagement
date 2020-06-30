<%-- 
    Document   : newjsp
    Created on : 01-May-2019, 10:27:56
    Author     : DR SUDHIR BHOLE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
<%
                        
                        try{
                            HttpSession session2=request.getSession(true);
                            HttpSession session1=request.getSession(true);
         
                            String l1=session2.getAttribute("c1").toString();
                           String l=session1.getAttribute("UserName").toString();
                            
                           // out.print(l);
            String Roo=request.getParameter("c1");
            String em=request.getParameter("email");
            String name=request.getParameter("User");
            String inC=request.getParameter("Check-in");
            String outC=request.getParameter("Check-out");
            String no=request.getParameter("numRooms");
            String adult=request.getParameter("adults");
            String child=request.getParameter("children");
            String old=request.getParameter("old");
            String addre=request.getParameter("address");
            String city=request.getParameter("city");
            String state=request.getParameter("state");
            String phone=request.getParameter("country");
            String country=request.getParameter("phone");
            
            
           int id=0,u1=0,c=0;
                 
         Class.forName("com.mysql.jdbc.Driver");
         Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel","root","" );  
         String sql1="SELECT * FROM hotelroom WHERE allocationStatus=\"no\" and canBeAlloted=\"yes\" and roomType=? ";
         PreparedStatement ps2 =(PreparedStatement) con.prepareStatement(sql1); 
         ps2.setString(1, l1);    
      com.mysql.jdbc.ResultSet p2 =(com.mysql.jdbc.ResultSet) ps2.executeQuery();
      
      out.print("<h1><br><br><br>"+p2+"</h1>");
     
      int userId[]=new int[10];
      int roomId[]=new int[10];
      int i=0;
      while(p2.next()){
      c=c+1;
      id=p2.getInt("room_id"); 
      u1=p2.getInt("user"); 
      out.println(" in p2.next Room id   "+id+"   "+u1);
      if(i < Integer.parseInt(Roo)){
      userId[i]=u1;
      roomId[i]=id;
      i++;
      }
             }
      for(i=0;i<roomId.length;i++)
          out.print(roomId[i]);
      
      for ( i=0;i<roomId.length ; i++){
      String y="yes";
         Class.forName("com.mysql.jdbc.Driver");
         Connection con1=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel","root","" ); 
         String sql2="INSERT INTO booked(userId, Name, Room Id, CheckIn, CheckOut, adult, child, old, Alloted, allotedTo) VALUES (?,?,?,?,?,?,?,?,?,?)";
        
         PreparedStatement ps3 =(PreparedStatement) con.prepareStatement(sql2);   
         ps3.setInt(1, userId[i]); 
         ps3.setString(2,l); 
         ps3.setInt(3, roomId[i]); 
         ps3.setString(4, inC); 
         ps3.setString(5,outC); 
         ps3.setString(6, adult);
         ps3.setString(7, child);
         ps3.setString(8, old);
         ps3.setString(9, y);
         
         ps3.setString(10,name );
     com.mysql.jdbc.ResultSet p3 =(com.mysql.jdbc.ResultSet) ps3.executeQuery();
     ps3.executeUpdate();
out.print("done");
    //int z=ps3.executeUpdate();
      ps3.close();
      con1.close();
 
     String sql3="Update hotelroom set allocationStatus='yes',checkIn=?,CheckOut=?,canBeAlloted=no,user=? where room_id=?";
     PreparedStatement ps4 =(PreparedStatement) con.prepareStatement(sql3); 
         ps4.setString(1, inC); 
         ps4.setString(2,outC); 
         ps4.setInt(3, userId[i]);
         ps4.setInt(4, roomId[i]); 
     com.mysql.jdbc.ResultSet p4 =(com.mysql.jdbc.ResultSet) ps4.executeQuery();
     ps4.executeUpdate();
     out.print("done");
 ps4.close();
      con1.close();

      }
      
      //out.println("Room id   "+id+"   "+u1+"  "+c);
      
      
                  
      
      
%>    
        <% 
 out.print("<br><br><br><br><h1> "+em+"  "+name+"  in :"+inC+"  "+no+"   ");
            out.print("<br><br><br><br><h1> "+adult+"  "+child+" "+city+" "+state+" "+country+"  ");
            out.print("<br><br><br><br><h1> "+addre+" "+l+"     out: "+outC+"             "+old);
            
 }
      catch(Exception e){
              
              }
          
%>


