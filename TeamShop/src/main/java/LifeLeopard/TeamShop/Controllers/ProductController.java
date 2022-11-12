package LifeLeopard.TeamShop.Controllers;

import LifeLeopard.TeamShop.Models.Category;
import LifeLeopard.TeamShop.Models.Customers;
import LifeLeopard.TeamShop.Models.Product;
import LifeLeopard.TeamShop.Responsibility.AccountReps;
import LifeLeopard.TeamShop.Responsibility.CustomerRepos;
import LifeLeopard.TeamShop.Service.CategoryService;
import LifeLeopard.TeamShop.Service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(path = "/product")
public class ProductController {
    @Autowired
    private CustomerRepos customerRepos;
    @Autowired
    private AccountReps accountReps;
    @Autowired
    ProductService productService;
    @Autowired
    CategoryService categoryService;



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
        List<Category> categoryList = categoryService.getAllCategory();
        List<Product> productList = new ArrayList<>();
        if(keyword != null){
            productList = productService.getAllByName(keyword);
        }else{
            productList = productService.getAllProduct();
        }

        model.addAttribute("productList",productList);
        model.addAttribute("categoryList",categoryList);
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
        Product product = productService.getById(id);
        if(product == null){
            return "error";
        }
        model.addAttribute("product",product);
        return "home/product-detail";
    }
    @GetMapping("/test")
    public String test(){
        return "home/product-detail";
    }

}
