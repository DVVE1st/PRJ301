<%-- 
    Document   : projectForm
    Created on : Mar 9, 2025, 9:24:21 PM
    Author     : Admin
--%>

<%@page import="dto.ProjectDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            ProjectDTO project = new ProjectDTO();
            try {
                project = (ProjectDTO)request.getAttribute("project");
            } catch (Exception e) {
                
            }
            if(project==null){
                project = new ProjectDTO();
            }
            
            String txtProjectName_error = request.getAttribute("txtProjectName_error")+"";
            txtProjectName_error = txtProjectName_error.equals("null")?"":txtProjectName_error;
            
            String txtProjectID_error = request.getAttribute("txtProjectID_error")+"";
            txtProjectID_error = txtProjectID_error.equals("null")?"":txtProjectID_error;
        %>
        <h4>Project Dashboard > Project Form</h4>
        <form action="MainController" method="post">
            <input type="hidden" name="action" value="add"/>
            Project ID: <input type="number" name="txtProjectID" value="<%=project.getProject_id()%>"/> <span style="color: red"><%=txtProjectID_error%></span><br/>
            Project Name: <input type="text" name="txtProjectName" value="<%=project.getProject_name()%>"/> <span style="color: red"><%=txtProjectName_error%></span><br/>
            Description: <input type="text" name="txtDescription" value="<%=project.getDescription()%>"/><br/>
            Status: <input type="text" name="txtStatus" value="<%=project.getStatus()%>"/><br/>
            Estimated Launch Date: <input type="text" name="txtEstimatedLaunchDate" value="<%=project.getEstimated_launch()%>"/><br/>
            <input type="submit" value="Save"/>
            <input type="reset" value="Reset"/>
        </form>
    </body>
</html>
