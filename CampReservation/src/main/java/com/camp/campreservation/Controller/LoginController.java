package com.camp.campreservation.Controller;

import java.time.LocalDate;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.valves.RemoteIpValve;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.camp.campreservation.Dto.LoginDto;
import com.camp.campreservation.Dto.ReservationDto;
import com.camp.campreservation.Dto.ReviewDto;
import com.camp.campreservation.Service.IndexService;
import com.camp.campreservation.Service.LoginService;
import com.camp.campreservation.Service.ReviewService;
import com.camp.campreservation.campdb.dto.CampDBDto;


@Controller
public class LoginController {
	
	@Autowired
	private ReviewService reviewserivce;
	
	@Autowired
	private LoginService loginservice;

	@Autowired
	private IndexService indexService;
	
	@GetMapping("/mypage")
	public String mypage(HttpSession session,Model model) {
		String memberid = (String)session.getAttribute("memberid");
		System.out.println(memberid);
		LoginDto dto = loginservice.mypage(memberid);
		model.addAttribute("dto", dto);
		
		List<CampDBDto> camplike = loginservice.camplike(memberid);
		model.addAttribute("camp", camplike);
		System.out.println(camplike);
		
		List<ReservationDto> campres = loginservice.campres(memberid);
		model.addAttribute("res", campres);
		return "Login/mypage";
	}
	
	@GetMapping("/login")
	public String loginhp() {
		return "Login/login";
	}
	
	
	@GetMapping("/sign")
	public String signForm() {
		return "Login/sign";
	}
	
	@PostMapping("/logincheck")
	public String logincheck(HttpSession session,HttpServletRequest request,Model model,String memberid,String memberpw) {
		if(loginservice.logincheck(memberid, memberpw) != null) {
			model.addAttribute("memberid", memberid);
			model.addAttribute("memberpw", memberpw);
			request.getSession().setAttribute("memberid", memberid);
			request.getSession().setAttribute("memberpw", memberpw);
			List<CampDBDto> list = indexService.selectList();
			model.addAttribute("list",list);
			return "/index";
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
		
		return "Login/login";
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
	
	//날짜확인
	@PostMapping("/re")
	@ResponseBody
	public int re(@RequestParam("reser_id") String reser_id) {
		String date = loginservice.date(reser_id); //여행 끝나는 날짜
		LocalDate date1 = LocalDate.now();
		String now = date1.toString();	//오늘 날짜
		if(date.compareTo(now)<0) {
			return -1;	//여행이 끝난 후
		}else{
			return 1;	//여행 끝나기 전
		}
	}
	
	@GetMapping("write")
	public String write(String reser_id, Model model) {
		ReservationDto res=loginservice.res(reser_id);
		model.addAttribute("res",res);
		return "Login/re";
	}
	
	@PostMapping("/review")
	public String reviewWrite(HttpServletRequest request, Model model) {
		String content = request.getParameter("content");
		String cid = request.getParameter("campid");
		String memberid = request.getParameter("memberid");
		int campid=Integer.parseInt(cid);
		ReviewDto rd = new ReviewDto();
		rd.setCamp_id(campid);
		rd.setMember_id(memberid);
		rd.setRe_content(content);
		int cnt = reviewserivce.insert(rd);
		if (cnt > 0) {
			return "redirect:/mypage";
		}else {
			return "/";
		}
	}
}
