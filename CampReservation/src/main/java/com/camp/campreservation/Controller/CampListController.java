package com.camp.campreservation.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.camp.campreservation.campdb.dto.CampDBDto;
import com.camp.campreservation.camplist.service.CampListService;
import com.camp.campreservation.paging.Pagination;


@Controller
@RequestMapping("/clist")
public class CampListController {

	@Autowired
	private CampListService campListService;

	@GetMapping("/cpl")
	public String campList(Model model, @RequestParam(defaultValue = "1") String pagenum, @RequestParam(defaultValue = "6") String contentnum) {
		List<CampDBDto> campDto=campListService.getCampList(model, pagenum, contentnum);
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
	
	@GetMapping("/cdetail")
	public String campDetail(Model model, int camp_id) {
		System.out.println(camp_id);
		CampDBDto campDto = campListService.campDetail(camp_id);
		model.addAttribute("camp",campDto);
		return "campdetail";
	}
}
