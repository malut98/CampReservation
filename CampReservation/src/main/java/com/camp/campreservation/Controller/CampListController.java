package com.camp.campreservation.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.camp.campreservation.Dto.LoginDto;
import com.camp.campreservation.Service.LoginService;
import com.camp.campreservation.campdb.dto.CampDBDto;
import com.camp.campreservation.campimg.dto.CampImgDto;
import com.camp.campreservation.camplist.service.CampListService;


@Controller
@RequestMapping("/clist")
public class CampListController {
	
	@Autowired
	private CampListService campListService;
	
	@Autowired
	private LoginService loginService;

	@GetMapping("/ca")
	public String campAll(Model model, @RequestParam(defaultValue = "1") String pagenum, @RequestParam(defaultValue = "6") String contentnum) {
		List<CampDBDto> campDto=campListService.getAllList(model, pagenum, contentnum);
		model.addAttribute("camp",campDto);
		model.addAttribute("tag","전체");
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
		
		LoginDto logDto=loginService.selectOne("");
		model.addAttribute("id",logDto);
		return "campdetail";
	}
	
	@PostMapping("/pagin")
	public String idCheck(Model model, @RequestParam("pagenum") String pagenum, @RequestParam(defaultValue = "6") String contentnum, @RequestParam("name") String name) {
		if(name.equals("전체")) {
			List<CampDBDto> campDto = campListService.getAllList(model, pagenum, contentnum);
			model.addAttribute("camp",campDto);
			
		}else if(name.equals("캠핑장")) {
			List<CampDBDto> campDto=campListService.getCampList(model, pagenum, contentnum);
			model.addAttribute("camp",campDto);
			
		}else if(name.equals("글램핑")) {
			List<CampDBDto> campDto = campListService.getGlamList(model, pagenum, contentnum);
			model.addAttribute("camp",campDto);
			
		}else if(name.equals("카라반")) {
			List<CampDBDto> campDto = campListService.getCaravanList(model, pagenum, contentnum);
			model.addAttribute("camp",campDto);
		}
		return "paging_con";
	}
}
