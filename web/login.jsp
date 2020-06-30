
<%-- 
    Document   : login
    Created on : 17-Jan-2019, 18:07:26
    Author     : DR SUDHIR BHOLE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<!DOCTYPE html>
<html lang="en" >

<head>
  <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="icon" href="image/favicon.png" type="image/png">
        <title>Royal Hotel</title>
        <!-- Bootstrap CSS -->
        
  <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans:400,300'>
<link rel='stylesheet' href='https://fonts.googleapis.com/icon?family=Material+Icons'>
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
    
      <link rel="stylesheet" href="css/loginStyle.css">

  
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
                            <li class="nav-item"><a class="nav-link" href="resources.jsp">Resources</a></li>
                           <%
                        try{
                            HttpSession session1=request.getSession(true);
        
                            String l=session1.getAttribute("UserName").toString();
                            //out.print(l);
                            String h="";
                            
                        %>
                            
                            
                            <%
                            
                            if(l.equals(h)){
                                
                            
                            %>
                            <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                            
                            
                            <%
                            }
                            else{
                            %>
                           <li class="nav-item"><a class="nav-link" href="login.jsp">Logout</a></li>         

<%    
                            }
                        
                            }catch(Exception e){
                        }
                       
                    %>
                            <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
                            
                        </ul>
                    </div> 
                </nav>
            </div>
        </header>
        <!--================Header Area =================-->
                    
    <!--================Banner Area =================-->
    <section class="banner_area" style="margin-top: -20px;">
            <div class="booking_table d_flex align-items-center">
            	<div class="overlay bg-parallax" data-stellar-ratio="0.9" data-stellar-vertical-offset="0" data-background=""></div>
				<div class="container">
					<div class="banner_content text-center">
				
<div class="cont_centrar">

  <div class="cont_login">
<div class="cont_info_log_sign_up">
      <div class="col_md_login">
<div class="cont_ba_opcitiy">
        
        <h2>LOGIN</h2>  
  <p>Login To Your Account!!!</p> 
  <button class="btn_login" onclick="cambiar_login()">LOGIN</button>
  </div>
  </div>
<div class="col_md_sign_up">
<div class="cont_ba_opcitiy">
  <h2>SIGN UP</h2>

  
  <p>New user? Sign Up here!!</p>

  <button class="btn_sign_up" onclick="cambiar_sign_up()">SIGN UP</button>
</div>
  </div>
       </div>

    
    <div class="cont_back_info">
       <div class="cont_img_back_grey">
       <img src="https://images.unsplash.com/42/U7Fc1sy5SCUDIu4tlJY3_NY_by_PhilippHenzler_philmotion.de.jpg?ixlib=rb-0.3.5&q=50&fm=jpg&crop=entropy&s=7686972873678f32efaf2cd79671673d" alt="" />
       </div>
       
    </div>
      <form name="login"  action="nextLogin.jsp" method="post">
<div class="cont_forms" >
    <div class="cont_img_back_">
       <img src="https://images.unsplash.com/42/U7Fc1sy5SCUDIu4tlJY3_NY_by_PhilippHenzler_philmotion.de.jpg?ixlib=rb-0.3.5&q=50&fm=jpg&crop=entropy&s=7686972873678f32efaf2cd79671673d" alt="" />
       </div>
 <div class="cont_form_login">
<a href="index.html" onclick="ocultar_login_sign_up()"><i class="material-icons">&#xE5C4;</i></a>
   <h2>LOGIN</h2>
   <input type="text" name="uname" value="" placeholder="User Name"/>
<input type="password" placeholder="Password" name="pass1"/>
<button class="btn_login" onclick="cambiar_login()">LOGIN</button>
  </div>
      </form>
      <form name="signUp" action="ValidSign.jsp" method="post">
   <div class="cont_form_sign_up">
<a href="index.html" onclick="ocultar_login_sign_up()"><i class="material-icons">&#xE5C4;</i></a>
     <h2>SIGN UP</h2>
     <input type="email" placeholder="Email" name="email" required/>
<input type="text" placeholder="User" name="uname" required/>
<input type="number" placeholder="phone no." name="mobile" required/>
<input type="password" placeholder="Password" name="pass" required/>
<input type="password" placeholder="Confirm Password" name="pass1" required/>
<!--<input type="submit" style="background-color: #ef5350;" class="btn_sign_up" onclick="cambiar_sign_up()"/>SIGN UP
  -->
  <button class="btn_sign_up" onclick="cambiar_sign_up()" name="b1">Sign up</button></div>
  </form>
    </div>
    
  </div>
 </div>
                                        </div><br><br>
                                        <div class="logout_div">
                                        <br><br>
      <button id="logOutBtn" class="btn_sign_up" onclick="loggedOut()">Log out</button>
                                    </div>
  
                                    <script>
          function loggedOut(){
      var logButton=document.getElementById("logOutBtn");
	window.location="logout.jsp";
	
  }
                                    </script>
    <script  src="js/login.js"></script>




</body>

</html>
