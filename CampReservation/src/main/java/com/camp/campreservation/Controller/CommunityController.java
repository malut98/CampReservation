package com.camp.campreservation.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.camp.campreservation.Dto.CommunityDto;
import com.camp.campreservation.Service.CommunityService;
import com.camp.campreservation.paging.Criteria;


@Controller
public class CommunityController {
	
	
	
	@Autowired
	private CommunityService cs;
	
	@GetMapping("/communitylist")
	public String communityList(Model model, @ModelAttribute("params") CommunityDto params) {
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
	public String communityWriteRes(CommunityDto dto) {
		int res = cs.communitywrite(dto);
		
		if(res>0) {
			return "redirect:communitylist";
		}else {
			return "redirect:communitywrite";
		}
		
		
	}
}
