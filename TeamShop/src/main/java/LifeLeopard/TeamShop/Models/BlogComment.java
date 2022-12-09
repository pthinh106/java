package LifeLeopard.TeamShop.Models;

import lombok.Data;

import javax.persistence.*;
import java.sql.Timestamp;
import java.time.LocalDateTime;

@Entity
@Table(name = "table_blog_cmt")
@Data
public class BlogComment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cmt_id")
    private int commentId;
    @ManyToOne
    @JoinColumn(name = "blog_id")
    private Blog blog;

    @Column(name = "cmt")
    private String cmt;
    @ManyToOne
    @JoinColumn(name = "author_id ")
    private Customers customers;

    @Column(name = "created_at")
    private Timestamp createdAt;

}
