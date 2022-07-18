package com.camp.campreservation.camplist.service;

import java.util.List;

import com.camp.campreservation.campdb.dto.CampDBDto;

public interface CampListService {
	List<CampDBDto> campList();
	List<CampDBDto> glamList();
	List<CampDBDto> caravanList();
}
