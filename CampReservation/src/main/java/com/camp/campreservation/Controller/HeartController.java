package com.camp.campreservation.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.camp.campreservation.like.service.HeartService;

@Controller
@RequestMapping("/ht")
public class HeartController {
	
	@Autowired
	private HeartService heartService;
	
	@PostMapping("heart")
	@ResponseBody
	public int heart(@RequestParam("memberid") String memberid, @RequestParam("campid") int campid) {
		if(memberid.equals("")) {
			return -1;
		}else {
			heartService.heart(memberid, campid);
			return heartService.count(campid);
		}
		
	}
	
	@PostMapping("unheart")
	@ResponseBody
	public int unheart(@RequestParam("memberid") String memberid, @RequestParam("campid") int campid) {
		if(memberid.equals("")) {
			return -1;
		}else {
			heartService.unheart(memberid, campid);
			return heartService.count(campid);
		}
		
	}
}
