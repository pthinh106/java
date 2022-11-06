package LifeLeopard.TeamShop.Service;

import LifeLeopard.TeamShop.Controllers.ProductController;
import LifeLeopard.TeamShop.Models.Product;
import LifeLeopard.TeamShop.Responsibility.ProductReps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {
    @Autowired
    ProductReps productReps;
    public List<Product> getAllProduct(){
        return productReps.findAll();
    }
    public Product getById(int id){
        return productReps.getById(id);
    }
}
