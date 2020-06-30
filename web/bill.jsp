<jsp:include page="header.jsp"/>
<h1>Bill</h1>

<%
                        try{
                            HttpSession session1=request.getSession(true);
        
                            String l=session1.getAttribute("UserName").toString();
                            
                            session.invalidate(); 
                            response.sendRedirect("index.html");
                            
                            
                        }catch(Exception e){
                        }
                       
                    %>