package com.camp.campreservation.campdb.service;

import java.util.List;

import com.camp.campreservation.campdb.dto.CampDBDto;

public interface CampDBService {
	public List<CampDBDto> selectList();
	public CampDBDto selectOne(String camp_id);
	public int insert(CampDBDto dto);
}
