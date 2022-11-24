package LifeLeopard.TeamShop.Controllers;

import LifeLeopard.TeamShop.Models.*;
import LifeLeopard.TeamShop.Responsibility.AccountReps;
import LifeLeopard.TeamShop.Responsibility.CustomerRepos;
import LifeLeopard.TeamShop.Service.CategoryService;
import LifeLeopard.TeamShop.Service.ContactService;
import LifeLeopard.TeamShop.Service.EventService;
import LifeLeopard.TeamShop.Service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

@Controller
@RequestMapping(path = "/product")
public class ProductController {
    @Autowired
    private CustomerRepos customerRepos;
    @Autowired
    private AccountReps accountReps;
    @Autowired
    private ProductService productService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private EventService eventService;
    @Autowired
    private ContactService contactService;


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
        List<Category> categoryList = categoryService.getAllCategoryOn();
        List<Product> productList = new ArrayList<>();
        if(keyword != null){
            productList = productService.getAllByName(keyword);
        }else{
            productList = productService.getAllProduct();
        }
        List<Event> eventList = eventService.getAllEventOn();
        Contact contact = contactService.getContact();
        model.addAttribute("contact",contact);
        model.addAttribute("eventList",eventList);
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
        List<Product> productListOther = productService.getOther();
        List<Event> eventList = eventService.getAllEventOn();
        Contact contact = contactService.getContact();
        model.addAttribute("contact",contact);
        model.addAttribute("eventList",eventList);
        model.addAttribute("product",product);
        model.addAttribute("productListOther",productListOther);
        return "home/product-detail";
    }
    @GetMapping("/test")
    public String test(){
        return "home/product-detail";
    }

}
