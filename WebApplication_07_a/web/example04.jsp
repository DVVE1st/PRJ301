<%-- 
    Document   : example04
    Created on : Feb 10, 2025, 10:30:40 AM
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
        <%! int i;%>
        <%! int j;%>
        
        <%
            for (int i = 2; i <= 9; i++) {
                %>
                    <b></b>BẢNG CỬU CHƯƠNG <%=i%><br>
                <%
                    for (int j = 1; j <= 10; j++) {
                        %>
                            <%=i%> x <%=j%> = <%= i * j %><br>
                        <%        
                    }
                %>
                    <hr>
                    <br>
                <%
            }
        %>
    </body>
</html>
