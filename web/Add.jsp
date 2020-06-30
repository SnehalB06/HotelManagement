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
            String bus=request.getParameter("bus");
            String source=request.getParameter("source");
            String dest=request.getParameter("dest");
            String depart=request.getParameter("departDate");
            String arrive=request.getParameter("arrivalDate");
            String departTime=request.getParameter("departTime");
            String arriveTime=request.getParameter("arrivalTime");
            
            int seat=Integer.parseInt(request.getParameter("seat"));
            String type=request.getParameter("type");
            String busNo=request.getParameter("BusNo");
            String busStatus=request.getParameter("BusStatus");
           
            //float salary=Float.parseFloat(request.getParameter("Salary"));
            out.print("<br><br><br><br>"+bus+source+dest+depart+arrive+depart+departTime+arriveTime+seat+type+busNo+busStatus);
            //name = name.substring(0, 1).toUpperCase();
            
         Class.forName("com.mysql.jdbc.Driver");
         Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel","root","" ); 
         String sql,sql1;
         sql1="SELECT COUNT(*) FROM busdetails";
         Statement st=con.createStatement();
         ResultSet rs=st.executeQuery(sql1);
         String ct="";
         while(rs.next()){
         ct=rs.getString(1);
         }
         out.print(" ct= "+ct);
         int id=Integer.parseInt(ct);
         id=id+1;
         sql="INSERT INTO `busdetails`(`busId`, `source`, `dest`, `departDate`, `arriveDate`, `departTime`, `arriveTime`, `seat`, `type`, `busNo`, `busStatus`, `busName`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
         //sql="INSERT INTO `busdetails`(`busId`, `source`, `dest`, `departDate`, `arriveDate`, `departTime`, `arriveTime`, `seat`, `type`, `busNo`, `busStatus`, `busName`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
         PreparedStatement ps =(PreparedStatement) con.prepareStatement(sql);
         ps.setInt(1, id);
         ps.setString(2, source); 
         ps.setString(3, dest); 
         ps.setString(4, depart); 
         ps.setString(5, arrive); 
         ps.setString(6, departTime); 
         ps.setString(7, arriveTime); 
         ps.setInt(8,seat); 
         ps.setString(9,type);
         ps.setString(10,busNo);
         ps.setString(11,busStatus);
         ps.setString(12,bus);
         
         int n=ps.executeUpdate();
      
      
      if(n>=0){
      
      out.print("<script>alert('Bus details entered Successfully!!');</script>");
      ps.close();
      con.close();
        
         
      }        
    }
else{

out.print("<script>alert('We could not enter Bus Details!!!');</script>");
%>

<%
      
}
            
    }
    
    catch(Exception e){
    }
    %>
    <jsp:include page="resources.jsp"/>
