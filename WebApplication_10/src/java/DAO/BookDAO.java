/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.BookDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class BookDAO implements IDAO<BookDTO, String>{

    @Override
    public boolean create(BookDTO entity) {
        return false;
    }

    @Override
    public List<BookDTO> readAll() {
        return null;
    }

    @Override
    public BookDTO readById(String id) {
        return null;
    }

    @Override
    public boolean update(BookDTO entity) {
        return false;
    }

    @Override
    public boolean delete(String id) {
        return false;
    }

    @Override
    public List<BookDTO> search(String searchTerm) {
        return null;
    }
    
    public List<BookDTO> searchByTitle(String searchTerm) {
        String sql = "select * from tblBooks where title like ? and quantity > 0";
        List<BookDTO> booklist = new ArrayList<>();
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%"+searchTerm+"%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                BookDTO book = new BookDTO(
                        rs.getString("BookID"), 
                        rs.getString("Title"), 
                        rs.getString("Author"), 
                        rs.getInt("PublishYear"), 
                        rs.getDouble("Price"), 
                        rs.getInt("Quantity"));
                booklist.add(book);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return booklist;
    }

    public boolean updateQuantityToZero(String bookID) {
        String sql = "update tblBooks set quantity = 0 where bookid = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, bookID);
            int i = ps.executeUpdate();
            return i > 0;
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return false;
    }
    
}
