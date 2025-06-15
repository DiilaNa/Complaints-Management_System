package lk.ijse.project.model.Entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class AllComplaints {
    private String id;
    private String subject;
    private String description;
    private String status;
    private String userId;
    private String userName;
    private String date;
}
