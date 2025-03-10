<%-- 
    Document   : output
    Created on : Feb 10, 2025, 11:05:54 AM
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
            int n = (int)request.getAttribute("n");
            %>
            <b></b>BẢNG CỬU CHƯƠNG <%=n%><br>
                <%
                    for (int j = 1; j <= 10; j++) {
                        %>
                            <%=n%> x <%=j%> = <%= n * j %><br>
                        <%        
                    }
        %>
    </body>
</html>
