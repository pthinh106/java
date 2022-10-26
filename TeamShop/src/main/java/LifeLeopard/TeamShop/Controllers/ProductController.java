package LifeLeopard.TeamShop.Controllers;

import LifeLeopard.TeamShop.Models.Customers;
import LifeLeopard.TeamShop.Responsibility.AccountReps;
import LifeLeopard.TeamShop.Responsibility.CustomerRepos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;

@Controller
@RequestMapping(path = "/{category}")
public class ProductController {
    @Autowired
    private CustomerRepos customerRepos;
    @Autowired
    private AccountReps accountReps;



    @GetMapping("")
    public String getAllProduct(@PathVariable String category, Model model, Principal principal){
        if(principal != null){
            String username = principal.getName().trim();
            Customers customer =customerRepos.findByAccountId(accountReps.findByUsername(username).getAccountId());
            if(customer == null){
                return "redirect:/admin";
            }
            model.addAttribute("customer",customer);
        }
        System.out.println(category);

        return "home/" + category;
    }
    @GetMapping("/{product}.html")
    public String getAllProduct(@PathVariable String product,@PathVariable String category,Model model, Principal principal){
        if(principal != null){
            String username = principal.getName().trim();
            Customers customer =customerRepos.findByAccountId(accountReps.findByUsername(username).getAccountId());
            if(customer == null){
                return "redirect:/admin";
            }
            model.addAttribute("customer",customer);
        }
//        System.out.println(type);
        return "home/" + product;
    }
//    @GetMapping("/{product}/{id}.html")
//    public String getAllProduct(@PathVariable String product,@PathVariable String category,@PathVariable String id){
////        System.out.println(type);
//        return "home/product-detail";
//    }
}
