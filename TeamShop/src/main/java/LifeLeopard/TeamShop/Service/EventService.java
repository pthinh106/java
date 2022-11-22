package LifeLeopard.TeamShop.Service;

import LifeLeopard.TeamShop.Models.Event;
import LifeLeopard.TeamShop.Responsibility.EventReps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EventService {
    @Autowired
    private EventReps eventReps;
    public List<Event> getAllEventOn(){
        return eventReps.findAllByStatusIs(1);
    }
    public Event getEventByID(int id){
        return eventReps.getById(id);
    }
}
