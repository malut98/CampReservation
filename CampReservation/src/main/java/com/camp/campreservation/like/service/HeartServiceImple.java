package com.camp.campreservation.like.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camp.campreservation.Mapper.HeartMapper;

@Service
public class HeartServiceImple implements HeartService{

	@Autowired
	private HeartMapper heartMapper;
	
	@Override
	public String heart() {
		return null;
	}

	@Override
	public String unheart() {
		return null;
	}
	
}
