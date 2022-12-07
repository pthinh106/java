package LifeLeopard.TeamShop.Responsibility;

import LifeLeopard.TeamShop.Models.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
@Transactional
public interface BlogReps extends JpaRepository<Product,Integer> {

}