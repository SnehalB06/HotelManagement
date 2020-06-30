<jsp:include page="header.jsp"/>
<%
                        try{
                            HttpSession session1=request.getSession(true);
        
                            String l=session1.getAttribute("UserName").toString();
                            response.sendRedirect("bill.jsp");
                            
                            
                        }catch(Exception e){
                        }
                       
                    %>