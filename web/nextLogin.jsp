<%-- 
    Document   : nextLogin
    Created on : 14-Jan-2019, 22:18:55
    Author     : DR SUDHIR BHOLE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheets" href="css/style.css">
        <title></title>
    </head>
    <body>
        <h5>
            <%
                HttpSession session1=request.getSession(true);
                 
                session1.removeAttribute("UserName");
                %>
            <jsp:include page="index.jsp"/>
            
            <%
        String Uname=request.getParameter("uname");
        
        session1.setAttribute("UserName", Uname);
        String l=session1.getAttribute("UserName").toString();
        
        response.sendRedirect("index.jsp");
        session1.removeAttribute("UserName");
        
        
        %>
        
        </h5>
        <
        </body>
</html>
