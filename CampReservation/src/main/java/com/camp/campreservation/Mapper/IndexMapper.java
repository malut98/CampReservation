package com.camp.campreservation.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.camp.campreservation.campdb.dto.CampDBDto;

@Mapper
public interface IndexMapper {
	@Select("SELECT *  FROM CAMP WHERE CAMP_IMG IS NOT NULL LIMIT 8;" )
	public List<CampDBDto> campList();
	
	@Select("SELECT * FROM CAMP WHERE CAMP_NAME LIKE '%${keyword}%' LIMIT #{pagenum}, #{contentnum}")
	List<CampDBDto> serchList(String keyword,int pagenum, int contentnum);

	@Select("SELECT COUNT(*) FROM CAMP WHERE CAMP_NAME LIKE '%${keyword}%' ")
	public int countArticle(String keyword);
	
	
}
