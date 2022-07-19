package com.camp.campreservation.Service;

import java.util.List;

import com.camp.campreservation.Dto.LoginDto;

public interface LoginService {
	public List<LoginDto> selectList();
	public LoginDto selectOne(String memberid);
	public int insert(LoginDto dto);
	public int update(LoginDto dto);
	public int updateMP(LoginDto dto);
	public int idCheck(String id);
	public LoginDto login(String memberid, String memberpw);
}
