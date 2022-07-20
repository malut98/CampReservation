package com.camp.campreservation.camplist.service;

import java.util.List;

import org.springframework.ui.Model;

import com.camp.campreservation.campdb.dto.CampDBDto;

public interface CampListService {
	int selectCampCount();
	List<CampDBDto> getCampList(Model model,String pagenum, String contentnum);
	List<CampDBDto> glamList();
	List<CampDBDto> caravanList();
	CampDBDto campDetail(int camp_id);
}
