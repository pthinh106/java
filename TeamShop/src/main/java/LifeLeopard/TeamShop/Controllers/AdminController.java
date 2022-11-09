package LifeLeopard.TeamShop.Controllers;

import LifeLeopard.TeamShop.Models.Employee;
import LifeLeopard.TeamShop.Models.Product;
import LifeLeopard.TeamShop.Models.ProductSize;
import LifeLeopard.TeamShop.Models.Size;
import LifeLeopard.TeamShop.Responsibility.*;
import LifeLeopard.TeamShop.Service.CategoryService;
import LifeLeopard.TeamShop.Service.ProductService;
import LifeLeopard.TeamShop.Service.SizeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(path = "/admin")
public class AdminController {
    @Autowired
    private EmployeeRepos employeeRepos;
    @Autowired
    private AccountReps accountReps;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private SizeService sizeService;
    @Autowired
    private ProductService productService;

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
        return "admin/admin.index";
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
    public String createProduct(Model model, Principal principal,@ModelAttribute("product") Product product,
                                @RequestParam("files") MultipartFile[] multipartFiles,
                                @RequestParam("details_quantity") int[] quantity,@RequestParam("details_status") int[] status,@RequestParam("details_price") double[] price) throws IOException {

        if(principal != null){
            String username = principal.getName().trim();
            Employee employee =employeeRepos.findByAccountId(accountReps.findByUsername(username).getAccountId());
            model.addAttribute("employee",employee);
        }
        List<ProductSize> productSizeList = new ArrayList<>(4);
        List<Size> sizeList = sizeService.getAllSize();
        for(int i = 0; i<4 ;i++){
            ProductSize productSize = new ProductSize();
            productSize.setSize(sizeList.get(i));
            productSize.setQuantity(quantity[i]);
            productSize.setStatus(status[i]);
            productSize.setPrice(price[i]);
            System.out.println(productSize.toString());
            productSizeList.add(productSize);
        }
        Product productRepos = productService.save(product,productSizeList);
        System.out.println(productRepos.toString());

        productService.saveImgProduct(productRepos,multipartFiles);
//        System.out.println(productSizes.get(0).toString());
        System.out.println("success");


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
