<%-- 
    Document   : search
    Created on : Feb 13, 2025, 11:27:20 AM
    Author     : tungi
--%>

<%@page import="java.util.List"%>
<%@page import="dto.BookDTO"%>
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
        <h1> Welcome <%=user.getFullName()%> </h1>
        <br>
        <form action="MainController">
            <input type="hidden" name="action" value="logout">
            <input type="submit" value="logout">
        </form>
        <hr>
        <% String searchTerm = request.getAttribute("searchTerm")+"";%>
        <form action="MainController">
            <input type="hidden" name="action" value="search"/>
            Search Books: <input type="text" name="searchTerm" value="<%= searchTerm.equals("null")?"":searchTerm %>"/>
            <input type="submit" value="search"/>
        </form>
        <br/>
        <br/>
        <%
            if(request.getAttribute("books") != null){
                List<BookDTO> books = (List<BookDTO>)request.getAttribute("books");
                %>
                <table border="1">
                    <tr><!--Name of each collumn-->
                        <td>BookID</td>
                        <td>Title</td>
                        <td>Author</td>
                        <td>PublishYear</td>
                        <td>Price</td>
                        <td>Quantity</td>
                        <td>Action</td>
                    </tr>
                    <%
                        for(BookDTO b: books){
                            %>
                            <tr><!--Info of every book-->
                                <td><%=b.getBookID()%></td>
                                <td><%=b.getTitle()%></td>
                                <td><%=b.getAuthor()%></td>
                                <td><%=b.getPublishYear()%></td>
                                <td><%=b.getPrice()%></td>
                                <td><%=b.getQuantity()%></td>
                                <td>
                                    <a href="MainController?action=delete&id=<%=b.getBookID()%>&searchTerm=<%=searchTerm%>">    
                                        <img src="assets/pictures/Button-Delete-icon.png" style="height: 25px"/>
                                    </a>
                                </td>
                            </tr>
                            <%
                        }
                    %>
                </table>
                <%
            }
        %>
        <% }else{ %>
            You do not have the permission to access this content.
        <% } %>
        
    </body>
</html>
