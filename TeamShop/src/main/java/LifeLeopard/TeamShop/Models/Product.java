package LifeLeopard.TeamShop.Models;


import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "table_products")
public class Product {
    @Id
    private int ProductId;
    @ManyToOne
    @JoinColumn(name = "Category_id")
    private Category category;
    @Column(name = "Product_images_preview")
    private String images;
    @Column(name = "Short_description")
    private String ShortDescription;
    @Column(name = "description")
    private String Description;
    @Column(name = "Quantity")
    private int Quantity;
    @Column(name = "Status")
    private int Status;
    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL)
    private Set<ProductImages> productImagesSet;

    public Product(){}

    public Product(int productId, Category category, String images, String shortDescription, String description, int quantity, int status, Set<ProductImages> productImagesSet) {
        ProductId = productId;
        this.category = category;
        this.images = images;
        ShortDescription = shortDescription;
        Description = description;
        Quantity = quantity;
        Status = status;
        this.productImagesSet = productImagesSet;
    }

    public Product(int productId, Category category, String images, String shortDescription, String description, int quantity, int status) {
        ProductId = productId;
        this.category = category;
        this.images = images;
        ShortDescription = shortDescription;
        Description = description;
        Quantity = quantity;
        Status = status;
    }

    public int getProductId() {
        return ProductId;
    }

    public void setProductId(int productId) {
        ProductId = productId;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public String getShortDescription() {
        return ShortDescription;
    }

    public void setShortDescription(String shortDescription) {
        ShortDescription = shortDescription;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int quantity) {
        Quantity = quantity;
    }

    public Set<ProductImages> getProductImagesSet() {
        return productImagesSet;
    }

    public void setProductImagesSet(Set<ProductImages> productImagesSet) {
        this.productImagesSet = productImagesSet;
    }

    public int getStatus() {
        return Status;
    }

    public void setStatus(int status) {
        Status = status;
    }
}
