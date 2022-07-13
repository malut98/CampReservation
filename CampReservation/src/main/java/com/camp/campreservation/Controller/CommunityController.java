package com.camp.campreservation.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommunityController {
	
	@GetMapping("/communitylist")
	public String communityList() {
		System.out.println("hi");
		return "communitylist";
	}
}
