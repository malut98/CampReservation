package com.camp.campreservation.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.camp.campreservation.Dto.LoginDto;
import com.camp.campreservation.Service.LoginService;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginservice;
	
	@GetMapping("/mypage")
	public String mypage(Model model,LoginDto dto) {
		
		model.addAttribute("dto", loginservice.mypage(dto));
		
		return "mypage";
	}
	
	@GetMapping("/login")
	public String loginhp() {
		return "login";
	}
	
	@GetMapping("/index")
	public String main() {
		return "index";
	}
	
	@GetMapping("/sign")
	public String signForm() {
		return "sign";
	}
	@PostMapping("/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping(value="/logincheck",method=RequestMethod.POST)
	public String logincheck(@ModelAttribute LoginDto dto,HttpSession session,HttpServletRequest request,HttpServletResponse response) {
		
		String result = loginservice.logincheck(dto, session);
		ModelAndView mav = new ModelAndView();
		
		
		
		mav.setViewName("login");
		
		if(result != null) {
			session.setAttribute("memberid", dto.getMemberid());
			return "redirect:/index";
		}else {
			return "redirect:/login";
		}
		
	}
	
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		loginservice.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		mav.addObject("msg", "logout");
		
		return mav;
	}
	
	/*
	 * @RequestMapping(value="/signup",method=RequestMethod.POST) public String
	 * membersign(LoginDto dto) {
	 * 
	 * int res = loginservice.insert(dto); System.out.println("res="+ res);
	 * 
	 * if(res > 0) { return "redirect:/login"; }else { return "redirect:/sign"; }
	 * 
	 * }
	 */
	
	@PostMapping("/idcheck")
	@ResponseBody
	public int idCheck(@RequestParam("id") String id) {
		
		int cnt = loginservice.idCheck(id);
		System.out.println("i'm controller cnt:"+cnt);
		return cnt;
		
	}
	
	@PostMapping("/signup")
	public String signin(LoginDto dto,Model model) {
		
		model.addAttribute("login",loginservice.insert(dto));
		
		return "/login";
	}
	
}
