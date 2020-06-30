<jsp:include page="header.jsp"/>

<div class="hrDiv" style="margin-left:450px; margin-top: 100px;width:500px; border: 1px solid #000; border-radius: 20px;" >
        <br>
     <form action="AvailBus.jsp" method="post" >
    <input type="submit" value="Available buses" style="background-color: #24f1ac;
    border-radius: 20px;
    width: 300px;
    height: 50px;
    font-size: large;
    margin-left: 100px;
    padding: 10px;">
</form>
                <br><hr><br>  
                <form action="bookBus.jsp" method="post" >
     <input type="submit" value="Book a Ticket" style="background-color: #24f1ac;
    border-radius: 20px;
    width: 300px;
    height: 50px;
    font-size: large;
    margin-left: 100px;
    padding: 10px;">
     
</form>
                <br>   
                




<%
     try{
                            HttpSession session1=request.getSession(true);
                       
                           String l=session1.getAttribute("UserName").toString();
                            
                           // out.print(l);
                           String m="Admin";
                           String n="";
                          
            if(l.equals(m)){
            %>
      <!--<div class="hrDiv" style="margin-left:450px; margin-top: 100px;width:500px; border: 1px solid #000; border-radius: 20px;" >
   
        -->  
        
        <hr>
                <form action="AddRoute.jsp" method="post" >
    <input type="submit" value="Add Bus Route" style="background-color: #24f1ac;
    border-radius: 20px;
    width: 300px;
    height: 50px;
    font-size: large;
    margin-left: 100px;
    padding: 10px;">
</form>
                <br><hr><br>  
                <form action="DisplayRoute.jsp" method="post" >
    <input type="submit" value="Display Bus Routes" style="background-color: #24f1ac;
    border-radius: 20px;
    width: 300px;
    height: 50px;
    font-size: large;
    margin-left: 100px;
    padding: 10px;">
</form>
                <br><hr><br>
                <form action="UpdateStatus.jsp" method="post" >
     <input type="submit" value="Update bus Status" style="background-color: #24f1ac;
    border-radius: 20px;
    width: 300px;
    height: 50px;
    font-size: large;
    margin-left: 100px;
    padding: 10px;">
</form>
                <br />
<hr>
      </div>
            <%
            
            }
            
     }
     catch(Exception e){
     }
     
    %>
