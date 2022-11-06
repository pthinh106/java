package LifeLeopard.TeamShop.Responsibility;

import LifeLeopard.TeamShop.Models.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface ProductReps extends JpaRepository<Product,Integer> {
}
