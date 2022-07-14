package com.camp.campreservation.campdb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camp.campreservation.campdb.dto.CampDBDto;
import com.camp.campreservation.campdb.mapper.CampDBMapper;

@Service
public class CampDBServiceImpl implements CampDBService {

	@Autowired
	private CampDBMapper campDBMapper;
	
	@Override
	public List<CampDBDto> selectList() {
		return campDBMapper.selectList();
	}

	@Override
	public CampDBDto selectOne(String camp_id) {
		return campDBMapper.selectOne(camp_id);
	}

	@Override
	public int insert(CampDBDto dto) {
		return campDBMapper.insert(dto);
	}

}
