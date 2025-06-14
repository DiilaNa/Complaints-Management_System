package lk.ijse.project.model.Entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Complaints {
    private String cid;
    private String subject;
    private String description;
    private String status;
    private String date;
    private String userId;
}
