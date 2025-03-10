package dao;

import dto.ProjectDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

public class ProjectDAO implements IDAO<ProjectDTO, String>{

    @Override
    public boolean create(ProjectDTO entity) {
        String sql = "INSERT INTO tblStartupProjects (project_id, project_name, Description, Status, estimated_launch) VALUES" 
                + "(?, ?, ?, ?, ?)";
                    
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, entity.getProject_id());
            ps.setString(2, entity.getProject_name());
            ps.setString(3, entity.getDescription());
            ps.setString(4, entity.getStatus());
            ps.setString(5, entity.getEstimated_launch());
            int i = ps.executeUpdate();
            return i > 0;
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return false;
    }

    @Override
    public List<ProjectDTO> readAll() {
        String sql = "select * from tblStartupProjects";
        List<ProjectDTO> projectList = new ArrayList<>();
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProjectDTO project = new ProjectDTO(
                        rs.getInt("project_id"),
                        rs.getString("project_name"), 
                        rs.getString("Description"), 
                        rs.getString("Status"), 
                        rs.getString("estimated_launch"));
                projectList.add(project);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return projectList;
    }

    @Override
    public ProjectDTO readById(String id) {
        return null;
    }

    @Override
    public boolean update(ProjectDTO entity) {
        return false;
    }

    @Override
    public boolean delete(String id) {
        return false;
    }

    @Override
    public List<ProjectDTO> search(String searchTerm) {
        return null;
    }

    public List<ProjectDTO> searchByName(String searchTerm) {
        String sql = "select * from tblStartupProjects where project_name like ?";
        List<ProjectDTO> projectList = new ArrayList<>();
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%"+searchTerm+"%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProjectDTO project = new ProjectDTO(
                        rs.getInt("project_id"),
                        rs.getString("project_name"), 
                        rs.getString("Description"), 
                        rs.getString("Status"), 
                        rs.getString("estimated_launch"));
                projectList.add(project);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return projectList;
    }

    public boolean updateStatus(String ProjectID, String status) {
        String sql = "update tblStartupProjects set Status = ? where project_id = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, status);
            ps.setString(2, ProjectID);
            int i = ps.executeUpdate();
            return i > 0;
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return false;
    }
    
}
