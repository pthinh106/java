package LifeLeopard.TeamShop.Service;

import LifeLeopard.TeamShop.Models.BlogComment;
import LifeLeopard.TeamShop.Responsibility.BlogCommentReps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class BlogCommentService {
    @Autowired
    private BlogCommentReps blogCommentReps;
//    public Optional<BlogComment>  getBlogCmt(int id){
//        re
//    }
}

