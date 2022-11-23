package LifeLeopard.TeamShop.Service;

import LifeLeopard.TeamShop.Models.HomeSlide;
import LifeLeopard.TeamShop.Responsibility.HomeSlideReps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HomeSildeService {
    @Autowired
    HomeSlideReps homeSlideReps;
    public List<HomeSlide> getAllHomeSlideOn(){
        return homeSlideReps.findAllByStatusIs(1);
    }
}
