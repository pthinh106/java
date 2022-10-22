package LifeLeopard.TeamShop.Responsibility;

import LifeLeopard.TeamShop.Models.Customers;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CustomerRepos extends JpaRepository<Customers,Integer> {
    Customers findByAccountId(int AccountId);

}
