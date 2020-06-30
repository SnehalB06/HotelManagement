<%-- 
    Document   : check
    Created on : 09-Feb-2019, 18:26:13
    Author     : DR SUDHIR BHOLE
--%>

<%@page import="java.util.HashMap"%>
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
        <form action="next.jsp" method="post">
            
                <div class="UserDetails">
                <h1 >Confirm Booking </h1>
                <% 
                        try{
                            HttpSession session2=request.getSession(true);
        
                            String U=request.getParameter("c1");
        
        session2.setAttribute("c1", U);
         
                        }catch(Exception e){
                        }
               
              String e=request.getParameter("email");
               String k=request.getParameter("User");
              String in1=request.getParameter("Check-in");
              
              String in2=request.getParameter("Check-out");
              String in4=request.getParameter("c1");
              String in5=request.getParameter("rooms");
              out.print(e+"  "+k+"  "+in1+"  "+in2+"  "+in4+"   "+in5);
              
              %>
        
              <label for="email" name="email">Email: </label>
              <input name="email" type="text" value=<%=e%> required>
              
              <label for="User" name="User">Name: </label>
              <input name="User" type="text" value=<%=k%><required>
              
              <label for="Check-in" >Check-In Date: </label>
              <input name="Check-in" type="date" value=<%=in1%> required>
              
              <label for="Check-out" >Check-Out Date: </label>
              <input name="Check-out" type="date" value=<%=in2%> required>
              
              
              <label for="c1" >Room Type: </label>
              <input name=c1" type="text" value="<%=in4%>" >
              
              <!--<select class="wide" name="typeRooms" required>
                  
                  <option   value="Premier Room" > Premier Room</option>
                                                    <option value="Luxury Room"> Luxury Room</option>
                                                    <option  value="Deluxe Room"> Deluxe Room</option>
                                                    <option  value="Super Deluxe Room">Super Deluxe Room</option>
                               </select>
              <br>-->
              <label for="numRooms" >Number of Rooms:  </label>
              <input name="numRooms" type="number" value=<%=in5%> required>
              
              
        </div>
              <div class="inpD">
              <label for="adults" >Adults:  </label>
              <input name="adults" type="number" value="any" required>
              <label for="children" >children:  </label>
              <input name="children" type="number" value="any" required>
              <label for="old" >old:  </label>
              <input name="old" type="number" value="any" required>
              </div>
              <div class="Addblock">
                  <label for="phone" >Phone:   </label><br>
                <input name="phone" type="number" value="any" required><br>
               
                  <label for="address" >Address:   </label><br>
                <input name="address" type="text"  required><br>
                <label for="city" >City:  </label><br>
              <input name="city" type="text"  required><br>
              <label for="state" >State:  </label><br>
              <input name="state" type="text"  required><br>
              <label for="country" >Country:  </label><br>
              <input name="country" type="text" required><br>
                
              </div>
    <center>
        <div class="ud">
              <button  type="Submit" name="Book" value="Book">BOOK</button>
        </div>
    </center>    
        </form>
          
        

        