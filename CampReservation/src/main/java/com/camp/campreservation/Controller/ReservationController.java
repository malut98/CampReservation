package com.camp.campreservation.Controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camp.campreservation.Dto.ReservationDto;
import com.camp.campreservation.Mapper.ReservationMapper;
import com.camp.campreservation.Service.ReservationServiceImpl;

@Controller
public class ReservationController {

	@Autowired
	private ReservationServiceImpl reservationServiceImpl;

	@PostMapping("/campreservation")
	@ResponseBody
	public int CampRserv(@RequestParam("first_date") String first_date, @RequestParam("last_date") String last_date,
			@RequestParam("info_name") String info_name, @RequestParam("info_tel") String info_tel,
			@RequestParam("info_need") String info_need, @RequestParam("number_p") int number_p,
			@RequestParam("camp_id") int camp_id, HttpSession session, Model model,
			RedirectAttributes redirect) {
		String member_id = (String) session.getAttribute("memberid");
		ReservationDto dto = new ReservationDto();
		dto.setFirst_date(first_date);// 첫날
		dto.setLast_date(last_date);// 마지막날
		dto.setInfo_name(info_name);// 예약자명
		dto.setInfo_need(info_need);// 요구사항
		dto.setInfo_tel(info_tel);// 전화번호
		dto.setNumber_p(number_p);// 인원수
		dto.setMember_id(member_id);// 유저의 아이디
		dto.setCamp_id(camp_id);// 캠프아이디
		System.out.println(dto);
		
		int cnt = reservationServiceImpl.reservcnt(dto);
		System.out.println(cnt);
		if (cnt == 0) {
			model.addAttribute("campresrv", reservationServiceImpl.insert(dto));
			return cnt;
		}else {
			return cnt;
		}
	}

}
