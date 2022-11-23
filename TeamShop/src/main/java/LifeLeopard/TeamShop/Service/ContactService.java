package LifeLeopard.TeamShop.Service;

import LifeLeopard.TeamShop.Models.Contact;
import LifeLeopard.TeamShop.Responsibility.ContactReps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ContactService {
    @Autowired
    private ContactReps contactReps;
    public Contact getContact(){
        return contactReps.findByStatusIs(1);
    }
}
