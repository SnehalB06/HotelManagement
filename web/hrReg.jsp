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
         sql1="SELECT COUNT(*) FROM employee";
         Statement st=con.createStatement();
         ResultSet rs=st.executeQuery(sql1);
         String ct="";
         while(rs.next()){
         ct=rs.getString(1);
         
         }
         out.print(ct);
         int id=Integer.parseInt(ct);
         id=id+1;
         out.print(id);
         sql = "INSERT INTO employee(empId,name,dob,phone1,phone2,joinDate,qual,post,email,salary) VALUES (?,?,?,?,?,?,?,?,?,?);";
         PreparedStatement ps =(PreparedStatement) con.prepareStatement(sql);
         ps.setInt(1, id);
         ps.setString(2, name); 
         ps.setString(3, dob); 
         ps.setString(4, phone); 
         ps.setString(5, alternateph); 
         ps.setString(6, join); 
         ps.setString(7, qual); 
         ps.setString(8,post ); 
         ps.setString(9,email);
         ps.setFloat(10, salary);
         
         int n=ps.executeUpdate();
      
      
      if(n>=0){
      
      out.print("<script>alert('Employee details entered Successfully!!');</script>");
      ps.close();
      con.close();
        
      %>
      <jsp:include page="hr.jsp"></jsp:include>
      <%
      }
            
    }
            
    }
    catch(Exception e){
    }
    %>

