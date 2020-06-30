<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<jsp:include page="header.jsp"/>

<%
    try{
         HttpSession session1=request.getSession(true);
                       
                           String l=session1.getAttribute("UserName").toString();
                            
                           // out.print(l);
                           String m="Admin";
                          
            if(l.equals(m)){
            String name=request.getParameter("User");
            String dob=request.getParameter("DOB");
            String email=request.getParameter("email");
            String phone=request.getParameter("phone1");
            String alternateph=request.getParameter("phone2");
            String join=request.getParameter("join");
            String qual=request.getParameter("Qualification");
            String post=request.getParameter("Designation");
            float salary=Float.parseFloat(request.getParameter("Salary"));
            //out.print("<br><br><br><br>"+name+dob+email+phone+alternateph+join+qual+post+salary);
            //name = name.substring(0, 1).toUpperCase();
            
         Class.forName("com.mysql.jdbc.Driver");
         Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel","root","" ); 
         String sql,sql1;
         sql = "UPDATE employee SET dob=?,phone1=?,phone2=?,joinDate=?,qual=?,post=?,email=?,salary=? WHERE name=?;";
         PreparedStatement ps =(PreparedStatement) con.prepareStatement(sql);
        //
         ps.setString(1, dob); 
         ps.setString(2, phone); 
         ps.setString(3, alternateph); 
         ps.setString(4, join); 
         ps.setString(5, qual); 
         ps.setString(6,post ); 
         ps.setString(7,email);
         ps.setFloat(8, salary);
         ps.setString(9, name); 
         
         
         int n=ps.executeUpdate();
      
      
      if(n>=0){
      
      out.print("<script>alert('Employee details updated Successfully!!');</script>");
      ps.close();
      con.close();
    }
      else{
      out.print("<script>alert('Something went Wrong!!');</script>");
      
      }
    }
    }
    catch(Exception e){
    }
                           
     
      %>
      <jsp:include page="hr.jsp"></jsp:include>
