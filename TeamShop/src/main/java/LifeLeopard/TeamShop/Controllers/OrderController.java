package LifeLeopard.TeamShop.Controllers;

import LifeLeopard.TeamShop.Models.*;
import LifeLeopard.TeamShop.Responsibility.ProductSizeReps;
import LifeLeopard.TeamShop.Service.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonObjectFormatVisitor;
import com.fasterxml.jackson.databind.util.JSONPObject;
import org.apache.tomcat.util.json.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.jackson.JsonObjectDeserializer;
import org.springframework.data.relational.core.sql.In;
import org.springframework.data.repository.query.Param;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.security.Principal;
import java.util.*;

@Controller
@RequestMapping(path = "order")
public class OrderController {
    @Autowired
    private EventService eventService;
    @Autowired
    private ContactService contactService;
    @Autowired
    CustomerService customerService;
    @Autowired
    AccountService accountService;
    @Autowired
    ProductSizeReps productSizeReps;
    @Autowired
    ProductService productService;
    @Autowired
    OrderService orderService;
    @GetMapping("/cart")
    public String getCart(Model model, Principal principal,HttpServletRequest request){
        if(principal != null){
            String username = principal.getName().trim();
            Customers customer =customerService.getByAccountId(accountService.getUsername(username).getAccountId());
            model.addAttribute("customer",customer);
        }
        List<ProductSize> productSizeList = new ArrayList<>();
        String value = String.valueOf(Arrays.stream(request.getCookies()).filter(cookie -> cookie.getName().equals("cart")).map(Cookie::getValue).findAny());
        value = value.replace("Optional","");
        value = value.replace(".empty","");
        value = value.replace("[","");
        value = value.replace("]","");
        if(!value.isEmpty()) {
            productSizeList = productService.getProductCart(value);
        }
        double total = 0;
        for(ProductSize p :productSizeList){
            total = total + p.getPrice();
        }

        List<Event> eventList = eventService.getAllEventOn();
        Contact contact = contactService.getContact();
        model.addAttribute("orderInformation", new Order());
        model.addAttribute("productSizeList",productSizeList);
        model.addAttribute("contact",contact);
        model.addAttribute("eventList",eventList);
        model.addAttribute("total",total);
        return "home/cart";
    }
    @PostMapping("/buynow")
    public String buyNow(@ModelAttribute("orderInformation") Order orderDetails, @RequestParam("numProduct") int[] quantityProduct, Model model, HttpServletRequest request, HttpServletResponse response, Principal principal, RedirectAttributes redirectAttributes){
        Customers customer;
        if(principal != null){
            String username = principal.getName().trim();
            customer = customerService.getByAccountId(accountService.getUsername(username).getAccountId());
            model.addAttribute("customer",customer);
        }else{
            return "redirect:/user/login";
        }

        List<ProductSize> productSizeList = new ArrayList<>();
        String value = String.valueOf(Arrays.stream(request.getCookies()).filter(cookie -> cookie.getName().equals("cart")).map(Cookie::getValue).findAny());
        value = value.replace("Optional","");
        value = value.replace(".empty","");
        value = value.replace("[","");
        value = value.replace("]","");
        if(value.isEmpty()){
            redirectAttributes.addFlashAttribute("Cart_is_null", true);
            return "redirect:/order/cart";
        }
        productSizeList = productService.getProductCart(value);
        double total = 0;
        for (int i = 0 ;i < productSizeList.size();i ++){
            total = total + productSizeList.get(i).getPrice() * quantityProduct[i];
        }
        if(orderDetails.getFirstName().isEmpty()){
            orderDetails.setFirstName(customer.getFirstName());
        }
        if(orderDetails.getLastName().isEmpty()){
            orderDetails.setLastName(customer.getLastName());
        }
        if(orderDetails.getAddress().isEmpty()){
            orderDetails.setAddress(customer.getAddress());
        }
        if(orderDetails.getPhoneNumber().isEmpty()){
            orderDetails.setPhoneNumber(customer.getPhoneNumber());
        }
        System.out.println(total);
        orderDetails.setTotal(total);
        orderDetails.setCustomers(customer);
        orderService.saveOrder(orderDetails,productSizeList,quantityProduct);
        Cookie cookie = new Cookie("cart", null);
        cookie.setMaxAge(0);
        cookie.setSecure(true);
        cookie.setHttpOnly(true);
        cookie.setPath("/");
        response.addCookie(cookie);
        redirectAttributes.addFlashAttribute("Buy_success",true);
        return "redirect:/order/cart";
    }
    @PostMapping(value = "/addtocart",produces = "application/json")
    @ResponseBody
    public ResponseEntity<Boolean> addToCart1(@RequestParam("productSizeId") int sizeId, @RequestParam("productId") int itemId ,@RequestParam("numProduct") int numProduct, HttpServletResponse response,HttpServletRequest request){
        String name = "cart";
        String value = String.valueOf(Arrays.stream(request.getCookies()).filter(cookie -> name.equals(cookie.getName())).map(Cookie::getValue).findAny());
        value = value.replace("Optional","");
        value = value.replace(".empty","");
        value = value.replace("[","");
        value = value.replace("]","");
        System.out.println(value);
        String valueCookie = String.valueOf(sizeId);
        if(!value.isEmpty() && !value.contains(valueCookie)){
            value = value +"-"+valueCookie;
            Cookie cookie = new Cookie("cart",value);
            cookie.setMaxAge(86400);
            cookie.setSecure(true);
            cookie.setHttpOnly(true);
            cookie.setPath("/");
            response.addCookie(cookie);
            return ResponseEntity.ok().body(true);
        }else{
            if(!value.isEmpty()){
                Cookie cookie = new Cookie("cart",value);
                cookie.setMaxAge(86400);
                cookie.setSecure(true);
                cookie.setHttpOnly(true);
                cookie.setPath("/");
                response.addCookie(cookie);
                return ResponseEntity.ok().body(false);
            }else{
                value = valueCookie;
                Cookie cookie = new Cookie("cart",value);
                cookie.setMaxAge(86400);
                cookie.setSecure(true);
                cookie.setHttpOnly(true);
                cookie.setPath("/");
                response.addCookie(cookie);
                return ResponseEntity.ok().body(true);
            }
        }
    }
    @GetMapping(value = "/price",produces = "application/json")
    @ResponseBody
    public double getPrice(@Param("size") String size){
        int id = Integer.parseInt(size);
        return productSizeReps.findById(id).get().getPrice();
    }
    @PostMapping(value = "/updatecart",produces = "application/json")
    public ResponseEntity<Boolean> updateCart(@Param("id") String id,
            HttpServletResponse response,HttpServletRequest request){
        String name = "cart";
        String value = String.valueOf(Arrays.stream(request.getCookies()).filter(cookie -> name.equals(cookie.getName())).map(Cookie::getValue).findAny());
        String idDelate = id+"-";
        String idDel = "-"+id;
        if(value.contains(idDelate)){
            value.replace(idDelate,"");
        }else{
            if(value.contains(idDel)){
                value.replace(idDel,"");
            }else{
                value = "";
            }
        }
        if(!value.isEmpty()){
            Cookie cookie = new Cookie("cart",value);
            cookie.setMaxAge(86400);
            cookie.setSecure(true);
            cookie.setHttpOnly(true);
            cookie.setPath("/");
            response.addCookie(cookie);
            return ResponseEntity.ok().body(true);
        }else{
            Cookie cookie = new Cookie("cart", null);
            cookie.setMaxAge(0);
            cookie.setSecure(true);
            cookie.setHttpOnly(true);
            cookie.setPath("/");
            response.addCookie(cookie);
            return ResponseEntity.ok().body(true);
        }


    }
    @PostMapping(value = "/addtocart2",produces = "application/json")
    @ResponseBody
    public ResponseEntity<Boolean> addToCart(@RequestParam("productSizeId") int sizeId, @RequestParam("productId") int itemId ,@RequestParam("numProduct") int numProduct, HttpServletResponse response,HttpServletRequest request) throws JsonProcessingException {
        String valueDetails = "";
        Map<String, Integer> dataDetails = new HashMap<String, Integer>();
        Map<String, Map<String,Integer>> mapDetails = new HashMap<String, Map<String,Integer>>();
        Map<String, List<Map<String, Map<String,Integer>>> > cartDetails = new HashMap<String, List<Map<String, Map<String,Integer>>>>();
        List<Map<String, Map<String,Integer>>> dataCookie = new ArrayList<>();
        Cookie[] cookies = request.getCookies();
        Boolean check = true;
        Boolean checkdup = false;
        for(Cookie c : cookies){
            if(c.getName().equals("cart")){
                valueDetails = c.getValue();
                valueDetails = valueDetails.replace('%','"');
                valueDetails = valueDetails.replace('_',',');
                valueDetails = valueDetails.replace('-','\\');
                cartDetails = new ObjectMapper().readValue(valueDetails,Map.class);
                dataCookie = cartDetails.get("data");
                System.out.println(cartDetails);
            }
        }
        dataDetails.put("itemId", itemId);
        dataDetails.put("total", numProduct);
        dataDetails.put("size", sizeId);
        mapDetails.put(String.valueOf(itemId), dataDetails);
        for(Map<String, Map<String,Integer>> m : dataCookie){
            for(Map.Entry<String, Map<String,Integer>> mapEntry : m.entrySet()){
                if(mapEntry.getKey().equals(String.valueOf(itemId))){
                    if(m.get(mapEntry.getKey()).get("size") == sizeId){
                        System.out.println(m.get(mapEntry.getKey()).get("total"));
                        System.out.println(numProduct);
                        int total = numProduct + m.get(mapEntry.getKey()).get("total");
                        System.out.println(total);
                        m.get(mapEntry.getKey()).put("total",total);
                        System.out.println(m.get(mapEntry.getKey()).get("total"));

                        check = false;
                        break;
                    }
                }
            }
            if(!check){
                break;
            }
        }
        if(dataCookie.size() < 1){
            dataCookie.add(mapDetails);
        }else{
            if(check){
                dataCookie.add(mapDetails);
            }
        }
        cartDetails.put("data",dataCookie);
        System.out.println(cartDetails);
        valueDetails = new ObjectMapper().writeValueAsString(cartDetails);
        System.out.println(valueDetails);
        valueDetails = valueDetails.replace('"','%');
        valueDetails = valueDetails.replace(',','_');
        valueDetails = valueDetails.replace('\\','-');
        Cookie cookie = new Cookie("cart",valueDetails);
        cookie.setMaxAge(86400);
        cookie.setSecure(true);
        cookie.setHttpOnly(true);
        cookie.setPath("/");
        response.addCookie(cookie);
        return ResponseEntity.ok().body(true);
    }
}
