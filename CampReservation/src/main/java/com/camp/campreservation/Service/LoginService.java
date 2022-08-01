package com.camp.campreservation.Service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.camp.campreservation.Dto.LoginDto;

public interface LoginService {
	public List<LoginDto> selectList();
	public int insert(LoginDto dto);
	public int update(LoginDto dto);
	public int updateMP(LoginDto dto);
	public int idCheck(String id);
	public String logincheck(LoginDto dto, HttpSession session);
	public void logout(HttpSession session);
	public void sign(LoginDto dto);
	public LoginDto mypage(String id);
}
