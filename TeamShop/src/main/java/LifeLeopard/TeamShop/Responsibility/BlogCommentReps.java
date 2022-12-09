package LifeLeopard.TeamShop.Responsibility;

import LifeLeopard.TeamShop.Models.BlogComment;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BlogCommentReps extends JpaRepository<BlogComment,Integer> {
}
