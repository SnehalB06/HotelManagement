<%-- 
    Document   : newBook
    Created on : 09-Feb-2019, 12:32:00
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
                            HttpSession session1=request.getSession(true);
                            String l=session1.getAttribute("UserName").toString();
                            Class.forName("com.mysql.jdbc.Driver");
         Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel","root","" ); 
         String sql;
               sql = "SELECT * From signup where UserName= ? ;"; 
         PreparedStatement ps =(PreparedStatement) con.prepareStatement(sql); 
         ps.setString(1, l); 
         
      com.mysql.jdbc.ResultSet p =(com.mysql.jdbc.ResultSet) ps.executeQuery();
      
       %>
        
        <div class="UserDetails">
            <h1>Check Availability</h1>
            <form action="check.jsp" method="post"name="myform">
            

              <label for="email" name="email" >Email: </label>
              <input name="email" type="text" value="<% 
 while(p.next()){
      String email=p.getString("Email");     
out.print(email); }%>" required>
              
              <label for="User" name="Name">Name: </label>
              <input name="User" type="text" required>
              <label for="Check-in" >Check-In Date: </label>
              <input name="Check-in" type="date" placeholder="dd/mm/yyyy" required>
              <label for="Check-out" >Check-Out Date: </label>
              <input name="Check-out" type="date" placeholder="dd/mm/yyyy" required>
              <label for="rooms" >No of rooms: </label>
              <input name="rooms" type="number" required>
              <label for="typeRoom" >Room Type: </label><br>
              
              
              <div class="cbox">
              <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
              <label  class="cl" for="c1" >Premier Room 
              <input class="check1" type="checkbox" name="c1" value="PremierRoom" ><br></label>
             <label   class="cl" for="c1" >Luxury Room 
              
             <input class="check1" type="checkbox" name="c1"  value="LuxuryRoom"><br></label>
             <label class="cl"  for="c1" >Deluxe Room 
              
             <input class="check1" type="checkbox" name="c1" value="DeluxeRoom" ><br></label>
             <label class="cl" for="c1" >Super Deluxe Room 
              
             <input class="check1" type="checkbox" name="c1" value="SuperDeluxeRoom" ><br></label>
             <script type="text/javascript">
                 $('.check1').on('change', function() {
        $('.check1').not(this).prop('checked', false);  
    });
    </script>
              </div>


             
             <!-- <br><br><hr>
              <select class="wide" name="typeRoom" required>
                  <option value=<%=1%>> Premier Room</option>
                  <option value=<%=2%>> Luxury Room</option>
                  <option value=<%=3%>>Deluxe Room</option>
                  <option value=<%=4%>>Super Deluxe Room</option>
                               
              </select> -->
              <br>
              <button name="checkAvail" value="Check Availability">Check Availability</button>
            
        </form>
        </div>
              <div class="UserSide">
                  <h1>Hotel Rooms:</h1>
                  <img src="image/gallery/p1.jpg" height="300" width="300">
                  <img src="image/gallery/p2.jpg" height="300" width="300">
                  <img src="image/gallery/p3.jpg" height="300" width="300">
                  <img src="image/gallery/p4.jpg" height="300" width="300">
                  
              </div>
              <%
                        }
                        catch(Exception e){
                        out.print("<script>alert('Please login to make new Booking!!');</script>");
                       
                        }   
                        
                        
                        
                        
              %>
             
        
                  
        
