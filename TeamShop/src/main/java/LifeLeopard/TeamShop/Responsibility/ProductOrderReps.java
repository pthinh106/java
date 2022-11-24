package LifeLeopard.TeamShop.Responsibility;

import LifeLeopard.TeamShop.Models.ProductOrder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductOrderReps extends JpaRepository<ProductOrder,Integer> {
}
