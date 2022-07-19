package com.camp.campreservation.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.camp.campreservation.Service.IndexService;
import com.camp.campreservation.campdb.dto.CampDBDto;

@Controller
public class IndexController {
	
	@Autowired
	private IndexService indexService;
	
	@GetMapping("/")
	public String root(Model setImg) {
		
		List<CampDBDto> list = indexService.selectList();
		setImg.addAttribute("list",list);
		
		return "index";
	}
}
