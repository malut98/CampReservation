package com.camp.campreservation.campdb.service;

import java.util.List;

import com.camp.campreservation.campdb.dto.CampDBDto;
import com.camp.campreservation.campimg.dto.CampImgDto;

public interface CampDBService {
	public List<CampDBDto> selectList();
	public CampDBDto selectOne(int camp_id);
	public int insert(CampDBDto dto);
	public int imginsert(CampImgDto dto);
	public int campAdd(CampDBDto dto);
}
