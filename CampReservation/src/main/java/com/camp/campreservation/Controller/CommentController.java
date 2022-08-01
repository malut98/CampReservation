package com.camp.campreservation.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.camp.campreservation.Dto.CommentDto;
import com.camp.campreservation.Service.CommentService;

@Controller
public class CommentController {

	@Autowired
	private CommentService cs;
	
	@GetMapping("commentwrite")
	public String commentwrite(CommentDto comment, HttpSession session) {
		System.out.println(comment.getMember_id());
		
		
		int res = cs.commentwrite(comment);
		
		if(res>0) {
			return "redirect:Community/communitydetail?com_num="+comment.getCom_num();
		}else {
			
			return "redirect:Community/communitydetail?com_num="+comment.getCom_num();
			
		}
		
		
	}
	
	@GetMapping("commentdelete")
	public String onlycommentdelete(CommentDto comment) {
		
		int res =cs.onlycommentdelete(comment);
		if(res>0) {
			return "redirect:Community/communitydetail?com_num="+comment.getCom_num();
		}else {
		return "redirect:Community/communitydetail?com_num="+comment.getCom_num();
	}
	}
	
}
