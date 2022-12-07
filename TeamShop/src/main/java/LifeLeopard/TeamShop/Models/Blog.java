package LifeLeopard.TeamShop.Models;

import lombok.*;

import javax.persistence.Entity;
import javax.persistence.*;
import java.sql.Date;
import java.time.LocalDateTime;


@Entity
@Table(name = "blogs")
public class Blog {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "blog_id")
    private int blogId;
    @Column(name = "blog_title")

    private String blogTitle;
    @Column(name = "blog_desc")

    private String blogDesc;
    @Column(name = "blog_content")

    private String blogContent;
    @OneToOne
    @JoinColumn(name = "Customer_id", nullable = false)
    private Customers customers;
    @Column(name = "created_at")
    private LocalDateTime createdAt;
    @Column(name = "blog_image")

    private String blogImage;

    public Blog() {
    }

    public int getBlogId() {
        return blogId;
    }

    public void setBlogId(int blogId) {
        this.blogId = blogId;
    }

    public String getBlogTitle() {
        return blogTitle;
    }

    public void setBlogTitle(String blogTitle) {
        this.blogTitle = blogTitle;
    }

    public String getBlogDesc() {
        return blogDesc;
    }

    public void setBlogDesc(String blogDesc) {
        this.blogDesc = blogDesc;
    }

    public String getBlogContent() {
        return blogContent;
    }

    public void setBlogContent(String blogContent) {
        this.blogContent = blogContent;
    }

    public Customers getCustomers() {
        return customers;
    }

    public void setCustomers(Customers customers) {
        this.customers = customers;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public String getBlogImage() {
        return blogImage;
    }

    public void setBlogImage(String blogImage) {
        this.blogImage = blogImage;
    }

    public Blog(int blogId, String blogTitle, String blogDesc, String blogContent, Customers customers, LocalDateTime createdAt, String blogImage) {
        this.blogId = blogId;
        this.blogTitle = blogTitle;
        this.blogDesc = blogDesc;
        this.blogContent = blogContent;
        this.customers = customers;
        this.createdAt = createdAt;
        this.blogImage = blogImage;
    }

    @Override
    public String toString() {
        return "Blog{" +
                "blogId=" + blogId +
                ", blogTitle='" + blogTitle + '\'' +
                ", blogDesc='" + blogDesc + '\'' +
                ", blogContent='" + blogContent + '\'' +
                ", customers=" + customers +
                ", createdAt=" + createdAt +
                ", blogImage='" + blogImage + '\'' +
                '}';
    }
}
