package LifeLeopard.TeamShop.Controllers;

import LifeLeopard.TeamShop.Models.Customers;
import LifeLeopard.TeamShop.Responsibility.AccountReps;
import LifeLeopard.TeamShop.Responsibility.CustomerRepos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
@Controller
public class HandleErrorController implements ErrorController {
    @Autowired
    CustomerRepos customerRepos;
    @Autowired
    AccountReps accountReps;
    @RequestMapping("/error")
    public String handleError(HttpServletRequest request , Principal principal, Model model) {
        if(principal != null){
            String username = principal.getName().trim();
            Customers customer =customerRepos.findByAccountId(accountReps.findByUsername(username).getAccountId());
            model.addAttribute("customer",customer);
        }
        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        if (status != null) {
            Integer statusCode = Integer.valueOf(status.toString());
            if (statusCode == HttpStatus.NOT_FOUND.value()) {
                return "error";
            } else if (statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
                return "error";
            }
        }
        return "error";
    }

}
