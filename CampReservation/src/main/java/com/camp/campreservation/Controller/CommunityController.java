package com.camp.campreservation.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.camp.campreservation.Service.CommunityService;

@Controller
public class CommunityController {
	
	@Autowired
	private CommunityService cs;
	
	@GetMapping("/communitylist")
	public String communityList(Model model) {
		
	model.addAttribute("list",cs.communitylist());
		return "communitylist";
	}
	
	@GetMapping("/communitywrite")
	public String communityWrite() {
		
		return "communitywrite";
	}
}
