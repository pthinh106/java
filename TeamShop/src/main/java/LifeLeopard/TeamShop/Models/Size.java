package LifeLeopard.TeamShop.Models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "table_size")
public class Size {
    @Id
    private int SizeId;
    @Column(name = "Size_name")
    private String SizeName;
    public Size(){}

    public Size(int sizeId, String sizeName) {
        SizeId = sizeId;
        SizeName = sizeName;
    }

    public int getSizeId() {
        return SizeId;
    }

    public void setSizeId(int sizeId) {
        SizeId = sizeId;
    }

    public String getSizeName() {
        return SizeName;
    }

    public void setSizeName(String sizeName) {
        SizeName = sizeName;
    }
}
