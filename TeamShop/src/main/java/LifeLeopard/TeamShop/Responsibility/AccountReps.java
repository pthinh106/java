package LifeLeopard.TeamShop.Responsibility;

import LifeLeopard.TeamShop.Models.Accounts;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository

public interface AccountReps extends JpaRepository<Accounts,Integer> {
    Boolean existsByUsername(String Username);
    Accounts findByUsername(String Username);
}
