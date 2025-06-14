package lk.ijse.project.model.dao;

import lk.ijse.project.model.Entity.Complaints;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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
    public List<Complaints> getComplaintsByUserId(String userId) {
        List<Complaints> list = new ArrayList<>();
        String sql = "SELECT cid, subject, description, status, complaint_date FROM complaint WHERE user_id = ?";

        try (
                Connection conn = dataSource.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)
        ) {
            pstmt.setString(1, userId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Complaints c = new Complaints();
                c.setCid(rs.getInt("cid"));
                c.setSubject(rs.getString("subject"));
                c.setDescription(rs.getString("description"));
                c.setStatus(rs.getString("status"));
                c.setDate(rs.getString("complaint_date"));
                list.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

}