package LifeLeopard.TeamShop.Controllers;

import LifeLeopard.TeamShop.Models.Customers;
import LifeLeopard.TeamShop.Models.Product;
import LifeLeopard.TeamShop.Responsibility.AccountReps;
import LifeLeopard.TeamShop.Responsibility.CustomerRepos;
import LifeLeopard.TeamShop.Responsibility.ProductReps;
import LifeLeopard.TeamShop.Service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;

@Controller
@RequestMapping(path = "/product")
public class ProductController {
    @Autowired
    private CustomerRepos customerRepos;
    @Autowired
    private AccountReps accountReps;
    @Autowired
    ProductService productService;



    @GetMapping("")
    public String getProduct(@Param("keyword") String keyword, Principal principal, Model model){
        if(principal != null){
            String username = principal.getName().trim();
            Customers customer =customerRepos.findByAccountId(accountReps.findByUsername(username).getAccountId());
            if(customer == null){
                return "redirect:/admin";
            }
            model.addAttribute("customer",customer);
        }
        if(keyword != null){
            return "home/product-detail";
        }
        return "home/product";
    }
    @GetMapping("/{id}")
    public String getAllProduct(@PathVariable int id,Model model, Principal principal){
        if(principal != null){
            String username = principal.getName().trim();
            Customers customer =customerRepos.findByAccountId(accountReps.findByUsername(username).getAccountId());
            if(customer == null){
                return "redirect:/admin";
            }
            model.addAttribute("customer",customer);
        }
//        Product product =  productService.getById(id);
//        System.out.println(product.getProductName());
        return "home/product-detail";
    }

}
