<jsp:include page="header.jsp"/>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<jsp:include page="header.jsp"/>
<img src="image/bus.jpg" height=400px width=900px style="margin-left: 250px;">

<div style="margin-top: 10px;margin-left: 200px;">
<form action="busAvail1.jsp" method="post">
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
      

  