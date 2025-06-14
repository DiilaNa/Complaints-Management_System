package lk.ijse.project.model.Entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Complaints {
    private int cid;
    private String subject;
    private String description;
    private String date;
    private String userId;
}
