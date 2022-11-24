package LifeLeopard.TeamShop.Responsibility;

import LifeLeopard.TeamShop.Models.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderReps extends JpaRepository<Order,Integer> {
}
