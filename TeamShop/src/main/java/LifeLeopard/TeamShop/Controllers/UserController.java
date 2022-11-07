package LifeLeopard.TeamShop.Controllers;

import LifeLeopard.TeamShop.Models.Customers;
import LifeLeopard.TeamShop.Service.AccountService;
import LifeLeopard.TeamShop.Service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    CustomerService customerService;
    @Autowired
    AccountService accountService;
    @GetMapping("")
    public String proFileUser(Model model,Principal principal){
//        if(principal != null){
//            String username = principal.getName().trim();
//            Customers customer =customerService.getByAccountId(accountService.getUsername(username).getAccountId());
//
//            if(customer == null){
//                return "error";
//            }else{
//                model.addAttribute("customer",customer);
//            }
//        }

        model.addAttribute("customer",customerService.getByAccountId(2));
        return "home/user/profile-user";
    }
    @GetMapping("/edit")
    public String editProfileUser(Model model,Principal principal){
        model.addAttribute("customer",customerService.getByAccountId(2));
        System.out.println(customerService.getByAccountId(2).toString());
        return "home/user/edit-profile";
    }
}
