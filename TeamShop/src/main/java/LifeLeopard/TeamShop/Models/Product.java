package LifeLeopard.TeamShop.Models;


import javax.persistence.*;
import java.util.List;
import java.util.List;

@Entity
@Table(name = "table_products")
public class Product {
    @Id
    private int ProductId;
    @ManyToOne
    @JoinColumn(name = "Category_id")
    private Category category;
    @Column(name = "Product_name")
    private String ProductName;
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
    private List<ProductImages> productImagesList;

    @OneToMany(mappedBy = "product",cascade = CascadeType.ALL)
    private List<ProductSize> productSizeList;
    public Product(){}

    public Product(Category category, String productName, String images, String shortDescription, String description, int quantity, int status, List<ProductImages> productImagesList, List<ProductSize> productSizeList) {
        this.category = category;
        ProductName = productName;
        this.images = images;
        ShortDescription = shortDescription;
        Description = description;
        Quantity = quantity;
        Status = status;
        this.productImagesList = productImagesList;
        this.productSizeList = productSizeList;
    }

    public Product(int productId, Category category, String productName, String images, String shortDescription, String description, int quantity, int status, List<ProductImages> productImagesList) {
        ProductId = productId;
        this.category = category;
        ProductName = productName;
        this.images = images;
        ShortDescription = shortDescription;
        Description = description;
        Quantity = quantity;
        Status = status;
        this.productImagesList = productImagesList;
    }

    public Product(int productId, Category category, String images, String shortDescription, String description, int quantity, int status, List<ProductImages> productImagesList) {
        ProductId = productId;
        this.category = category;
        this.images = images;
        ShortDescription = shortDescription;
        Description = description;
        Quantity = quantity;
        Status = status;
        this.productImagesList = productImagesList;
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

    public Product(int productId, Category category, String productName, String images, String shortDescription, String description, int quantity, int status, List<ProductImages> productImagesList, List<ProductSize> productSizeList) {
        ProductId = productId;
        this.category = category;
        ProductName = productName;
        this.images = images;
        ShortDescription = shortDescription;
        Description = description;
        Quantity = quantity;
        Status = status;
        this.productImagesList = productImagesList;
        this.productSizeList = productSizeList;
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

    public List<ProductImages> getProductImagesList() {
        return productImagesList;
    }

    public void setProductImagesList(List<ProductImages> productImagesList) {
        this.productImagesList = productImagesList;
    }

    public List<ProductSize> getProductSizeList() {
        return productSizeList;
    }

    public void setProductSizeList(List<ProductSize> productSizeList) {
        this.productSizeList = productSizeList;
    }

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String productName) {
        ProductName = productName;
    }

    public int getStatus() {
        return Status;
    }

    public void setStatus(int status) {
        Status = status;
    }

}
