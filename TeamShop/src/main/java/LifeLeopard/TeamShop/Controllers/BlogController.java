package LifeLeopard.TeamShop.Controllers;


import LifeLeopard.TeamShop.Models.*;
import LifeLeopard.TeamShop.Responsibility.AccountReps;
import LifeLeopard.TeamShop.Responsibility.BlogReps;
import LifeLeopard.TeamShop.Responsibility.CustomerRepos;
import LifeLeopard.TeamShop.Service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping(path="/blog")
public class BlogController {

    @Autowired
    private BlogService blogService;
    @Autowired
    CustomerService customerService;
    @Autowired
    AccountService accountService;
    @Autowired
    private EventService eventService;
    @Autowired
    private ContactService contactService;

    @GetMapping("")
    public String listBlog(Model model, Principal principal){
        if(principal != null){
            String username = principal.getName().trim();
            Customers customer =customerService.getByAccountId(accountService.getUsername(username).getAccountId());
            if(customer == null){
                return "redirect:/admin";
            }else{
                model.addAttribute("customer",customer);
            }

        }
        List<Event> eventList = eventService.getAllEventOn();
        Contact contact = contactService.getContact();
        model.addAttribute("contact",contact);
        model.addAttribute("eventList",eventList);
        model.addAttribute("listBlog", blogService.findAllBlog());
        return "home/blog";
    }
    @GetMapping("/{id}")
    public String blogDetails(@PathVariable("id") int id, Model model, Principal principal){
        if(principal != null){
            String username = principal.getName().trim();
            Customers customer =customerService.getByAccountId(accountService.getUsername(username).getAccountId());
            if(customer == null){
                return "redirect:/admin";
            }else{
                model.addAttribute("customer",customer);
            }

        }
        Optional<Blog>  blog = blogService.getBlogById(id);
        List<Event> eventList = eventService.getAllEventOn();
        Contact contact = contactService.getContact();
        model.addAttribute("contact",contact);
        model.addAttribute("eventList",eventList);
        model.addAttribute("blog", blog.get());
        return "home/blog-detail";
    }
}