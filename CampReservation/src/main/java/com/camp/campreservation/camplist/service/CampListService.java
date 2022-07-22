package com.camp.campreservation.camplist.service;

import java.util.List;

import org.springframework.ui.Model;

import com.camp.campreservation.campdb.dto.CampDBDto;
import com.camp.campreservation.campimg.dto.CampImgDto;

public interface CampListService {
	int selectAllCount();
	int selectCampCount();
	int selectGlamCount();
	int selectCaravanCount();
	List<CampDBDto> getAllList(Model model,String pagenum, String contentnum);
	List<CampDBDto> getCampList(Model model,String pagenum, String contentnum);
	List<CampDBDto> getGlamList(Model model,String pagenum, String contentnum);
	List<CampDBDto> getCaravanList(Model model,String pagenum, String contentnum);
	CampDBDto campDetail(int camp_id);
	List<CampImgDto> campImg(int camp_id);
}
