package com.camp.campreservation.Controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.swing.filechooser.FileSystemView;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.camp.campreservation.Dto.CommunityDto;
import com.camp.campreservation.Service.CommunityService;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;


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
		String filename= file.getOriginalFilename();
		if(!filename.isEmpty()) {
			dto.setCom_image(dto.getCom_num()+dto.getMember_id()+dto.getCom_title()+file.getOriginalFilename());
			
		}
		String path = "C:\\Users\\tmdgh\\git\\CampReservation\\CampReservation\\src\\main\\resources\\static\\Img\\communityImg";
		System.out.println(path);
		String filePath = path +"\\"+dto.getCom_num()+dto.getMember_id()+dto.getCom_title()+ file.getOriginalFilename();
		File dest = new File(filePath);
		int res = cs.communitywrite(dto);
		
		if(res>0) {
			try {
				if(filename.isEmpty()) {
					return "redirect:communitylist";
				}
				
				file.transferTo(dest);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
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
	
	
	
	@RequestMapping("communitysearch")
	public String communitysearch(@RequestParam(defaultValue="com_title") String searchOption, @RequestParam(defaultValue="") String keyword, Model model, @RequestParam(defaultValue = "1") String pagenum, @RequestParam(defaultValue = "5") String contentnum) {
		List<CommunityDto> list = cs.listAll(model,searchOption, keyword, pagenum, contentnum);
		
		model.addAttribute("list",list);
		
		model.addAttribute("searchOption",searchOption);
		model.addAttribute("keyword",keyword);
		
		System.out.println(searchOption);
		System.out.println(keyword);
	
		return "communitysearch";
	}
	
	
}
