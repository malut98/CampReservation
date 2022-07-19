package com.camp.campreservation.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.camp.campreservation.campdb.dto.CampDBDto;

@Mapper
public interface IndexMapper {
	@Select("select *  FROM CAMP WHERE CAMP_IMG is NOT  null LIMIT 8;" )
	public List<CampDBDto> campList();
}
