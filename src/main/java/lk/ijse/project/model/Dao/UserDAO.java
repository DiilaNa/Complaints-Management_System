package lk.ijse.project.model.dao;

import jakarta.servlet.ServletContext;
import lk.ijse.project.model.Entity.User;
import org.apache.commons.dbcp2.BasicDataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserDAO {
    private final BasicDataSource dataSource;

    public UserDAO(ServletContext context) {
        this.dataSource = (BasicDataSource) context.getAttribute("ds");
    }

    public boolean createUser(User user) {
        String sql = "INSERT INTO user (id, name, email, password, role) VALUES (?, ?, ?, ?, ?)";
        try (
                Connection connection = dataSource.getConnection();
                PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, String.valueOf(user.getId()));
            pstmt.setString(2, user.getName());
            pstmt.setString(3, user.getEmail());
            pstmt.setString(4, user.getPassword());
            pstmt.setString(5, user.getRole());

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
