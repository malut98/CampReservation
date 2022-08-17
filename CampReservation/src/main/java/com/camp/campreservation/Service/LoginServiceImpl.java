package com.camp.campreservation.Service;

import java.util.HashMap;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camp.campreservation.Dto.LoginDto;
import com.camp.campreservation.Dto.ReservationDto;
import com.camp.campreservation.Mapper.LoginMapper;
import com.camp.campreservation.campdb.dto.CampDBDto;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class LoginServiceImpl implements LoginService{
	
	@Autowired
	private LoginMapper loginmapper;

	@Override
	public int insert(LoginDto dto) {
		return loginmapper.insert(dto);
	}

	@Override
	public int idCheck(String id) {
		return loginmapper.idCheck(id);
	}

	@Override
	public String logincheck(String memberid, String memberpw) {	
		return loginmapper.logincheck(memberid, memberpw);
	}


	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}


	@Override
	public void sign(LoginDto dto) {
		loginmapper.signup(dto);
	}


	@Override
	public LoginDto mypage(String memberid) {
		return loginmapper.mypage(memberid);
	}


	@Override
	public void SMS(String memberphone, String num) {
		String api_key = "NCS8QPF2U8EJEWPQ";
        String api_secret = "4Y1EWVJLJCXTJXCF6LX3DRDYHOXQMZ9D";
        Message coolsms = new Message(api_key, api_secret);

        // 4 params(to, from, type, text) are mandatory. must be filled
        HashMap<String, String> params = new HashMap<String, String>();
        params.put("to", memberphone);    // 수신전화번호
        params.put("from", "01040756891");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
        params.put("type", "SMS");
        params.put("text", "핫띵크 휴대폰인증 테스트 메시지 : 인증번호는" + "["+num+"]" + "입니다.");
        params.put("app_version", "test app 1.2"); // application name and version

        try {
            JSONObject obj = (JSONObject) coolsms.send(params);
            System.out.println(obj.toString());
        } catch (CoolsmsException e) {
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
        }
	}


	@Override
	public List<CampDBDto> camplike(String memberid) {
		return loginmapper.camplike(memberid);
	}


	@Override
	public int count(String memberid) {
		return loginmapper.count(memberid);
	}


	@Override
	public List<ReservationDto> campres(String memberid) {
		return loginmapper.campres(memberid);
	}

	@Override
	public String date(String reser_id) {
		return loginmapper.date(reser_id);
	}

	@Override
	public ReservationDto res(String reser_id) {
		return loginmapper.res(reser_id);
	}









}
