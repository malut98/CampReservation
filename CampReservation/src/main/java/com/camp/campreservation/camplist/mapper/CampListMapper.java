package com.camp.campreservation.camplist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.camp.campreservation.campdb.dto.CampDBDto;
import com.camp.campreservation.campimg.dto.CampImgDto;

@Mapper
public interface CampListMapper {
	
	@Select(" SELECT count(*) FROM CAMP")
	int selectAllCount();
	
	@Select(" SELECT count(*) FROM CAMP WHERE CAMP_SE LIKE '일반야영장%'")
	int selectCampCount();
	
	@Select(" SELECT count(*) FROM CAMP WHERE CAMP_SE LIKE '%글램핑%'")
	int selectGlamCount();
	
	@Select(" SELECT count(*) FROM CAMP WHERE CAMP_SE LIKE '%카라반%'")
	int selectCaravanCount();
	
	@Select("SELECT * FROM CAMP LIMIT #{pagenum}, #{contentnum} ")
	List<CampDBDto> getAllList(int pagenum, int contentnum);
	
	@Select("SELECT * FROM CAMP WHERE CAMP_SE LIKE '일반야영장%' LIMIT #{pagenum}, #{contentnum} ")
	List<CampDBDto> getCampList(int pagenum, int contentnum);
	
	@Select(" SELECT * FROM CAMP WHERE CAMP_SE LIKE '%글램핑%' LIMIT #{pagenum}, #{contentnum}")
	List<CampDBDto> getGlamList(int pagenum, int contentnum);
	
	@Select(" SELECT * FROM CAMP WHERE CAMP_SE LIKE '%카라반%' LIMIT #{pagenum}, #{contentnum}")
	List<CampDBDto> getCaravanList(int pagenum, int contentnum);
	
	@Select(" SELECT * FROM CAMP WHERE CAMP_ID = #{camp_id} ")
	CampDBDto campDetail(int camp_id);
	
	@Select(" SELECT * FROM CAMP WHERE CAMP_SE LIKE '%${camp_se}%' AND NOT CAMP_ID = ${camp_id} ")
	List<CampDBDto> campRecommen(int camp_id, String camp_se);
	
	@Select(" SELECT * FROM CAMP_IMAGE WHERE CAMP_ID = #{camp_id} ")
	List<CampImgDto> campImg(int camp_id);
	
	@Select(" SELECT COUNT(*) FROM CAMP WHERE CAMP_NAME LIKE '%${key}%' ")
	int searchAllCount(String key);
	
	@Select(" SELECT * FROM CAMP WHERE CAMP_NAME LIKE '%${key}%' LIMIT #{pagenum}, #{contentnum} ")
	List<CampDBDto> searchAll(String key, int pagenum, int contentnum);
	
	@Select(" SELECT COUNT(*) FROM CAMP WHERE CAMP_SE LIKE '${name}%' AND CAMP_NAME LIKE '%${key}%' ")
	int searchCampCount(String key, String name);
	
	@Select(" SELECT * FROM CAMP WHERE CAMP_SE LIKE '%${name}%' AND CAMP_NAME LIKE '%${key}%' LIMIT #{pagenum}, #{contentnum} ")
	List<CampDBDto> searchCamp(String key, int pagenum, int contentnum, String name);
}