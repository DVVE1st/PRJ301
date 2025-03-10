<%-- 
    Document   : search
    Created on : Feb 13, 2025, 11:27:20 AM
    Author     : tungi
--%>

<%@page import="dto.ProjectDTO"%>
<%@page import="java.util.List"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        if(session.getAttribute("user") != null){
            UserDTO user = (UserDTO)session.getAttribute("user");
        %>
        <h1> Welcome <%= user.getRole() %>, <%= user.getName() %></h1>
        <h4>Project Dashboard > Search page</h4>
        <br>
        
        <!--return button-->
        <form action="MainController">
            <input type="hidden" name="action" value="return">
            <input type="submit" value="return">
        </form>
        <hr>
        
        <!--search button-->
        <% String searchTerm = request.getAttribute("searchTerm")+"";%>
        <form action="MainController">
            <input type="hidden" name="action" value="search"/>
            Search Projects: <input type="text" name="searchTerm" value="<%= searchTerm.equals("null")?"":searchTerm %>"/>
            <input type="submit" value="search"/>
        </form>
        
        <br/>
        <br/>
        <%
            if(request.getAttribute("projects") != null){
                List<ProjectDTO> projects = (List<ProjectDTO>)request.getAttribute("projects");
                %>
                <table border="1">
                    <tr><!--Name of each collumn-->
                        <td>Project id</td>
                        <td>Project Name</td>
                        <td>Description</td>
                        <td>Status</td>
                        <td>Estimated Launch Date</td>
                        <td>Update Status</td>
                    </tr>
                    <%
                    for(ProjectDTO p: projects){
                        %>
                        <tr><!--Info of every book-->
                            <td><%=p.getProject_id()%></td>
                            <td><%=p.getProject_name()%></td>
                            <td><%=p.getDescription()%></td>
                            <td><%=p.getStatus()%></td>
                            <td><%=p.getEstimated_launch()%></td>
                            <td>
                                <a href="MainController?action=updatePage&id=<%=p.getProject_id()%>&searchTerm=<%=searchTerm%>">    
                                    <img src="assets/pictures/edit-icon.png" style="height: 25px"/>
                                </a>
                            </td>
                        </tr>
                        <%
                    }
                    %>
                </table>
            <%}%>
        <% }else{ %>
            You do not have the permission to access this content.
        <% } %>
        
    </body>
</html>
