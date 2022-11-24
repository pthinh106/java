package LifeLeopard.TeamShop.Service;

import LifeLeopard.TeamShop.Controllers.OrderController;
import LifeLeopard.TeamShop.Models.Order;
import LifeLeopard.TeamShop.Models.ProductOrder;
import LifeLeopard.TeamShop.Models.ProductSize;
import LifeLeopard.TeamShop.Responsibility.OrderReps;
import LifeLeopard.TeamShop.Responsibility.ProductOrderReps;
import LifeLeopard.TeamShop.Responsibility.ProductSizeReps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class OrderService {
    @Autowired
    private ProductOrderReps productOrderReps;
    @Autowired
    private OrderReps orderReps;
    public void saveOrder(Order order, List<ProductSize> productSizeList,int[] quantityProduct){
        orderReps.save(order);
        List<ProductOrder> productOrderList = new ArrayList<>();
        for (int i = 0 ; i < productSizeList.size(); i++){
            ProductOrder productOrder = new ProductOrder();
            productOrder.setOrder(order);
            productOrder.setProductSize(productSizeList.get(i));
            productOrder.setPrice(productSizeList.get(i).getPrice());
            productOrder.setQuantity(quantityProduct[i]);
            productOrderList.add(productOrder);
        }
        productOrderReps.saveAll(productOrderList);
    }
}
