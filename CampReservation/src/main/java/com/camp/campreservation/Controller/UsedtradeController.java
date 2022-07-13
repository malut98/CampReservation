package com.camp.campreservation.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UsedtradeController {
	@GetMapping("/usedtradelist")
	public String communityList() {
		System.out.println("hi");
		return "usedtradelist";
	}
}
