package triple.assignment.clubmileage.model.users;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;
import triple.assignment.clubmileage.model.points.PointHistoryType;

import javax.persistence.*;
import java.util.UUID;

@Entity
@Getter @Setter
@Table(name = "USERS")
public class Users {
    @Id
    @GeneratedValue(generator = "uuid2")
    @GenericGenerator(name = "uuid2", strategy = "uuid2")
    @Column(name = "user_id", columnDefinition = "BINARY(16)")
    private UUID userId;

    @Column(name = "cur_point", columnDefinition = "integer DEFAULT 0")
    private Integer point = 0;

    public void calculatePoint(PointHistoryType type, Integer point) {
        if (type == PointHistoryType.EARN) {
            this.point += point;
        } else {
            this.point -= point;
        }
    }
}
