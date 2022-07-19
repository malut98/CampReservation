package com.camp.campreservation.Service;

import java.util.List;

import com.camp.campreservation.campdb.dto.CampDBDto;

public interface IndexService {
	public List<CampDBDto> selectList();
}
