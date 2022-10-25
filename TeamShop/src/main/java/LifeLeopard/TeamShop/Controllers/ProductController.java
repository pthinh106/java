package LifeLeopard.TeamShop.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = "/{category}")
public class ProductController {

    @GetMapping("")
    public String getAllProduct(@PathVariable String category){
        System.out.println(category);

        return "home/" + category;
    }
    @GetMapping("/{product}.html")
    public String getAllProduct(@PathVariable String product,@PathVariable String category){
//        System.out.println(type);
        return "home/" + product;
    }
//    @GetMapping("/{product}/{id}.html")
//    public String getAllProduct(@PathVariable String product,@PathVariable String category,@PathVariable String id){
////        System.out.println(type);
//        return "home/product-detail";
//    }
}
