package LifeLeopard.TeamShop.Controllers;

import LifeLeopard.TeamShop.Models.Customers;
import LifeLeopard.TeamShop.Models.Employee;
import LifeLeopard.TeamShop.Responsibility.AccountReps;
import LifeLeopard.TeamShop.Responsibility.CustomerRepos;
import LifeLeopard.TeamShop.Responsibility.EmployeeRepos;
import LifeLeopard.TeamShop.Responsibility.RolesRepos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;

@Controller
@RequestMapping(path = "/admin")
public class AdminController {

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private EmployeeRepos employeeRepos;
    @Autowired
    private AccountReps accountReps;
    @Autowired
    private RolesRepos rolesReps;
    @GetMapping("")
    public String index(Model model, Principal principal){

        if(principal != null){
            String username = principal.getName().trim();
            Employee employee =employeeRepos.findByAccountId(accountReps.findByUsername(username).getAccountId());
            model.addAttribute("employee",employee);
        }
        return "admin/admin.index";
    }
    @GetMapping("/add")
    public String add(Model model, Principal principal){

        if(principal != null){
            String username = principal.getName().trim();
            Employee employee =employeeRepos.findByAccountId(accountReps.findByUsername(username).getAccountId());
            model.addAttribute("employee",employee);
        }
        return "admin/admin.index";
    }
}
