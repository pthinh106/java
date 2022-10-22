package LifeLeopard.TeamShop.Models;

import javax.persistence.*;

@Entity
@Table(name = "table_position")
public class Position {
    @Id
//    @GeneratedValue(strategy = GenerationType.AUTO)
    private int positionId;
    @Column(name = "Position_name")
    private String positionName;

    public Position(){}

    public Position(int positionId, String positionName) {
        this.positionId = positionId;
        this.positionName = positionName;
    }

    public int getPositionId() {
        return positionId;
    }

    public void setPositionId(int positionId) {
        this.positionId = positionId;
    }

    public String getPositionName() {
        return positionName;
    }

    public void setPositionName(String positionName) {
        this.positionName = positionName;
    }
}
