<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
        
    <%
    String n=request.getParameter("Name");
Class.forName("com.mysql.jdbc.Driver");
         Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel","root","" ); 
         String sql,sql1,sql3;
         
         sql1="SELECT * FROM employee WHERE Name LIKE ?;";
         PreparedStatement ps=con.prepareStatement(sql1);
         ps.setString(1, n);
         ResultSet rs=ps.executeQuery();
         String id="",name="",dob="",email="",phone1="",phone2="",joinDt="",Qual="",Dest="",Sal="";
         int count=0;
         while(rs.next()){
         count= count+1;
         id=rs.getString(1);
         name=rs.getString(2);
         dob=rs.getString(3);
         email=rs.getString(9);
         phone1=rs.getString(4);
         phone2=rs.getString(5);
         joinDt=rs.getString(6);
         Qual=rs.getString(7);
         Dest=rs.getString(8);
         Sal=rs.getString(10);
         }
         if(count==0){
         out.print("<script>alert('No Record Found!! Please try Again!!'); </script>");
         %>
         <jsp:include page="update.jsp"></jsp:include>
         <%
         
        
         }
         else{
             
         %>
         <div style="margin-left: 300px;
    margin-top: 100px;
    width: 800px;"><center><h1>Enter Employee Details Here!!!</h1></center>
            </div>
        <div  class="empDetails" style="margin-left: 300px;
    margin-top: 10px;
    border: 2px solid black;
    background-color: gainsboro;
    text-align:center;
    padding: 20px;
    width: 800px;">
            <form action="EmpUpdated.jsp" method="post">
                
                <div class="row">           
    <label class="col-4" for="User" name="Name">Name: </label>
        <input class="col-6" name="User" type="text" required value="<% out.print(name);%>"><br>
                </div>   
              <div class="row">  
              <label class="col-4" for="DOB" name="DOB">DOB: </label>
              <input class="col-6" name="DOB" type="date" value="<% out.print(dob);%>" required><br>
              </div>
              <div class="row">  
              <label class="col-4" for="email" name="email">Email: </label>
              <input class="col-6" name="email" type="text" value="<% out.print(email);%>" required><br>
              </div>
              <div class="row">  
              <label class="col-4" for="phone1" name="phone1">Phone: </label>
              <input class="col-6" name="phone1" type="number" value="<% out.print(phone1);%>" required><br>
              </div>
              <div class="row">  
              <label class="col-4" for="phone2" name="phone2">Alternate Phone Number: </label>
              <input class="col-6" name="phone2" type="number" value="<% out.print(phone2);%>" required><br>
              </div>
              <div class="row">  
              <label class="col-4" for="join" >Joining Date: </label>
              <input class="col-6" name="join" type="date" value="<% out.print(joinDt);%>" placeholder="dd/mm/yyyy" required><br>
              </div>
              <div class="row">  
              <label class="col-4" for="Qualification" >Qualification: </label>
              <input class="col-6" name="Qualification" type="text" value="<% out.print(Qual);%> "required><br>
              </div>
              <div class="row">  
              <label class="col-4" for="Designation" >Designation: </label>
              <input class="col-6" name="Designation" type="text" value="<% out.print(Dest);%>" required><br>
              </div>
              
              <div class="row">  
              <label  class="col-4" for="Salary" >Salary: </label>
              <input class="col-6" name="Salary" type="Number" value="<% out.print(Sal); %>" required><br>
              </div>
                <br><br>
                <input type="submit" style="background: gray;
                            border: 1px solid black;
                            border-radius: 20px;
                            color: white;
                            width:200px;
                            ">
              
            </form>
        </div>
        
        <%
        }%>