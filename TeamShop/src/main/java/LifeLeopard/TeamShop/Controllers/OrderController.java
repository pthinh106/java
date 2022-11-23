package LifeLeopard.TeamShop.Controllers;

import LifeLeopard.TeamShop.Models.Contact;
import LifeLeopard.TeamShop.Models.Event;
import LifeLeopard.TeamShop.Service.ContactService;
import LifeLeopard.TeamShop.Service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping(path = "order")
public class OrderController {
    @Autowired
    private EventService eventService;
    @Autowired
    private ContactService contactService;
    @GetMapping("/cart")
    public String getCart(Model model){
        List<Event> eventList = eventService.getAllEventOn();
        Contact contact = contactService.getContact();
        model.addAttribute("contact",contact);
        model.addAttribute("eventList",eventList);
        return "home/shoping-cart";
    }
}
