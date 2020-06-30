/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import static java.lang.System.out;
import java.sql.DriverManager;
import java.time.LocalDate;
import java.util.Date;
import java.util.HashMap;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DR SUDHIR BHOLE
 */
@WebFilter(filterName = "checkAvail", urlPatterns = {"/check.jsp"})
public class checkAvail implements Filter {
    
    public checkAvail() {
    }    
    
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        String user="  ";
        RequestDispatcher rs=request.getRequestDispatcher("newBook.jsp");
        RequestDispatcher rs1=request.getRequestDispatcher("failed.jsp");
        
        PrintWriter out=response.getWriter();
        user=request.getParameter("email");
        String pass=request.getParameter("User");
        
        String checkIn=request.getParameter("Check-in");
        String checkOut=request.getParameter("Check-out");
        String Rooms=request.getParameter("rooms");
        //String RoomsType=request.getParameter("typeRooms");
        String c5=request.getParameter("c1");
       // rs.include(request,response);
        //out.print(pass+checkIn+checkOut+"  "+Rooms+"     "+c5);
        int ro=Integer.parseInt(Rooms);
        
        LocalDate localDate = LocalDate.now();
        String today=localDate.toString();
        
 boolean c1 = LocalDate.parse(checkIn).isBefore(LocalDate.parse(checkOut));
 boolean c2 = LocalDate.parse(checkIn).isAfter(LocalDate.parse(today));
 //boolean c3= LocalDate.parse(checkOut).isAfter(LocalDate.parse(checkIn));
 if( !(c1 & c2) ){
 //rs.include(request,response);
 //out.print("<script> alert('Invalid Dates!! Please Enter Valid Dates!!'); </script>");
 }
 else{
      try {
      
         Class.forName("com.mysql.jdbc.Driver");
         Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel","root","" ); 
         
         String sql5;
         sql5 = "SELECT id From signup where Email= ? ;"; 
         PreparedStatement ps2 =(PreparedStatement) con.prepareStatement(sql5); 
         ps2.setString(1, user);    
      com.mysql.jdbc.ResultSet p2 =(com.mysql.jdbc.ResultSet) ps2.executeQuery();
      int id=0;
      while(p2.next()){
      id=p2.getInt("id");  
      }
     
       String sql;
       sql = "SELECT * From hotelroom where allocationStatus='no' and roomType=?;"; 
      PreparedStatement ps =(PreparedStatement) con.prepareStatement(sql); 
      ps.setString(1, c5); 
      com.mysql.jdbc.ResultSet p =(com.mysql.jdbc.ResultSet) ps.executeQuery();
      int r=0; 
      boolean c3,c4,flag=false;
      while(p.next()){
      int room=p.getInt("Room_id");
      String t=p.getString("roomType");
      String cin=p.getString("checkIn");
      String cout=p.getString("CheckOut");
      if(cin.equals("2015-01-01")){
          r++;  
         String sql2 = "UPDATE hotelroom SET canBeAlloted='yes',user=? WHERE Room_id=?;"; 
         PreparedStatement ps1 =(PreparedStatement) con.prepareStatement(sql2); 
         ps1.setInt(1, id);
         ps1.setInt(2, room);   
         int n=ps1.executeUpdate();
          if(r == ro){  
           flag=true;   
          break;
          }
          //room not booked yet
      }
      
      //c3= LocalDate.parse().isAfter(LocalDate.parse(checkIn));
      //if()
      //out.print(room+" "+cin+" "+cout);
      
      }
      if(flag){
      chain.doFilter(request, response);
      
      }
      else{
   rs.include(request,response);
   //out.print(cin+t+room);
      
 out.print("<script> alert('Rooms Not Available!! Please Check for other Dates!!'; </script>");
 
      }
               
               
        p.close();
         ps.close();
      con.close();
            } catch (Exception ex) {
                
            out.print(ex);}
         
            
       }
    }
    

    /**
     * Return the filter configuration object for this filter.
     */
    public void destroy() {        
    }

    public void init(FilterConfig filterConfig) {        
        
    }

}