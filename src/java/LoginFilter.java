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
import java.sql.DriverManager;
import java.sql.ResultSet;
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
@WebFilter(filterName = "LoginFilter", urlPatterns = {"/nextLogin.jsp"})
public class LoginFilter implements Filter {
    
    
    public LoginFilter() {
    }    
    
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        String user="  ";
        
        
        PrintWriter out=response.getWriter();
         user=request.getParameter("uname");
        String pass=request.getParameter("pass1");
        
        RequestDispatcher rs=request.getRequestDispatcher("login.jsp");
        RequestDispatcher rs1=request.getRequestDispatcher("nextLogin.jsp");
        
           try {
              
         Class.forName("com.mysql.jdbc.Driver");
         Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel","root","" ); 
         String sql;
               sql = "SELECT * From signup where UserName= ? AND password=?;"; 
         PreparedStatement ps =(PreparedStatement) con.prepareStatement(sql); 
         ps.setString(1, user); 
         ps.setString(2, pass); 
         
      com.mysql.jdbc.ResultSet p =(com.mysql.jdbc.ResultSet) ps.executeQuery(); 
               boolean st = p.next();
               if(st){
                    chain.doFilter(request, response);
                    
               }
               else{
                   rs.include(request,response);
               out.print("<script>alert('No user with this UserName and password found!! Try again!!');</script>");
               }
               
        p.close();
         ps.close();
      con.close();
            } catch (Exception ex) {
                
            out.print(ex);}
         
            
       }
        
        

    public void destroy() {        
    }

    public void init(FilterConfig filterConfig) {        
        
    }

}