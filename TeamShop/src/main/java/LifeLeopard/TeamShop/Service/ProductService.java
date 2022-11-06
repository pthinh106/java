package LifeLeopard.TeamShop.Service;

import LifeLeopard.TeamShop.Models.Product;
import LifeLeopard.TeamShop.Models.ProductImages;
import LifeLeopard.TeamShop.Models.ProductSize;
import LifeLeopard.TeamShop.Responsibility.ProductImagesReps;
import LifeLeopard.TeamShop.Responsibility.ProductReps;
import LifeLeopard.TeamShop.Responsibility.ProductSizeReps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ProductService {
    @Autowired
    ProductReps productReps;
    @Autowired
    ProductSizeReps productSizeReps;
    @Autowired
    ProductImagesReps productImagesReps;
    public List<Product> getAllProduct(){
        return productReps.findAll();
    }
    public Product getById(int id){
        return productReps.getById(id);
    }
    @Transactional
    public Product save(Product product, List<ProductSize> productSizeList){
        productReps.save(product);
        for (ProductSize productSize:productSizeList) {
            productSize.setProduct(product);
            System.out.println(productSize.toString());
        }
        productSizeReps.saveAll(productSizeList);
        return product;
    }
    public void saveImgProduct(Product product,List<String> UrlList){
        for (String url:UrlList) {
            ProductImages productImages = new ProductImages();
            productImages.setProduct(product);
            productImages.setUrl(url);
            productImagesReps.save(productImages);
        }
        Product product1 = productReps.getById(product.getProductId());
        product1.setImages(UrlList.get(0));
        productReps.save(product1);
    }
}
