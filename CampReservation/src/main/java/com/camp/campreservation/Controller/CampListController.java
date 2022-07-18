package com.camp.campreservation.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.camp.campreservation.campdb.dto.CampDBDto;
import com.camp.campreservation.camplist.service.CampListService;

@Controller
@RequestMapping("/clist")
public class CampListController {

	@Autowired
	private CampListService campListService;

	@GetMapping("/cpl")
	public String campList(Model model) {
		List<CampDBDto> campDto = campListService.campList();
		model.addAttribute("camp",campDto);
		return "camplist";
	}
	
	@GetMapping("/gl")
	public String glamList(Model model) {
		List<CampDBDto> campDto = campListService.glamList();
		model.addAttribute("camp",campDto);
		return "glamlist";
	}
	
	@GetMapping("/cvl")
	public String caravanList(Model model) {
		List<CampDBDto> campDto = campListService.caravanList();
		model.addAttribute("camp",campDto);
		return "caravanlist";
	}
}
