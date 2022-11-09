package LifeLeopard.TeamShop.Service;

import LifeLeopard.TeamShop.Models.Product;
import LifeLeopard.TeamShop.Models.ProductImages;
import LifeLeopard.TeamShop.Models.ProductSize;
import LifeLeopard.TeamShop.Responsibility.ProductImagesReps;
import LifeLeopard.TeamShop.Responsibility.ProductReps;
import LifeLeopard.TeamShop.Responsibility.ProductSizeReps;
import LifeLeopard.TeamShop.UploadImagesProduct.FileUploadUtil;
import net.bytebuddy.utility.RandomString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

@Service
public class ProductService {
    public static String UPLOAD_DIRECTORY = Paths.get("")
            .toAbsolutePath()
            .toString() + "/src/main/resources/static/images/product";
    @Autowired
    ProductReps productReps;
    @Autowired
    ProductSizeReps productSizeReps;
    @Autowired
    ProductImagesReps productImagesReps;
    public List<Product> getAllProduct(){
        return productReps.findAllByStatusIs(1);
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
    public void saveImgProduct(Product product, MultipartFile[] multipartFiles) throws IOException {
        List<String> urlImages =new ArrayList<>(4);
        for (MultipartFile multipartFile:multipartFiles) {
//            String FileName = StringUtils.getFilename(multipartFile.getOriginalFilename());
            String FileName = RandomString.make(10);
//            int index = FileName.lastIndexOf('.');
//            String Del = FileName.substring(index);
            String Ex = StringUtils.getFilenameExtension(StringUtils.cleanPath(multipartFile.getOriginalFilename()));
            FileName = FileName + LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"));
//            FileName = FileName.replace(Del,"");
            FileName = FileName.replace('.','-');
            FileName = FileName.replace(' ','-');
            FileName = FileName + "."+ Ex;
            String uploadDir = UPLOAD_DIRECTORY + "/"+ product.getProductId();
            String urlImg = new String();
            urlImg = "/images/product/" + product.getProductId() +"/"+ FileName;
            urlImages.add(urlImg);
            FileUploadUtil.saveFile(uploadDir,FileName,multipartFile);
            System.out.println(FileName);
        }
        for (String url:urlImages) {
            ProductImages productImages = new ProductImages();
            productImages.setProduct(product);
            productImages.setUrl(url);
            productImagesReps.save(productImages);
        }
        Product product1 = productReps.getById(product.getProductId());
        product1.setImages(urlImages.get(0));
        productReps.save(product1);
    }
}
