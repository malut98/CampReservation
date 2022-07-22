package com.camp.campreservation.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.camp.campreservation.campdb.dto.CampDBDto;
import com.camp.campreservation.campimg.dto.CampImgDto;
import com.camp.campreservation.camplist.service.CampListService;


@Controller
@RequestMapping("/clist")
public class CampListController {

	@Autowired
	private CampListService campListService;

	@GetMapping("/ca")
	public String campAll(Model model, @RequestParam(defaultValue = "1") String pagenum, @RequestParam(defaultValue = "6") String contentnum) {
		List<CampDBDto> campDto=campListService.getAllList(model, pagenum, contentnum);
		model.addAttribute("camp",campDto);
		model.addAttribute("tag","캠핑장");
		return "camplist";
	}
	
	@GetMapping("/cpl")
	public String campList(Model model, @RequestParam(defaultValue = "1") String pagenum, @RequestParam(defaultValue = "6") String contentnum) {
		List<CampDBDto> campDto=campListService.getCampList(model, pagenum, contentnum);
		model.addAttribute("camp",campDto);
		model.addAttribute("tag","캠핑장");
		return "camplist";
	}
	
	@GetMapping("/gl")
	public String glamList(Model model, @RequestParam(defaultValue = "1") String pagenum, @RequestParam(defaultValue = "6") String contentnum) {
		List<CampDBDto> campDto = campListService.getGlamList(model, pagenum, contentnum);
		model.addAttribute("camp",campDto);
		model.addAttribute("tag","글램핑");
		return "camplist";
	}
	
	@GetMapping("/cvl")
	public String caravanList(Model model, @RequestParam(defaultValue = "1") String pagenum, @RequestParam(defaultValue = "6") String contentnum) {
		List<CampDBDto> campDto = campListService.getCaravanList(model, pagenum, contentnum);
		model.addAttribute("camp",campDto);
		model.addAttribute("tag","카라반");
		return "camplist";
	}
	
	@GetMapping("/cdetail")
	public String campDetail(Model model, int camp_id) {
		CampDBDto campDto = campListService.campDetail(camp_id);
		model.addAttribute("camp",campDto);
		
		List<CampImgDto> campImg = campListService.campImg(camp_id);
		model.addAttribute("ci",campImg);
		return "campdetail";
	}
}
