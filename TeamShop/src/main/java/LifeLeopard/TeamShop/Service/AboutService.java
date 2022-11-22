package LifeLeopard.TeamShop.Service;

import LifeLeopard.TeamShop.Models.About;
import LifeLeopard.TeamShop.Responsibility.AboutReps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AboutService {
    @Autowired
    private AboutReps aboutReps;
    public List<About> getAllAboutOn(){
        return aboutReps.findAllByStatusIs(1);
    }
}
