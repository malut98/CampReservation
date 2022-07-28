package com.camp.campreservation.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.camp.campreservation.like.service.HeartService;

@Controller
@RequestMapping("/ht")
public class HeartController {
	
	@Autowired
	private HeartService heartService;
	
	@GetMapping("heart")
	public String heart() {
		heartService.heart();
		return null;
	}
	
	@GetMapping("unheart")
	public String unheart() {
		heartService.unheart();
		return null;
	}
}
