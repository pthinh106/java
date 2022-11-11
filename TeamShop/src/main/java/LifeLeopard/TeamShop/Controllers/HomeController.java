package LifeLeopard.TeamShop.Controllers;

import LifeLeopard.TeamShop.Models.Accounts;
import LifeLeopard.TeamShop.Models.Customers;
import LifeLeopard.TeamShop.Responsibility.AccountReps;
import LifeLeopard.TeamShop.Responsibility.CustomerRepos;
import LifeLeopard.TeamShop.Service.AccountService;
import LifeLeopard.TeamShop.Service.CustomerService;
import LifeLeopard.TeamShop.Service.ProductService;
import net.bytebuddy.utility.RandomString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.Banner;
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
import java.util.ArrayList;

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
    ProductService productService;
    @Autowired
    private CustomerRepos customerRepos;
    @Autowired
    private AccountReps accountReps;


    @GetMapping("/")
    public String index(Model model, Principal principal){
        if(principal != null){
            String username = principal.getName().trim();
            Customers customer =customerService.getByAccountId(accountService.getUsername(username).getAccountId());
            if(customer == null){
                return "redirect:/admin";
            }else{
                model.addAttribute("customer",customer);
            }

        }
        return "home/index";
    }

    @GetMapping("/login")
    public String login(Principal principal){
        if(principal != null){
            return "redirect:/";
        }
        return "home/login";
    }
    @GetMapping("/login-error")
    public String loginError(Model model){
        model.addAttribute("error",true);
        System.out.println("login_fail");
        return "home/login";
    }
    @GetMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/";
    }
    @GetMapping("/registration")
    public String registration(Model model,Principal principal){
        if(principal != null){
            return "redirect:/";
        }
        model.addAttribute("customer",new Customers());
        model.addAttribute("account",new Accounts());
//        model.addAttribute("account",new Accounts());
        return "home/registration";
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
            return "redirect:/registration/success";
        } else {
            model.addAttribute("exists",true);
        }
        return "home/registration";
    }
    @GetMapping("/registration/success")
    public String registerSuccess(){
        return "home/register_success";
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
    public String resetPassword(Model model,Principal principal){
        if(principal != null){
            return "redirect:/";
        }
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
            return "redirect:/recovery/success";
        }else{
            model.addAttribute("notfound",true);
        }
        return "home/recovery";
    }
    @GetMapping("/recovery/success")
    public String resetPasswordSuccess(Model model){
        return "home/recovery_success";
    }
    @GetMapping("/recovery/verify")
    public String verifyPassword(@Param("code") String code,Model model) {
        boolean exists = accountReps.existsByResetPassCode(code);
        if(exists){
            model.addAttribute("password1",new String());
            model.addAttribute("password2",new String());
            model.addAttribute("code","/recovery/verify?code="+code);
            System.out.println(code);
            return "home/verify_password";
        }
        return "error";

    }
    @PostMapping("/recovery/verify")
    public String verifyPassword(@Param("code") String code,@ModelAttribute("password1") String password1, @ModelAttribute("password2") String password2,Model model) {
        System.out.println(password1);
        System.out.println(password2);
        if(password1.contentEquals(password2) && !password1.isEmpty() && !password2.isEmpty()){
//            System.out.println("success");
            System.out.println(code);
            if(accountService.verifyPassword(code, password1)){
//                System.out.println("success_verify");
                return "home/verify_password_success";
            }else{
                System.out.println("fail_verify");
                return "home/verify_fail";
            }
        }else{
            System.out.println("fail_same");
            model.addAttribute("error",true);
        }
        return "home/verify_password";

    }
    @GetMapping("/s")
    public String gt(Model model){
        ArrayList<Integer> arrayList = new ArrayList<>();
        ArrayList<Integer> arrayList2 = new ArrayList<>();
        for(Integer i = 0; i<=66;i++){
            arrayList.add(i);
        }
        for(Integer i = 1; i<=162;i++){
            arrayList2.add(i);
        }
        model.addAttribute("stt",arrayList);
        model.addAttribute("chap",arrayList2);
        return "home/test";
    }
    @GetMapping("/contact")
    public String contact(Model model){
        return "home/contact";
    }

    @GetMapping("/about")
    public String about(Model model){
        return "home/about";
    }
}
