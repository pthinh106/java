package LifeLeopard.TeamShop.Service;

import LifeLeopard.TeamShop.Models.Blog;
import LifeLeopard.TeamShop.Responsibility.BlogReps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class BlogService {
    @Autowired
    BlogReps blogReps;

    public List<Blog> findAllBlog(){
        return blogReps.findAll();
    }

    public Optional<Blog> getBlogById(int id) {
        return blogReps.findById(id);
    }


}
