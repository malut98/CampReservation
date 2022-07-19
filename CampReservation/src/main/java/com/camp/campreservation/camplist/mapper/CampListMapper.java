package com.camp.campreservation.camplist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.ui.Model;

import com.camp.campreservation.Dto.CommunityDto;
import com.camp.campreservation.campdb.dto.CampDBDto;

@Mapper
public interface CampListMapper {
	
	@Select(" SELECT count(*) FROM CAMP WHERE CAMP_SE LIKE '일반야영장%'")
	public int selectCampCount();
	
	@Select("SELECT * FROM CAMP WHERE CAMP_SE LIKE '일반야영장%' limit #{pagenum}, #{contentnum} ")
	public List<CampDBDto> getCampList(Model model,String pagenum, String contentnum);
	
	@Select(" SELECT * FROM CAMP WHERE CAMP_SE LIKE '%글램핑%' ")
	List<CampDBDto> glamList();
	
	@Select(" SELECT * FROM CAMP WHERE CAMP_SE LIKE '%카라반%' ")
	List<CampDBDto> caravanList();
	
	@Select(" SELECT * FROM CAMP WHERE CAMP_SE LIKE '일반야영장%' limit #{pagenum}, #{contentnum}")
	public List<CampDBDto> testlist(int pagenum, int contentnum);
}
