package LifeLeopard.TeamShop.Controllers;

import LifeLeopard.TeamShop.Models.Employee;
import LifeLeopard.TeamShop.Models.Product;
import LifeLeopard.TeamShop.Models.ProductSize;
import LifeLeopard.TeamShop.Responsibility.*;
import LifeLeopard.TeamShop.Service.CategoryService;
import LifeLeopard.TeamShop.Service.SizeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(path = "/admin")
public class AdminController {

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private EmployeeRepos employeeRepos;
    @Autowired
    private AccountReps accountReps;
    @Autowired
    private RolesRepos rolesReps;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private SizeService sizeService;

    @GetMapping("")
    public String index(Model model, Principal principal){

        if(principal != null){
            String username = principal.getName().trim();
            Employee employee =employeeRepos.findByAccountId(accountReps.findByUsername(username).getAccountId());
            model.addAttribute("employee",employee);
        }
        return "admin/admin.index";
    }
    @GetMapping("/product/")
    public String getAllProduct(Model model, Principal principal){

        if(principal != null){
            String username = principal.getName().trim();
            Employee employee =employeeRepos.findByAccountId(accountReps.findByUsername(username).getAccountId());
            model.addAttribute("employee",employee);
        }
        return "aquantitydmin/admin.index";
    }
    @GetMapping("/product/create")
    public String createNewProduct(Model model, Principal principal){


        if(principal != null){
            String username = principal.getName().trim();
            Employee employee =employeeRepos.findByAccountId(accountReps.findByUsername(username).getAccountId());
            model.addAttribute("employee",employee);
        }
        model.addAttribute("product",new Product());
        model.addAttribute("product_size",new ArrayList<ProductSize>(4));
        model.addAttribute("categorys",categoryService.getAllCategory());
        model.addAttribute("sizes",sizeService.getAllSize());
        return "admin/create-product";
    }
    @PostMapping("/product/create")
    public String createProduct(Model model, Principal principal,@ModelAttribute("product") Product product, @RequestParam("files") MultipartFile[] MultipartFile,
                                @RequestParam("quantity") int[] quantity,@RequestParam("status") int[] status,@RequestParam("price") double[] price){

        System.out.println(product.toString());
        System.out.println(quantity[1]);
        System.out.println(status[2]);
        System.out.println(price[3]);
        String profilePictureFileName = StringUtils.cleanPath(MultipartFile[0].getOriginalFilename());
        System.out.println(profilePictureFileName);
//        System.out.println(productSizes.get(0).toString());
        System.out.println("success");
        if(principal != null){
            String username = principal.getName().trim();
            Employee employee =employeeRepos.findByAccountId(accountReps.findByUsername(username).getAccountId());
            model.addAttribute("employee",employee);
        }

        return "redirect:/admin/product/create";
    }
    @PostMapping("/product/update/{id}")
    public String updateProduct(Model model, Principal principal ,@PathVariable int id){
        System.out.println(id);
        if(principal != null){
            String username = principal.getName().trim();
            Employee employee =employeeRepos.findByAccountId(accountReps.findByUsername(username).getAccountId());
            model.addAttribute("employee",employee);
        }
        return "redirect:/admin/product/update/" + id;
    }
    @GetMapping("/product/update/{id}")
    public String getProductUpdateById(Model model, Principal principal ,@PathVariable int id){
        if(principal != null){
            String username = principal.getName().trim();
            Employee employee =employeeRepos.findByAccountId(accountReps.findByUsername(username).getAccountId());
            model.addAttribute("employee",employee);
        }
        return "admin/create-product";
    }

}
