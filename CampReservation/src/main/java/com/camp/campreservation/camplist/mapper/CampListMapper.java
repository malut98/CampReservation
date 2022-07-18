package com.camp.campreservation.camplist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.camp.campreservation.campdb.dto.CampDBDto;

@Mapper
public interface CampListMapper {
	
	@Select(" SELECT * FROM CAMP WHERE CAMP_SE LIKE '일반야영장%' ")
	List<CampDBDto> campList();
	
	@Select(" SELECT * FROM CAMP WHERE CAMP_SE LIKE '%글램핑%' ")
	List<CampDBDto> glamList();
	
	@Select(" SELECT * FROM CAMP WHERE CAMP_SE LIKE '%카라반%' ")
	List<CampDBDto> caravanList();
}
