package LifeLeopard.TeamShop.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = "/product")
public class ProductController {
    @GetMapping("")
    public String getAllProduct(){
        return "home/product";
    }
}
