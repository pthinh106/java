package LifeLeopard.TeamShop.Responsibility;

import LifeLeopard.TeamShop.Models.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EmployeeRepos extends JpaRepository<Employee,Integer> {
    Employee findByAccountId(int AccountId);
}
