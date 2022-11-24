package LifeLeopard.TeamShop.Service;

import LifeLeopard.TeamShop.Controllers.OrderController;
import LifeLeopard.TeamShop.Models.Customers;
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
import java.util.Optional;

@Service
public class OrderService {
    @Autowired
    private ProductOrderReps productOrderReps;
    @Autowired
    private OrderReps orderReps;
    @Autowired
    private ProductSizeReps productSizeReps;
    public List<Order> findAllByCustomer(Customers customers){
        return orderReps.findAllByCustomers(customers);
    }
    public Order findbyid(int id){
        return orderReps.getById(id);
    }
    public List<ProductOrder> findAllByOrder(Order order){
        return productOrderReps.findAllByOrder(order);
    }
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
            productSizeList.get(i).setQuantity(productSizeList.get(i).getQuantity()-quantityProduct[i]);
        }
        productOrderReps.saveAll(productOrderList);
        productSizeReps.saveAll(productSizeList);
    }
}
