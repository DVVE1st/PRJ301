<%-- 
    Document   : output2
    Created on : Feb 10, 2025, 11:17:57 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            int a = (int)request.getAttribute("a");
            if(a%2 == 0){
                %>
                    <%=a%> là số chẵn
                <%
            }else{
                %>
                    <%=a%> là số lẻ
                <%
            }
        %>
    </body>
</html>
