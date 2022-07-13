package com.camp.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/community")
public class CommunityController {
	
	@GetMapping("/list")
	public String communityList() {
		
		return "communitylist";
	}
}
