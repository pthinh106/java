package LifeLeopard.TeamShop.Controllers;

import LifeLeopard.TeamShop.Models.Accounts;
import LifeLeopard.TeamShop.Models.Customers;
import LifeLeopard.TeamShop.Responsibility.AccountReps;
import LifeLeopard.TeamShop.Responsibility.CustomerRepos;
import LifeLeopard.TeamShop.Responsibility.RolesRepos;
import LifeLeopard.TeamShop.Service.AccountService;
import LifeLeopard.TeamShop.Service.CustomerService;
import net.bytebuddy.utility.RandomString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.security.Principal;

@Controller
@RequestMapping(path = "/")
public class HomeController {
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    CustomerService customerService;
    @Autowired
    AccountService accountService;
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
        return "home/index";
    }
    @GetMapping("/login")
    public String login(Principal principal){
        if(principal != null){
            return "redirect:/";
        }
        return "home/login";
    }@GetMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/";
    }
    @GetMapping("/registration")
    public String registration(Model model){
        model.addAttribute("customer",new Customers());
        model.addAttribute("account",new Accounts());
//        model.addAttribute("account",new Accounts());
        return "home/registration";
    }
    private String getSiteURL(HttpServletRequest request) {
        String siteURL = request.getRequestURL().toString();
        return siteURL.replace(request.getServletPath(), "");
    }
    @PostMapping("/registration")
    public String registration(@ModelAttribute("customer") Customers customersDetails, @ModelAttribute("account") Accounts accountDetails,Model model, HttpServletRequest request)
            throws UnsupportedEncodingException, MessagingException {

        Boolean customers = customerRepos.existsByEmail(customersDetails.getEmail());
        if(customers){
            model.addAttribute("email_exists",true);
            return "home/registration";
        }

        String siteURL = request.getRequestURL().toString();
        if (customerService.createCustomer(customersDetails, accountDetails,siteURL)) {
            return "redirect:/register_success";
        } else {
            model.addAttribute("exists",true);
        }


//        System.out.println(pass);
//        accountReps.save(accounts);
//        model.addAttribute("customer",customersDetails);
//        model.addAttribute("account",accountDetails);
        return "home/registration";
    }
    @GetMapping("/registration/verify")
    public String verifyUser(@Param("code") String code) {
        if (accountService.verifyUser(code)) {
            return "home/verify_success";
        } else {
            return "home/verify_fail";
        }
    }

    @GetMapping("/recovery")
    public String resetPassword(Model model){
        model.addAttribute("email", new String());
        return "home/recovery";
    }
    @PostMapping("/recovery")
    public String resetPassword(@ModelAttribute("email") String Email,HttpServletRequest request, Model model) throws MessagingException, UnsupportedEncodingException {
//        System.out.println(Email);
        boolean exists = customerRepos.existsByEmail(Email);
        if(exists){
//            System.out.println(Email);
            String siteURL = request.getRequestURL().toString();
            Customers customers = customerRepos.findByEmail(Email);
            Accounts accounts = accountReps.getById(customers.getAccountId());
            String randomCode = RandomString.make(64);
            accounts.setResetPassCode(randomCode);
            accountReps.save(accounts);
            customerService.sendResetPassWord(customers,siteURL);
            return "redirect:/recovery_success";
        }else{
            model.addAttribute("notfound",true);
        }

        return "home/recovery";
    }
//    @GetMapping("/recovery/verify")
//    public String verifyPassword(@Param("code") String code) {
//       boolean exitst = accountReps.existsByResetPassCode(code);
//       if(exitst){
//           return "";
//       }else{
//           return "";
//       }
//    }
//    @PostMapping("/recovery/verify")
//    public String verifyPassword(@Param("code") String code) {
//        boolean exitst = accountReps.existsByResetPassCode(code);
//        if(exitst){
//            return "";
//        }else{
//            return "";
//        }
//    }
}
