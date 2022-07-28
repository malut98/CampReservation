package com.camp.campreservation.Service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
	public String logincheck(LoginDto dto, HttpSession session) {
		
		String result = loginmapper.logincheck(dto);
		System.out.println(result);
		
		if(result != null) {
			System.out.print(result);
			session.setAttribute("memberid", dto.getMemberid());
		}
				
		return result;
	}


	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}


	@Override
	public void sign(LoginDto dto) {
		loginmapper.signup(dto);
	}





}
