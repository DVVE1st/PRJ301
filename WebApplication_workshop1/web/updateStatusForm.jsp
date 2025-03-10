<%-- 
    Document   : updateStatusForm
    Created on : Mar 6, 2025, 2:43:45 AM
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
        <% String id = request.getParameter("id"); %>
        <% String pname = request.getParameter("name"); %>
        <h4>What Status do you want <%=pname%> to change to ?</h4>
        <!--Ideation button-->
        <form action="MainController?action=update&id=<%=id%>" method="post" style="display: inline-block; margin-right: 10px;">
            <input type="hidden" name="status" value="Ideation">
            <input type="submit" value="Ideation">
        </form>
        
        <!--Development button-->
        <form action="MainController?action=update&id=<%=id%>" method="post" style="display: inline-block; margin-right: 10px;">
            <input type="hidden" name="status" value="Development"/>
            <input type="submit" value="Development"/>
        </form>
        
        <!--Launch button-->
        <form action="MainController?action=update&id=<%=id%>" method="post" style="display: inline-block; margin-right: 10px;">
            <input type="hidden" name="status" value="Launch"/>
            <input type="submit" value="Launch"/>
        </form>
        
        <!--Scaling button-->
        <form action="MainController?action=update&id=<%=id%>" method="post" style="display: inline-block; margin-right: 10px;">
            <input type="hidden" name="status" value="Scaling"/>
            <input type="submit" value="Scaling"/>
        </form>
    </body>
</html>
