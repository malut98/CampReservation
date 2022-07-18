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
	public String communityList(Model model, @ModelAttribute("params") CommunityDto params) {
		//리스트에 서비스에서 가져온 데이터 저장
		List<CommunityDto> boardList = cs.getBoardList(params);
	model.addAttribute("boardList", boardList);	
	
	model.addAttribute("list",cs.communitylist());
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
}
