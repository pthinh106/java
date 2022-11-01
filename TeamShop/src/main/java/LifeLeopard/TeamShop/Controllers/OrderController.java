package LifeLeopard.TeamShop.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = "order")
public class OrderController {
    @GetMapping("/cart")
    public String getCart(){
        return "home/shoping-cart";
    }
}
