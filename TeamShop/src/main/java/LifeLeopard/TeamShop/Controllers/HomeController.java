package LifeLeopard.TeamShop.Controllers;

import LifeLeopard.TeamShop.Models.Accounts;
import LifeLeopard.TeamShop.Models.Customers;
import LifeLeopard.TeamShop.Models.Roles;
import LifeLeopard.TeamShop.Responsibility.AccountReps;
import LifeLeopard.TeamShop.Responsibility.CustomerRepos;
import LifeLeopard.TeamShop.Responsibility.RolesRepos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;

@Controller
@RequestMapping(path = "")
public class HomeController {
    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private CustomerRepos customerRepos;
    @Autowired
    private AccountReps accountReps;
    @Autowired
    private RolesRepos rolesReps;

    @GetMapping("/")
    public String index(Model model, Principal principal){
        if(principal != null){
            String username = principal.getName().trim();
            Customers customer =customerRepos.findByAccountId(accountReps.findByUsername(username).getAccountId());
            if(customer == null){
                return "redirect:/admin";
            }
            model.addAttribute("customer",customer);
        }
        return "home/home.index";
    }
    @GetMapping("/login")
    public String login(){
        return "home/home.login";
    }
    @GetMapping("/registration")
    public String registration(Model model){
        model.addAttribute("customer",new Customers());
        model.addAttribute("account",new Accounts());
//        model.addAttribute("account",new Accounts());
        return "home/home.registration";
    }
    @PostMapping("/registration")
    public String registration(@ModelAttribute("customer") Customers customersDetails, @ModelAttribute("account") Accounts accountDetails,Model model){

        boolean exists = accountReps.existsByUsername(accountDetails.getUsername().trim());
        if(exists){
            model.addAttribute("exist",true);
            return "home/home.registration";
        }else{
            Roles roles = rolesReps.findByRoleName("ROLE_USER");
            accountDetails.setRoles(roles);
            accountDetails.setStatus(1);
            accountDetails.setPassword(passwordEncoder.encode(accountDetails.getPassword()));
            try{
//                System.out.println(customers.toString());
                accountReps.save(accountDetails);
                Accounts accountrepos = accountReps.findByUsername(accountDetails.getUsername());
                System.out.println(accountrepos.toString());
                customersDetails.setAccountId(accountrepos.getAccountId());
                customerRepos.save(customersDetails);
                System.out.println(customersDetails.toString());
            }catch (Exception e){
                System.out.println(e);
                return "home/home.registration";
            }
        }



//        System.out.println(pass);
//        accountReps.save(accounts);
//        model.addAttribute("customer",customersDetails);
//        model.addAttribute("account",accountDetails);
            model.addAttribute("success",true);
        return "home/home.registration";
    }
}
