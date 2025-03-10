<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="MainController" method="post">
            <input type="hidden" name="action" value="login"/>
            Username <input type="text" name="txtUsername"/><br/>
            Password <input type="password" name="txtPassword"/><br/>
            <input type="submit" value="login"/>
        </form>
        <!--Show error message when failed to login-->
        <% String message = request.getAttribute("message")+""; %>
        <%= message.equals("null")?"":message%>
    </body>
</html>
