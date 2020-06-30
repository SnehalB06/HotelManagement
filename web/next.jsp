<%-- 
    Document   : next
    Created on : 10-Feb-2019, 00:20:51
    Author     : DR SUDHIR BHOLE
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="icon" href="image/favicon.png" type="image/png">
        <title>Royal Hotel</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="vendors/linericon/style.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
        <link rel="stylesheet" href="vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" href="vendors/nice-select/css/nice-select.css">
        <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
        <!-- main css -->
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/responsive.css">
        <link rel="stylesheet" href="css/userBooking.css"
    </head>
    <body>
        <!--================Header Area =================-->
        <header class="header_area">
            <div class="container">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <a class="navbar-brand logo_h" href="index.html"><img src="image/Logo.png" alt=""></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <h5 style="padding:20px;">Welcome</h1>
                    <h5 class="AfterLogin">
                        <%
                        try{
                            HttpSession session1=request.getSession(true);
        
                            String l=session1.getAttribute("UserName").toString();
                            out.print(l);
                        }catch(Exception e){
                        }
                       
                    %>
                    
                                </h5>
                    
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                        <ul class="nav navbar-nav menu_nav ml-auto">
                            <li class="nav-item active"><a class="nav-link" href="index.html">Home</a></li> 
                            <li class="nav-item"><a class="nav-link" href="accomodation.jsp">Accomodation</a></li>
                            <li class="nav-item submenu dropdown">
                                <a href="" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Booking</a>
                                <ul class="dropdown-menu">
                                    <li class="nav-item"><a class="nav-link" href="newBook.jsp">New Booking</a></li>
                                    <li class="nav-item"><a class="nav-link" href="oldBook.jsp">Booking Details</a></li>
                                </ul>
                            </li>
                                                        <li class="nav-item"><a class="nav-link" href="gallery.jsp">Gallery</a></li>
                            <!--<li class="nav-item submenu dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Blog</a>
                                <ul class="dropdown-menu">
                                    <li class="nav-item"><a class="nav-link" href="blog.html">Blog</a></li>
                                    <li class="nav-item"><a class="nav-link" href="blog-single.html">Blog Details</a></li>
                                </ul>
                            </li> -->
                            <li class="nav-item"><a class="nav-link" href="resources.jsp">Resources</a></li>
                           <li class="nav-item"><a class="nav-link" href="hr.jsp">HR</a></li>
                           
                            <li class="nav-item"><a class="nav-link" href="login.jsp">Login /LogOut</a></li>
                            
                            <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
                            
                        </ul>
                    </div> 
                </nav>
            </div>
        </header>
        <!--================Header Area =================-->
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
      
      //out.print("<h1><br><br><br>"+p2+"</h1>");
      int userId[]=new int[10];
      int roomId[]=new int[10];
      int i=0;
      while(p2.next()){
      c=c+1;
      id=p2.getInt("room_id"); 
      u1=p2.getInt("user"); 
      //out.println(" Room id   "+id+"   "+u1);
      userId[i]=u1;
      roomId[i]=id;
      i++;
      String y="yes";
         Class.forName("com.mysql.jdbc.Driver");
         Connection con1=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel","root","" ); 
         String sql2="INSERT INTO `booked`(`userId`, `Name`, `Room Id`, `CheckIn`, `CheckOut`, `adult`, `child`, `old`, `Alloted`, `allotedTo`) VALUES (?,?,?,?,?,?,?,?,?,?)";
         PreparedStatement ps3 =(PreparedStatement) con.prepareStatement(sql2);   
         ps3.setInt(1, u1); 
         ps3.setString(2,l); 
         ps3.setInt(3, id); 
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
          }
      
      
      
          }
 catch(Exception e){
         
         }
 
 %>
</body>

</html>



              