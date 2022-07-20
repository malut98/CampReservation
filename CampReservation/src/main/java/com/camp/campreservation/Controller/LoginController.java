package com.camp.campreservation.Controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.camp.campreservation.Dto.LoginDto;
import com.camp.campreservation.Service.LoginService;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginservice;
	

	@GetMapping("/login")
	public String loginhp() {
		return "login";
	}
	
	
	@GetMapping("/sign")
	public String signForm() {
		return "sign";
	}
	@PostMapping("/login")
	public String login() {
		return "login";
	}
	
	
	@PostMapping("/index")
	public String main() {
		return "index";
	}
	
	@PostMapping("/login_in")
	public String main(HttpServletRequest request, Model model, String memberid, String memberpw) {
		if(loginservice.login(memberid,memberpw)!=null) {
			model.addAttribute("memberid",memberid);
			request.getSession().setAttribute("memberid", memberid);
			request.getSession().setAttribute("msg", "");
			return "index";
		}else{
			request.getSession().setAttribute("msg", "아이디 또는 비밀번호를 확인해주세요");
			return "/";
		}
		
	}
	
	@PostMapping("insert")
	public String insert(LoginDto dto) {
		int res = loginservice.insert(dto);
		if(res > 0) {
			return "redirect:/login";
		}else {
			return "redirect:/sign";
		}
	}
	
	@PostMapping("/idcheck")
	@ResponseBody
	public int idCheck(@RequestParam("id") String id) {
		
		int cnt = loginservice.idCheck(id);
		System.out.println("i'm controller cnt:"+cnt);
		return cnt;
		
	}

}
