package com.camp.campreservation.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LodgingController {
	@GetMapping("/camplist")
	public String camplist() {
		
		return "camplist";
	}
	@GetMapping("/glamlist")
	public String glamlist() {
		
		return "glamlist";
	}
	@GetMapping("/caravanlist")
	public String caravanlist() {
		
		return "caravanlist";
	}
}
