package com.camp.campreservation.Controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camp.campreservation.Dto.UsedtradeDto;
import com.camp.campreservation.Service.UsedtradeService;

@Controller
public class UsedtradeController {

	@Autowired
	private UsedtradeService us;

	@GetMapping("/usedtradelist")
	public String communityList(Model model, @RequestParam(defaultValue = "1") String pagenum,
			@RequestParam(defaultValue = "10") String contentnum) {

		us.usedtradelist(model, pagenum, contentnum);
		return "Used_community/usedtradelist";
	}
	
	@GetMapping("selectusedlist")
	public String selectusedList(Model model, UsedtradeDto dto, @RequestParam(defaultValue = "1") String pagenum, @RequestParam(defaultValue = "10") String contentnum) {
		us.usedtradeboardlist(dto, model, pagenum, contentnum);
		model.addAttribute("board",dto.getMar_cate());
		return "Used_community/usedtradelist";
	}

	@GetMapping("tentTarp")
	public String tentTarp(Model model, UsedtradeDto dto, @RequestParam(defaultValue = "1") String pagenum,
			@RequestParam(defaultValue = "10") String contentnum) {
		
		us.usedtradeboardlist(dto, model, pagenum, contentnum);
		model.addAttribute("board",dto.getMar_cate());
		return "Used_community/usedtradelist";
	}

	@GetMapping("mat")
	public String mat(Model model, UsedtradeDto dto, @RequestParam(defaultValue = "1") String pagenum,
			@RequestParam(defaultValue = "10") String contentnum) {

		us.usedtradeboardlist(dto, model, pagenum, contentnum);
		model.addAttribute("board",dto.getMar_cate());
		return "Used_community/usedtradelist";
	}

	@GetMapping("stove")
	public String stove(Model model, UsedtradeDto dto, @RequestParam(defaultValue = "1") String pagenum,
			@RequestParam(defaultValue = "10") String contentnum) {

		us.usedtradeboardlist(dto, model, pagenum, contentnum);
		model.addAttribute("board",dto.getMar_cate());
		return "Used_community/usedtradelist";
	}

	@GetMapping("sean")
	public String sean(Model model, UsedtradeDto dto, @RequestParam(defaultValue = "1") String pagenum,
			@RequestParam(defaultValue = "10") String contentnum) {

		us.usedtradeboardlist(dto, model, pagenum, contentnum);
		model.addAttribute("board",dto.getMar_cate());
		return "Used_community/usedtradelist";
	}

	@GetMapping("cooking")
	public String cooking(Model model, UsedtradeDto dto, @RequestParam(defaultValue = "1") String pagenum,
			@RequestParam(defaultValue = "10") String contentnum) {

		us.usedtradeboardlist(dto, model, pagenum, contentnum);
		model.addAttribute("board",dto.getMar_cate());
		return "Used_community/usedtradelist";
	}

	@GetMapping("accessorie")
	public String accessorie(Model model, UsedtradeDto dto, @RequestParam(defaultValue = "1") String pagenum,
			@RequestParam(defaultValue = "10") String contentnum) {

		us.usedtradeboardlist(dto, model, pagenum, contentnum);
		model.addAttribute("board",dto.getMar_cate());
		return "Used_community/usedtradelist";
	}

	@GetMapping("storage")
	public String storage(Model model, UsedtradeDto dto, @RequestParam(defaultValue = "1") String pagenum,
			@RequestParam(defaultValue = "10") String contentnum) {

		us.usedtradeboardlist(dto, model, pagenum, contentnum);
		model.addAttribute("board",dto.getMar_cate());
		return "Used_community/usedtradelist";
	}
	@GetMapping("furniture")
	public String furniture(Model model, UsedtradeDto dto, @RequestParam(defaultValue = "1") String pagenum,
			@RequestParam(defaultValue = "10") String contentnum) {

		us.usedtradeboardlist(dto, model, pagenum, contentnum);
		model.addAttribute("board",dto.getMar_cate());
		return "Used_community/usedtradelist";
	}
	
	@GetMapping("lighting")
	public String lighting(Model model, UsedtradeDto dto, @RequestParam(defaultValue = "1") String pagenum,
			@RequestParam(defaultValue = "10") String contentnum) {

		us.usedtradeboardlist(dto, model, pagenum, contentnum);
		model.addAttribute("board",dto.getMar_cate());
		return "Used_community/usedtradelist";
	}
	
	@GetMapping("RV")
	public String RV(Model model, UsedtradeDto dto, @RequestParam(defaultValue = "1") String pagenum,
			@RequestParam(defaultValue = "10") String contentnum) {

		us.usedtradeboardlist(dto, model, pagenum, contentnum);
		model.addAttribute("board",dto.getMar_cate());
		return "Used_community/usedtradelist";
	}

	@GetMapping("/usedtradewrite")
	public String usedtradewrite(HttpSession session, RedirectAttributes redirect, Model model) {
		if (session.getAttribute("memberid") == null) {
			redirect.addFlashAttribute("mesage", "로그인해주세요");
			return "redirect:usedtradelist";
		}
		String memberid = (String) session.getAttribute("memberid");
		model.addAttribute("dto", us.usedtradelogin(memberid));
		System.out.println(us.usedtradelogin(memberid));
		return "Used_community/usedtradewrite";
	}

