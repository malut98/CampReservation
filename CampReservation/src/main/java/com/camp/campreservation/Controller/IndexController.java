package com.camp.campreservation.Controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.camp.campreservation.Mapper.IndexMapper;
import com.camp.campreservation.Service.IndexService;
import com.camp.campreservation.Service.ReviewService;
import com.camp.campreservation.campdb.dto.CampDBDto;
import com.camp.campreservation.camplist.service.CampListService;
import com.camp.campreservation.like.service.HeartService;

@Controller
public class IndexController {

	@Autowired
	private IndexService indexService;

	@Autowired
	private CampListService campListService;

	@Autowired
	private ReviewService reviewService;

	@Autowired
	private HeartService heartService;

	@GetMapping("/serch")
	public String campAll(Model model, @RequestParam(defaultValue = "1") String pagenum,
			@RequestParam(defaultValue = "6") String contentnum,String keyword) {
		List<CampDBDto> campDto = indexService.serchList(model, keyword, pagenum, contentnum);
		model.addAttribute("camp", campDto);
		model.addAttribute("keyword", keyword);
		model.addAttribute("tag", "전체");
		return "serchlist";
	}

	@GetMapping("/")
	public String root(Model setImg) {

		List<CampDBDto> list = indexService.selectList();
		setImg.addAttribute("list", list);

		return "index";
	}
	/*
	 * @GetMapping("/serch") public String serchlist(String keyword,Model
	 * model,@RequestParam(defaultValue = "1") String pagenum,
	 * 
	 * @RequestParam(defaultValue = "5") String contentnum,HttpServletRequest
	 * request) { List<CampDBDto> list = indexService.serchList(model, keyword,
	 * pagenum, contentnum);
	 * 
	 * model.addAttribute("list", list); model.addAttribute("keyword", keyword);
	 * 
	 * System.out.println(keyword);
	 * 
	 * List<CampDBDto> list = campListService.getCampList(dto, pagenum, contentnum);
	 * 
	 * return "serchlist"; }
	 */
	@PostMapping("/pagin")
	public String getList(Model model, @RequestParam("pagenum") String pagenum,
			@RequestParam(defaultValue = "6") String contentnum, @RequestParam("name") String name) {
		if (name.equals("keyword")) {
			List<CampDBDto> campDto = indexService.serchList(model, name, pagenum, contentnum);
			model.addAttribute("camp", campDto);
		}
		return "Login/paging_con";
	
 }
}
