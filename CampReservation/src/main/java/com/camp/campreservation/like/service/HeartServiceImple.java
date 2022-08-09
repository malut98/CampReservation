package com.camp.campreservation.like.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camp.campreservation.Mapper.HeartMapper;

@Service
public class HeartServiceImple implements HeartService{

	@Autowired
	private HeartMapper heartMapper;
	
	@Override
	public int heart(String memberid, int campid) {
		return heartMapper.heart(memberid, campid);
	}

	@Override
	public int unheart(String memberid, int campid) {
		return heartMapper.unheart(memberid, campid);
	}

	@Override
	public int count(int campid) {
		return heartMapper.count(campid);
	}

	@Override
	public int check(String memberid, int campid) {
		return heartMapper.check(memberid, campid);
	}

	@Override
	public int campDtoCount(int count, int campid) {
		return heartMapper.campDtoCount(count, campid);
	}
	
}
