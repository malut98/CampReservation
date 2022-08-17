package com.camp.campreservation.Service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.camp.campreservation.Dto.LoginDto;
import com.camp.campreservation.Dto.ReservationDto;
import com.camp.campreservation.campdb.dto.CampDBDto;

public interface LoginService {
	public int insert(LoginDto dto);
	public int idCheck(String id);
	public String logincheck(String memberid, String memberpw);
	public void logout(HttpSession session);
	public void sign(LoginDto dto);
	public LoginDto mypage(String memberid);

	/* public CampDBDto mypagelike(int camp_id); */
	public void SMS(String memberphone,String num);
	List<CampDBDto> camplike(String memberid);
	int count(String memberid);
	List<ReservationDto> campres(String memberid);
	ReservationDto res(String reser_id);
	String date(String reser_id);
}
