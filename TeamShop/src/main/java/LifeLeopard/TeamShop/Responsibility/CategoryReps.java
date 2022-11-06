package LifeLeopard.TeamShop.Responsibility;

import LifeLeopard.TeamShop.Models.Category;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryReps extends JpaRepository<Category,Integer> {
}
