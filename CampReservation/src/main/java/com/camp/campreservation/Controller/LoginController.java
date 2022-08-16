package com.camp.campreservation.Controller;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.camp.campreservation.Dto.LoginDto;
import com.camp.campreservation.Service.LoginService;
import com.camp.campreservation.campdb.dto.CampDBDto;
import com.camp.campreservation.camplist.service.CampListService;
import com.camp.campreservation.like.service.HeartService;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginservice;
	
	@Autowired
	private CampListService camplistservice;
	
	@Autowired
	private HeartService heartService;
	
	@GetMapping("/mypage")
	public String mypage(HttpSession session,Model model) {
		String memberid = (String)session.getAttribute("memberid");
		System.out.println(memberid);
		LoginDto dto = loginservice.mypage(memberid);
		model.addAttribute("dto", dto);
		
		
		CampDBDto camplike = loginservice.camplike(memberid);
		model.addAttribute("camp", camplike);
		
		int count = loginservice.count(memberid);
		model.addAttribute("count", count);
		
		CampDBDto campres = loginservice.campres(memberid);
		model.addAttribute("res", campres);
		
		return "Login/mypage";
	}
	
	@GetMapping("/login")
	public String loginhp() {
		return "Login/login";
	}
	
	@GetMapping("/index")
	public String main() {
		return "Login/index";
	}
	
	@GetMapping("/sign")
	public String signForm() {
		return "Login/sign";
	}
	@PostMapping("/login")
	public String login() {
		return "Login/login";
	}
	
	@RequestMapping(value="/logincheck",method=RequestMethod.POST)
	public String logincheck(HttpSession session,HttpServletRequest request,Model model,String memberid,String memberpw) {
		if(loginservice.logincheck(memberid, memberpw) != null) {
			model.addAttribute("memberid", memberid);
			model.addAttribute("memberpw", memberpw);
			request.getSession().setAttribute("memberid", memberid);
			request.getSession().setAttribute("memberpw", memberpw);
			return "index";
		}else {
			return "Login/login";
		}
	}
	
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		loginservice.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Login/login");
		mav.addObject("msg", "logout");
		
		return mav;
	}
	
	
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
	
	@GetMapping("/phonecheck")
	@ResponseBody
	public String SMS(String memberphone) {
		
		Random rand = new Random();
		String num = "";
		for(int i=0; i<4; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			num+=ran;
		}
		
		System.out.println("수신자 번호 : "+ memberphone);
		System.out.println("인증번호 : " + num);
		loginservice.SMS(memberphone, num);
		return num;
	}
	
	@GetMapping("/mypagewtype")
	public String wtype() {
		return "Login/mypagewtype";
	}
}