	@PostMapping("/usedtradewriteres")
	public String usedtradewriteres(@RequestParam("marimage") MultipartFile file, UsedtradeDto dto) {

		String filename = file.getOriginalFilename();
		UUID uuid = UUID.randomUUID();
		if (!filename.isEmpty()) {
			dto.setMar_image(uuid + "_" + file.getOriginalFilename());

		}
		String path = "C:\\Users\\tmdgh\\git\\CampReservation\\CampReservation\\CampReservation\\src\\main\\resources\\static\\Img\\usedtrade";
		System.out.println(path);
		String filePath = path + "\\" + uuid + "_" + file.getOriginalFilename();
		File dest = new File(filePath);

		int res = us.usedtradewrite(dto);
		if (res > 0) {
			try {
				if (filename.isEmpty()) {
					return "redirect:usedtradelist";
				}

				file.transferTo(dest);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			return "redirect:usedtradelist";
		} else {
			return "redirect:usedtradewrite";
		}

	}

	@GetMapping("/usedtradedetail")
	public String usedtradedetail(Model model, UsedtradeDto dto, HttpSession session, RedirectAttributes redirect) {
		UsedtradeDto dto1 = new UsedtradeDto();
		dto1 = us.usedtradeselectone(dto);
		try {
			if (session.getAttribute("memberid").equals(dto1.getMember_id())) {
				model.addAttribute("mesage", "작성자");
				model.addAttribute("dto", us.usedtradeselectone(dto));
				us.usedtradehit(dto);
				return "Used_community/usedtradedetail";
			} else if (session.getAttribute("memberid").equals("admin")) {
				model.addAttribute("mesage", "관리자");
				model.addAttribute("dto", us.usedtradeselectone(dto));
				us.usedtradehit(dto);
				return "Used_community/usedtradedetail";
			} else if (session.getAttribute("memberid") == null) {
				redirect.addFlashAttribute("mesage", "로그인해주세요");
				return "redirect:usedtradelist";
			} else {
				model.addAttribute("dto", us.usedtradeselectone(dto));
				us.usedtradehit(dto);
				return "Used_community/usedtradedetail";
			}
		} catch (Exception e) {
			if (session.getAttribute("memberid") == null) {
				e.printStackTrace();
				redirect.addFlashAttribute("mesage", "로그인해주세요");
				return "redirect:usedtradelist";
			}
		}
		return "";
	}

	@RequestMapping("/usedtradesearch")
	public String usedtradesearch(@RequestParam(defaultValue = "mar_title") String searchOption,
			@RequestParam(defaultValue = "") String keyword, Model model,
			@RequestParam(defaultValue = "1") String pagenum, @RequestParam(defaultValue = "10") String contentnum) {
		System.out.println(searchOption);
		List<UsedtradeDto> list = us.searchAll(model, searchOption, keyword, pagenum, contentnum);
		model.addAttribute("list", list);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);
		return "Used_community/usedtradesearch";
	}

	@GetMapping("/usedtradedelete")
	public String usedtradedelete(UsedtradeDto dto) {
		int res = us.usedtradedelete(dto);

		String path = "C:\\Users\\tmdgh\\git\\CampReservation\\CampReservation\\CampReservation\\src\\main\\resources\\static\\Img\\usedtrade";
		String filePath = path + "\\" + dto.getMar_image();
		File dest = new File(filePath);

		if (res > 0) {
			dest.delete();
			return "redirect:usedtradelist";
		} else {

			return "redirect:usedtradedetail?mar_num=" + dto.getMar_num();
		}
	}

	@GetMapping("/usedtradeupdate")
	public String usedtradeupdate(Model model, UsedtradeDto dto) {
		model.addAttribute("dto", us.usedtradeselectone(dto));
		return "Used_community/usedtradeupdate";
	}

	@PostMapping("/usedtradeupdateres")
	public String usedtradeupdateres(@RequestParam("marimage") MultipartFile file, UsedtradeDto dto, Model model)
			throws IllegalStateException, IOException {
		UUID uuid = UUID.randomUUID();
		String path = "C:\\Users\\tmdgh\\git\\CampReservation\\CampReservation\\src\\main\\resources\\static\\Img\\usedtrade";

		if (dto.getMar_image().isEmpty() && !file.getOriginalFilename().isEmpty()) {
			String filePath = path + "\\" + uuid + "_" + file.getOriginalFilename();
			File dest = new File(filePath);
			file.transferTo(dest);
			dto.setMar_image(uuid + "_" + file.getOriginalFilename());

		} else if (!dto.getMar_image().isEmpty() && !file.getOriginalFilename().isEmpty()) {
			if (!dto.getMar_image().equals(file.getOriginalFilename())) {
				String filePath = path + "\\" + uuid + "_" + file.getOriginalFilename();
				String deletePath = path + "\\" + dto.getMar_image();
				File dest = new File(filePath);
				File delete = new File(deletePath);
				file.transferTo(dest);
				delete.delete();
				dto.setMar_image(uuid + "_" + file.getOriginalFilename());

			}
		}

		int res = us.usedtradeupdate(dto);

		return "redirect:Used_community/usedtradelist";
	}
}
