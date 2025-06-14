package lk.ijse.project.model.dao;

import lk.ijse.project.model.Entity.Complaints;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.UUID;

public class ComplaintsDAO {
    private final DataSource dataSource;

    public ComplaintsDAO(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public boolean addComplaint(Complaints complaint) {
        String sql = "INSERT INTO complaint (cid, subject, description, user_id) VALUES (?, ?, ?, ?)";

        try (Connection connection = dataSource.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, UUID.randomUUID().toString());
            pstmt.setString(2, complaint.getSubject());
            pstmt.setString(3, complaint.getDescription());
            pstmt.setString(4, complaint.getUserId());

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace(); // Or log it
        }
        return false;
    }
}