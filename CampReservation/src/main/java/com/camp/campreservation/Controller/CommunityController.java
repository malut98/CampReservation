package com.camp.campreservation.Controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camp.campreservation.Dto.CommentDto;
import com.camp.campreservation.Dto.CommunityDto;
import com.camp.campreservation.Service.CommentService;
import com.camp.campreservation.Service.CommunityService;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;


@Controller
public class CommunityController {
	
	
	
	@Autowired
	private CommunityService cs;
	
	@Autowired
	private CommentService comments;
	
	@GetMapping("/communitylist")
	public String communityList(Model model, @RequestParam(defaultValue = "1") String pagenum, @RequestParam(defaultValue = "5") String contentnum) {
		cs.communitylist(model, pagenum, contentnum);
		
		return "Community/communitylist";
		
	}
	
	@GetMapping("/communityselectlist")
	public String communityselectList(Model model, @RequestParam(defaultValue = "1") String pagenum, @RequestParam(defaultValue = "5") String contentnum, CommunityDto dto) {
		cs.boardlist(model, pagenum, contentnum, dto);
		System.out.println("입력:"+dto.getCom_cate());
		model.addAttribute("board",dto.getCom_cate());
		return "Community/communitylist";
		
	}
	
	@GetMapping("/communityselectsearch")
	public String communityselectsearch(Model model, @RequestParam(defaultValue = "1") String pagenum, @RequestParam(defaultValue = "5") String contentnum, CommunityDto dto, String searchOption, @RequestParam(defaultValue="") String keyword) {
		System.out.println(searchOption);
		System.out.println(keyword);
		cs.searchboardlist(model,pagenum, contentnum, dto, searchOption, keyword);
		System.out.println("값:"+dto.getCom_cate());
		
		return "Community/communitysearch";
	}
	
	@GetMapping("/noticelist")
	public String noticeList(Model model, @RequestParam(defaultValue = "1") String pagenum, @RequestParam(defaultValue = "5") String contentnum, CommunityDto dto) {
		cs.boardlist(model, pagenum, contentnum, dto);
		model.addAttribute("board","공지");
		return "Community/communitylist";
	}
	
	@GetMapping("/eventlist")
	public String eventList(Model model, @RequestParam(defaultValue = "1") String pagenum, @RequestParam(defaultValue = "5") String contentnum, CommunityDto dto) {
		cs.boardlist(model, pagenum, contentnum, dto);
		model.addAttribute("board","이벤트");
		return "Community/communitylist";
	}
	@GetMapping("/freelist")
	public String freeList(Model model, @RequestParam(defaultValue = "1") String pagenum, @RequestParam(defaultValue = "5") String contentnum, CommunityDto dto) {
		cs.boardlist(model, pagenum, contentnum, dto);
		model.addAttribute("board", "자유");
		return "Community/communitylist";
	}
	@GetMapping("/refund")
	public String refund(Model model, @RequestParam(defaultValue = "1") String pagenum, @RequestParam(defaultValue = "5") String contentnum, CommunityDto dto) {
		cs.boardlist(model, pagenum, contentnum, dto);
		model.addAttribute("board","환불");
		return "Community/communitylist";
	}
	@GetMapping("/inconvenient")
	public String inconvenient(Model model, @RequestParam(defaultValue = "1") String pagenum, @RequestParam(defaultValue = "5") String contentnum, CommunityDto dto) {
		cs.boardlist(model, pagenum, contentnum, dto);
		model.addAttribute("board","불편사항");
		return "Community/communitylist";
	}
	
	@GetMapping("/blinddate")
	public String blinddate(Model model, @RequestParam(defaultValue = "1") String pagenum, @RequestParam(defaultValue = "5") String contentnum, CommunityDto dto) {
		cs.boardlist(model, pagenum, contentnum, dto);
		model.addAttribute("board","번개");
		return "Community/communitylist";
	}
	
	@GetMapping("/communitywrite")
	public String communityWrite(HttpSession session, RedirectAttributes redirect, Model model,String keyword, String searchoption) {
		
		if(session.getAttribute("memberid")==null) {
			redirect.addFlashAttribute("mesage","로그인을 해주세요");
			
				
				return "redirect:communitylist";
		
		
		}else {
			CommunityDto dto = new CommunityDto();
			String memberid = (String)session.getAttribute("memberid"); 
			dto.setMember_id(memberid);
			model.addAttribute("dto",dto);
		return "Community/communitywrite";
		}
		
	}
	
	
	@PostMapping("communitywriteres")
	public String communityWriteRes(@RequestParam("fileimage") MultipartFile file,CommunityDto dto) {
		String filename= file.getOriginalFilename();
		UUID uuid = UUID.randomUUID();
		if(!filename.isEmpty()) {
			dto.setCom_image(uuid+"_"+file.getOriginalFilename());
			
		}
		String path = "C:\\Users\\tmdgh\\git\\CampReservation\\CampReservation\\CampReservation\\src\\main\\resources\\static\\Img\\communityimg";
		System.out.println(path);
		String filePath = path +"\\"+uuid+"_"+file.getOriginalFilename();
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
	@GetMapping("adminwrite")
	public String adminwrite(HttpSession session, Model model) {
		String memberid = (String)session.getAttribute("memberid");
		CommunityDto dto = new CommunityDto();
		dto.setMember_id(memberid);
		model.addAttribute("dto", dto);
		return "Community/adminwrite";
		
		
	}
	
	@PostMapping("adminwriteres")
	public String adminWriteRes(@RequestParam("fileimage") MultipartFile file,CommunityDto dto) {
		String filename= file.getOriginalFilename();
		UUID uuid = UUID.randomUUID();
		if(!filename.isEmpty()) {
			dto.setCom_image(uuid+"_"+file.getOriginalFilename());
			
		}
		String path = "C:\\Users\\tmdgh\\git\\CampReservation\\CampReservation\\CampReservation\\src\\main\\resources\\static\\Img\\communityimg";
		System.out.println(path);
		String filePath = path +"\\"+uuid+"_"+file.getOriginalFilename();
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
			return "redirect:adminwrite";
		}
		
		}
	
