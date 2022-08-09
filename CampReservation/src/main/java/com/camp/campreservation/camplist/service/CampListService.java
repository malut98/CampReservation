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
	int selectPetCount();
	List<CampDBDto> getAllList(Model model,String pagenum, String contentnum);
	List<CampDBDto> getBestList(Model model,String pagenum, String contentnum);
	List<CampDBDto> getCampList(Model model,String pagenum, String contentnum);
	List<CampDBDto> getGlamList(Model model,String pagenum, String contentnum);
	List<CampDBDto> getCaravanList(Model model,String pagenum, String contentnum);
	List<CampDBDto> getPetList(Model model,String pagenum, String contentnum);
	
	CampDBDto campDetail(int camp_id);
	List<CampDBDto> campRecommen(int camp_id, String camp_se);
	List<CampImgDto> campImg(int camp_id);
	
	int searchAllCount(String key);
	List<CampDBDto> searchAll(Model model,String key,String pagenum, String contentnum);
	
	int searchCampCount(String key, String name);
	List<CampDBDto> searchCamp(Model model,String key,String pagenum, String contentnum, String name);

}
