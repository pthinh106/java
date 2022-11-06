package LifeLeopard.TeamShop.Models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "table_category")
public class Category {
    @Id
    private int CategoryId;
    @Column(name = "Category_name")
    private String CategoryName;

    public Category(){}

    public Category(int categoryId, String categoryName) {
        CategoryId = categoryId;
        CategoryName = categoryName;
    }

    public int getCategoryId() {
        return CategoryId;
    }

    public void setCategoryId(int categoryId) {
        CategoryId = categoryId;
    }

    public String getCategoryName() {
        return CategoryName;
    }

    public void setCategoryName(String categoryName) {
        CategoryName = categoryName;
    }
}
