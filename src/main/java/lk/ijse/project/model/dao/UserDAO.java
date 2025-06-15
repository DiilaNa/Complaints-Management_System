package lk.ijse.project.model.dao;

import jakarta.servlet.ServletContext;
import lk.ijse.project.model.Entity.User;
import org.apache.commons.dbcp2.BasicDataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;

public class UserDAO {
    private final BasicDataSource dataSource;

    public UserDAO(ServletContext context) {
        this.dataSource = (BasicDataSource) context.getAttribute("ds");
    }

    public boolean createUser(User user) {
        String sql = "INSERT INTO users (id,name, email, password, role) VALUES (?,?, ?, ?, ?)";
        try (
                Connection connection = dataSource.getConnection();
                PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, user.getId());
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

    public User getUserIfExists(String email, String password, String role) {
        String sql = "SELECT * FROM users WHERE email = ? AND password = ? AND role = ?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, email);
            pstmt.setString(2, password);
            pstmt.setString(3, role);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return new User(
                        rs.getString("id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("role")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public boolean resetPassword(String email, String newPassword) throws SQLException {
        String sql = "UPDATE users SET password=? WHERE email=?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, newPassword);
            stmt.setString(2, email);

            int updated = stmt.executeUpdate();
            return updated > 0;
        }
    }
}
