package com.camp.campreservation.camplist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camp.campreservation.campdb.dto.CampDBDto;
import com.camp.campreservation.camplist.mapper.CampListMapper;

@Service
public class CampListServiceImpl implements CampListService {
	
	@Autowired
	private CampListMapper campListMapper;
	
	@Override
	public List<CampDBDto> campList() {
		System.out.println("service");
		return campListMapper.campList();
	}

	@Override
	public List<CampDBDto> glamList() {
		return campListMapper.glamList();
	}

	@Override
	public List<CampDBDto> caravanList() {
		return campListMapper.caravanList();
	}

}
