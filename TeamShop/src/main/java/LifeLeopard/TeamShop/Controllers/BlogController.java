package LifeLeopard.TeamShop.Controllers;


import org.apache.maven.model.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = "/blogg")
public class BlogController {
    @GetMapping("/index")
    public String index(Model model){
        return "home/blogg";
    }
}
