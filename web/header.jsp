<%-- 
    Document   : accomodation
    Created on : 09-Feb-2019, 12:05:49
    Author     : DR SUDHIR BHOLE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- 
    Document   : accomodation
    Created on : 17-Jan-2019, 18:03:36
    Author     : DR SUDHIR BHOLE
--%>

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
    </head>
    <body>
       <!--================Header Area =================-->
        <header class="header_area">
            <div class="container">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <a class="navbar-brand logo_h" href="index.jsp"><img src="image/Logo.png" alt=""></a>
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
                            <li class="nav-item active"><a class="nav-link" href="index.jsp">Home</a></li> 
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
                           <%
                        try{
                            HttpSession session1=request.getSession(true);
        
                            String l=session1.getAttribute("UserName").toString();
                            //out.print(l);
                            String k="Admin";
                            if(l.equals(k)){
                            
                       
                    %>
                            <li class="nav-item"><a class="nav-link" href="hr.jsp">HR</a></li>
                            <% 
                            }
                        }catch(Exception e){
                        }
                            %> 
                            <li class="nav-item"><a class="nav-link" href="login.jsp">Login /LogOut</a></li>
                            
                            <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
                            
                        </ul>
                    </div> 
                </nav>
            </div>
        </header>
        <!--================Header Area =================-->