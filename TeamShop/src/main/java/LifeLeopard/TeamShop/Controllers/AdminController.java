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
import org.springframework.web.bind.annotation.*;

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
    @GetMapping("/product/")
    public String getAllProduct(Model model, Principal principal){

        if(principal != null){
            String username = principal.getName().trim();
            Employee employee =employeeRepos.findByAccountId(accountReps.findByUsername(username).getAccountId());
            model.addAttribute("employee",employee);
        }
        return "admin/admin.index";
    }
    @GetMapping("/product/create")
    public String createNewProduct(Model model, Principal principal){

        if(principal != null){
            String username = principal.getName().trim();
            Employee employee =employeeRepos.findByAccountId(accountReps.findByUsername(username).getAccountId());
            model.addAttribute("employee",employee);
        }
        return "admin/create-product";
    }
    @PostMapping("/product/create")
    public String createProduct(Model model, Principal principal){
        System.out.println("success");
        if(principal != null){
            String username = principal.getName().trim();
            Employee employee =employeeRepos.findByAccountId(accountReps.findByUsername(username).getAccountId());
            model.addAttribute("employee",employee);
        }
        return "redirect:/admin/product/create";
    }
    @PostMapping("/product/update/{id}")
    public String updateProduct(Model model, Principal principal ,@PathVariable int id){
        System.out.println(id);
        if(principal != null){
            String username = principal.getName().trim();
            Employee employee =employeeRepos.findByAccountId(accountReps.findByUsername(username).getAccountId());
            model.addAttribute("employee",employee);
        }
        return "redirect:/admin/product/update/" + id;
    }
    @GetMapping("/product/update/{id}")
    public String getProductUpdateById(Model model, Principal principal ,@PathVariable int id){
        if(principal != null){
            String username = principal.getName().trim();
            Employee employee =employeeRepos.findByAccountId(accountReps.findByUsername(username).getAccountId());
            model.addAttribute("employee",employee);
        }
        return "admin/create-product";
    }

}