	@GetMapping("/communitydetail")
	public String communitydetail(CommunityDto dto, Model model,@RequestParam(defaultValue = "1") String pagenum, @RequestParam(defaultValue = "5") String contentnum, RedirectAttributes redirect,HttpSession session) {
		CommunityDto dto1 = cs.communitydetail(dto);
		CommentDto cotDto = new CommentDto();
		cotDto.setMember_id((String)session.getAttribute("memberid"));
		List<CommentDto> cot = comments.commentwriter(cotDto);
		for(int i=0; i<cot.size(); i++) {
			if(cot.get(i).getMember_id().equals(cotDto.getMember_id())) {
				model.addAttribute("writer","작성자");
				model.addAttribute("ID",cot.get(i).getMember_id());
			}
		}
		try {
			
			if(session.getAttribute("memberid").equals(dto1.getMember_id())) {
				cs.communityhit(dto);
				model.addAttribute("dto", cs.communitydetail(dto));
				comments.commentList(model, dto, pagenum, contentnum);
				model.addAttribute("mesage", "작성자");
				
				return "Community/communitydetail";
			}else if(session.getAttribute("memberid").equals("admin")) {
				cs.communityhit(dto);
				model.addAttribute("dto", cs.communitydetail(dto));
				comments.commentList(model, dto, pagenum, contentnum);
				model.addAttribute("mesage","관리자");
				return "Community/communitydetail";
			}else if(session.getAttribute("memberid")==null) {
				redirect.addFlashAttribute("mesage","로그인해주세요");
				return "redirect:communitylist";
				
			}else {
				cs.communityhit(dto);
				model.addAttribute("dto", cs.communitydetail(dto));
				comments.commentList(model, dto, pagenum, contentnum);
				return "Community/communitydetail";
			}
			
		} catch (Exception e) {
			if(session.getAttribute("memberid")==null) {
				redirect.addFlashAttribute("mesage","로그인해주세요");
				return "redirect:communitylist";
				
			}
			e.printStackTrace();
		}
		return "";
	}
	
	
	
	@RequestMapping("communitysearch")
	public String communitysearch(@RequestParam(defaultValue="com_title") String searchOption, @RequestParam(defaultValue="") String keyword, Model model, @RequestParam(defaultValue = "1") String pagenum, @RequestParam(defaultValue = "5") String contentnum, String board) {
		List<CommunityDto> list = cs.listAll(model,searchOption, keyword, pagenum, contentnum);
		System.out.println(board);
		model.addAttribute("list",list);
		
		model.addAttribute("searchOption",searchOption);
		model.addAttribute("keyword",keyword);
		model.addAttribute("board",board);
		System.out.println(searchOption);
		System.out.println(keyword);
	
		return "Community/communitysearch";
	}
	
	@GetMapping("communitydelete")
	public String communitydelete(CommunityDto dto) {
		System.out.println(dto.getCom_num());
		
		int res = cs.communitydelete(dto);
		int res2 = comments.commentdelete(dto);
		
		String path = "C:\\Users\\tmdgh\\git\\CampReservation\\CampReservation\\CampReservation\\src\\main\\resources\\static\\Img\\communityimg";
		String filePath = path +"\\"+dto.getCom_image();
		
		File dest = new File(filePath);
		dest.delete();
		
		if(res>0 ) {
			return "redirect:communitylist";
			
		}
		return "redirect:communitydetail?com_num="+dto.getCom_num();
	}
	
	@GetMapping("communityupdate")
	public String communityupdate(CommunityDto dto, Model model) {
		model.addAttribute("dto", cs.communitydetail(dto));
		return "Community/communityupdate";
	}
	@PostMapping("communityupdateres")
	public String communityupdateres(CommunityDto dto, Model model,@RequestParam("fileimage") MultipartFile file) throws IllegalStateException, IOException {
		UUID uuid = UUID.randomUUID();		
		String path = "C:\\Users\\tmdgh\\git\\CampReservation\\CampReservation\\src\\main\\resources\\static\\Img\\communityImg";
		if(dto.getCom_image().isEmpty() && !file.getOriginalFilename().isEmpty()) {
			String filePath = path + "\\" + uuid+"_"+file.getOriginalFilename();	
			File dest = new File(filePath);
			file.transferTo(dest);
			dto.setCom_image(uuid+"_"+file.getOriginalFilename());
			
		}else if(!dto.getCom_image().isEmpty() && !file.getOriginalFilename().isEmpty()) {
			if(!dto.getCom_image().equals(file.getOriginalFilename())) {
				String filePath = path + "\\" +uuid + "_"+file.getOriginalFilename();
				String deletePath = path + "\\" + dto.getCom_image();
				File dest = new File(filePath);
				File delete = new File(deletePath);
				file.transferTo(dest);
				delete.delete();
				dto.setCom_image(uuid+"_"+file.getOriginalFilename());
				
			}
		}
		int res =cs.communityupdate(dto);
		
		return "redirect:communitylist";
	}
	
}
