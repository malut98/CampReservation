package com.camp.campreservation.Controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.camp.campreservation.Dto.CommunityDto;
import com.camp.campreservation.Service.CommunityService;


@Controller
public class CommunityController {
	
	
	
	@Autowired
	private CommunityService cs;
	
	@GetMapping("/communitylist")
	public String communityList(Model model, @RequestParam(defaultValue = "1") String pagenum, @RequestParam(defaultValue = "5") String contentnum) {
		
		cs.communitylist(model, pagenum, contentnum);
		
		return "communitylist";
		
	}
	
	@GetMapping("/communitywrite")
	public String communityWrite() {
		
		return "communitywrite";
	}
	
	@PostMapping("communitywriteres")
	public String communityWriteRes(@RequestParam("fileimage") MultipartFile file,CommunityDto dto) {
		
			
		dto.setCom_image(file.getOriginalFilename());
		int res = cs.communitywrite(dto);
		
		if(res>0) {
			return "redirect:communitylist";
		}else {
			return "redirect:communitywrite";
		}
		
		
	}
	
	@GetMapping("/communitydetail")
	public String communitydetail(CommunityDto dto, Model model) {
		cs.communityhit(dto);
		
		model.addAttribute("dto", cs.communitydetail(dto));
		model.addAttribute("cot", cs.commentList(dto));
		return "communitydetail";
	}
	
	
	
	@PostMapping("communitysearch")
	public String communitysearch(@RequestParam(defaultValue="title") String searchOption, @RequestParam(defaultValue="") String keyword) {
		
		return null;
	}
}
