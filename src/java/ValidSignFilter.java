/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSet;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.DriverManager;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 *
 * @author DR SUDHIR BHOLE
 */
@WebFilter(filterName = "ValidSignFilter", urlPatterns = {"/ValidSign.jsp"})
public class ValidSignFilter implements Filter {
    int id;
    
    public ValidSignFilter() {
    }    
    
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        PrintWriter out=response.getWriter();
        String email=request.getParameter("email");
        String user=request.getParameter("uname");
        String phone=request.getParameter("mobile");
        String pass=request.getParameter("pass");
        String pass1=request.getParameter("pass1");
        
        RequestDispatcher rs=request.getRequestDispatcher("login.jsp");
        
        if(user.length()<3 || user.length()>20){
            rs.include(request,response);
           out.print("<script>alert('UserNmae must be between 3 to 20 charecters');</script>");
       
      }
        else if(phone.length() <10){
            rs.include(request,response);
            out.print("<script> alert('Invallid Phone no.');</script>");
            
        }
        else if(pass.length() < 4 || pass.length() >20){
            rs.include(request,response);
         out.print("<script>alert('password must be between 4 to 20 charecters');</script>");
        }
        else if(!pass.equals(pass1)){
            rs.include(request,response);
        out.print("<script>alert('Passwords Dont match');</script>");
        
        }
        
        else{
           try {
              
         Class.forName("com.mysql.jdbc.Driver");
         Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel","root","" ); 
         String sql;
         sql = "INSERT INTO signup (id,Email, UserName, mobile, password) VALUES (?,?, ?, ?, ?);";
         PreparedStatement ps =(PreparedStatement) con.prepareStatement(sql); 
         ps.setInt(1, id); 
         ps.setString(2, email); 
         ps.setString(3, user); 
         ps.setString(4, phone); 
         ps.setString(5, pass); 
         
      int n=ps.executeUpdate();
      ps.close();
      con.close();
        
         chain.doFilter(request, response);
        
        
  
            } catch (Exception ex) {
                
            out.print(ex);}
         
            
       }
        
    }

    public void destroy() {        
    }

    public void init(FilterConfig filterConfig) {        
        
    }

}