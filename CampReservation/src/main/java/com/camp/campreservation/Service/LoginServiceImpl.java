package com.camp.campreservation.Service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camp.campreservation.Dto.LoginDto;
import com.camp.campreservation.Mapper.LoginMapper;

@Service
public class LoginServiceImpl implements LoginService{
	
	@Autowired
	private LoginMapper loginmapper;

	@Override
	public List<LoginDto> selectList() {
		return loginmapper.selectList();
	}

	@Override
	public LoginDto selectOne(String memberid) {
		return loginmapper.selectOne(memberid);
	}

	@Override
	public int insert(LoginDto dto) {
		return loginmapper.insert(dto);
	}

	@Override
	public int update(LoginDto dto) {
		return loginmapper.update(dto);
	}

	@Override
	public int updateMP(LoginDto dto) {
		return loginmapper.updateMP(dto);
	}

	@Override
	public int idCheck(String id) {
		return loginmapper.idCheck(id);
	}

	@Override
	public LoginDto login(String memberid, String memberpw) {
		return loginmapper.login(memberid, memberpw);
	}
	

}
