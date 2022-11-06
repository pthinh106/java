package LifeLeopard.TeamShop.Responsibility;

import LifeLeopard.TeamShop.Models.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public interface CategoryReps extends JpaRepository<Category,Integer> {
}
