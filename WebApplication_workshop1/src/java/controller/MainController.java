package controller;


import dao.ProjectDAO;
import dao.UserDAO;
import dto.ProjectDTO;
import dto.UserDTO;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    private static final String LOGIN_PAGE = "login.jsp";
    
    ProjectDAO pdao = new ProjectDAO();

    public UserDTO getUser(String strUserName) {
        UserDAO udao = new UserDAO();
        UserDTO user = udao.readById(strUserName);
        return user;
    }

    public boolean isValidLogin(String strUsername, String strPassword) {
        UserDTO user = getUser(strUsername);
        return user != null && user.getPassword().equals(strPassword);
    }
    protected void search(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchTerm = request.getParameter("searchTerm");
        List<ProjectDTO> projects = pdao.searchByName(searchTerm);
        request.setAttribute("projects", projects);
        request.setAttribute("searchTerm", searchTerm);
    }
    protected void getAllProjects(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<ProjectDTO> projects = pdao.readAll();
        request.setAttribute("projects", projects);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        try {
            String action = request.getParameter("action");
            System.out.println("action: "+ action);
            if (action == null) {
                url = LOGIN_PAGE;
            } else {
                if (action.equals("login")) {
                    String strUsername = request.getParameter("txtUsername");
                    String strPassword = request.getParameter("txtPassword");
                    if(isValidLogin(strUsername, strPassword)){//login success
                        UserDTO user = getUser(strUsername);
                        request.getSession().setAttribute("user", user);//create session
                        getAllProjects(request, response);
                        url ="projectDashboard.jsp";
                    }else{
                        request.setAttribute("message", "Incorrect Username or Password");
                        url = "login.jsp";
                    }
                    
                }else if(action.equals("logout")){
                    request.getSession().invalidate();//destroy session
                    url = "login.jsp";
                    
                }else if(action.equals("return")){
                    getAllProjects(request, response);
                    url = "projectDashboard.jsp";

                }else if(action.equals("searchPage")){
                    url = "search.jsp";
                    
                }else if(action.equals("search")){
                    search(request, response);
                    url = "search.jsp";
                    
                }else if(action.equals("updatePage")){
                    url = "updateStatusForm.jsp";
                    
                }else if(action.equals("update")){
                    String id = request.getParameter("id");
                    String status = request.getParameter("status");
                    pdao.updateStatus(id, status);
                    
                    getAllProjects(request, response);
                    url = "projectDashboard.jsp";
                    
                }else if(action.equals("addPage")){
                    url = "projectForm.jsp";
                    
                }else if(action.equals("add")){
                    try {
                        boolean checkError = false;
                        
                        int project_id = Integer.parseInt(request.getParameter("txtProjectID"));
                        String project_name = request.getParameter("txtProjectName");
                        String Description = request.getParameter("txtDescription");
                        String Status = request.getParameter("txtStatus");
                        String estimated_launch = request.getParameter("txtEstimatedLaunchDate");
                        
                        if(project_name==null || project_name.trim().isEmpty()){
                            checkError = true;
                            request.setAttribute("txtProjectName_error", "Project Name cannot be empty!");
                        }
                        
                        if(project_id < 0){
                            checkError = true;
                            request.setAttribute("txtProjectID_error", "Project ID must be >= 0!");
                        }
                        
                        ProjectDTO project = new ProjectDTO(project_id, project_name, Description, Status, estimated_launch);
                        if(!checkError){
                            pdao.create(project);
                            getAllProjects(request, response);
                            url = "projectDashboard.jsp";
                        }else{
                            url = "projectForm.jsp";
                            request.setAttribute("project", project);
                        }
                        

                        
                    } catch (Exception e) {
                        
                    }
                    
                }
                
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}