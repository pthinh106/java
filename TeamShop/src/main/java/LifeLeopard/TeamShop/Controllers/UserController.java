package LifeLeopard.TeamShop.Controllers;

import LifeLeopard.TeamShop.Models.Customers;
import LifeLeopard.TeamShop.Service.AccountService;
import LifeLeopard.TeamShop.Service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
        if(principal == null){
            return "redirect:/login";
        }
        String username = principal.getName().trim();
        Customers customer =customerService.getByAccountId(accountService.getUsername(username).getAccountId());
        model.addAttribute("customer",customer);


//        model.addAttribute("customer",customerService.getByAccountId(2));
        return "home/user/profile-user";
    }
    @GetMapping("/edit")
    public String editProfileUser(Model model,Principal principal){
        if(principal == null){
            return "redirect:/login";
        }
        String username = principal.getName().trim();
        Customers customer =customerService.getByAccountId(accountService.getUsername(username).getAccountId());
        model.addAttribute("customer",customer);
        return "home/user/edit-profile";
    }
    @PostMapping("/edit")
    public String editProfileUser(RedirectAttributes redirectAttrs, Principal principal,@ModelAttribute("customer") Customers customers, @RequestParam("password") String password){
        if(customerService.editProfile(customers,password,principal)){
            redirectAttrs.addFlashAttribute("edit_profile_success",true);
        }else{
            redirectAttrs.addFlashAttribute("edit_profile_fail",true);
        }
        return "redirect:/user";
    }
    @PostMapping("/reset/password")
    public String resetPassword(RedirectAttributes redirectAttrs, Principal principal, @RequestParam("current_password") String currentPassword,
                                @RequestParam("new_password") String newPassword, @RequestParam("confirm_password") String confirmPassword){
        if(newPassword.equals(confirmPassword) && !newPassword.isEmpty()){
            accountService.changesPassword(newPassword,principal);
            redirectAttrs.addFlashAttribute("changes_pass_success",true);
            System.out.println("changes_pass_success");
        }else{
            redirectAttrs.addFlashAttribute("changes_pass_fail",true);
            System.out.println("changes_pass_fail");
        }
        return "redirect:/user";
    }
}
