package LifeLeopard.TeamShop.Controllers;

import LifeLeopard.TeamShop.Models.*;
import LifeLeopard.TeamShop.Responsibility.*;
import LifeLeopard.TeamShop.Service.CategoryService;
import LifeLeopard.TeamShop.Service.ProductService;
import LifeLeopard.TeamShop.Service.SizeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;


@Controller
@RequestMapping(path = "/admin")
public class AdminController {
//    public static String UPLOAD_DIRECTORY = Paths.get("")
//            .toAbsolutePath()
//            .toString() + "/src/main/resources/static";
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
    @Autowired
    private ProductPageReps productPageReps;

    @GetMapping("")
    public String index(Model model, Principal principal){

        if(principal != null){
            String username = principal.getName().trim();
            Employee employee =employeeRepos.findByAccountId(accountReps.findByUsername(username).getAccountId());
            model.addAttribute("employee",employee);
        }
//        System.out.println(UPLOAD_DIRECTORY);
        return "admin/admin.index";
    }
    @GetMapping("/product")
    public String getAllProduct(Model model, Principal principal,@RequestParam(value = "page",defaultValue = "1") int page){

        if(principal != null){
            String username = principal.getName().trim();
            Employee employee =employeeRepos.findByAccountId(accountReps.findByUsername(username).getAccountId());
            model.addAttribute("employee",employee);
        }
        int pagesize =10;
        Pageable pageable = PageRequest.of(page-1,pagesize);
        int totalPages = productPageReps.findAll(pageable).getTotalPages();
        List<Product> productList = productPageReps.findAll(pageable).getContent();
        model.addAttribute("productList",productList);
        model.addAttribute("totalPages",totalPages);
        model.addAttribute("currentPage",page);

        return "admin/show-all-product";
    }
    @PostMapping("/product")
    public String findProduct(@RequestParam("keyword") String keyword, @RequestParam("search") int search, Model model){
        System.out.println(keyword);
        System.out.println(search);
        List<Product> productList = new ArrayList<>();
        try {
            if(search == 0){
                Product product =  productService.getById(Integer.parseInt(keyword));
                productList.add(product);
            }else{
                productList = productService.getAllByName(keyword);
            }
        }catch (Exception e){
            return "admin/admin-error";
        }

        model.addAttribute("productList",productList);
        System.out.println(productList.get(0).toString());
        return "admin/show-all-product";
//        return null;
    }
    @GetMapping("/product/create")
    public String createNewProduct(Model model, Principal principal){


        if(principal != null){
            String username = principal.getName().trim();
            Employee employee =employeeRepos.findByAccountId(accountReps.findByUsername(username).getAccountId());
            model.addAttribute("employee",employee);
        }
        model.addAttribute("product",new Product());
        model.addAttribute("categoryList",categoryService.getAllCategory());
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

        List<Size> sizeList = sizeService.getAllSize();
        List<ProductSize> productSizeList = new ArrayList<>(sizeList.size());
        for(int i = 0; i<sizeList.size() ;i++){
            ProductSize productSize = new ProductSize();
            productSize.setSize(sizeList.get(i));
            productSize.setQuantity(quantity[i]);
            if(quantity[i] == 0){
                status[i] = 0;
            }
            productSize.setStatus(status[i]);
            productSize.setPrice(price[i]);
            productSizeList.add(productSize);
        }
        Product productRepos = productService.save(product,productSizeList);
        System.out.println(productRepos.toString());

        productService.saveImgProduct(productRepos,multipartFiles);
//        System.out.println(productSizes.get(0).toString());
        System.out.println("success");
        model.addAttribute("create_product_success");

        return "redirect:/admin/product/create";
    }
    @GetMapping("/product/update/{id}")
    public String getProductUpdateById(Model model, Principal principal ,@PathVariable int id){
        if(principal != null){
            String username = principal.getName().trim();
            Employee employee =employeeRepos.findByAccountId(accountReps.findByUsername(username).getAccountId());
            model.addAttribute("employee",employee);
        }
        Product product = productService.getById(id);
//        System.out.println(product.getProductImagesList().size());
        model.addAttribute("product",product);
        model.addAttribute("categoryList",categoryService.getAllCategory());
        return "admin/update-product";
    }
    @PostMapping("/product/update/{id}")
    public String updateProduct(@PathVariable("id") int id,Model model, Principal principal,@ModelAttribute("product") Product productDetails,
                                @RequestParam("files") MultipartFile[] multipartFiles,
                                @RequestParam("details_quantity") int[] quantity,@RequestParam("details_status") int[] status,@RequestParam("details_price") double[] price) throws IOException {

        productService.updateProduct(id,productDetails,multipartFiles,quantity,status,price);
        model.addAttribute("update_product_success");
        return "redirect:/admin/product";
    }

}
