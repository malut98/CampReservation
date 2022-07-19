package com.camp.campreservation.camplist.service;

import java.util.List;

import com.camp.campreservation.campdb.dto.CampDBDto;

public interface CampListService {
	int selectCampCount(CampDBDto param);
	List<CampDBDto> getCampList(CampDBDto params);
	List<CampDBDto> glamList();
	List<CampDBDto> caravanList();
}
